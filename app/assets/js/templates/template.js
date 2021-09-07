import { ROOT_PATH } from "../API_CLIENT/index.js";

AOS.init();
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

const eventSource = new EventSource(ROOT_PATH + "/users/stream");

eventSource.onmessage = function (message) {
  const msgData = JSON.parse(message.data);
  console.log(msgData);
  // if (msgData.length > 0) {
  //     const isMessagePresent = document.querySelector('#message-' + msgData[0].message_id);
  //     if (!isMessagePresent) {
  //         messages_container.append(getMessageTemplate(msgData[0], current_user));
  //         messages_container[0].scroll({
  //             top: messages_container[0].scrollTopMax,
  //             behavior: 'smooth'
  //         });
  //     }
  // }
};
eventSource.onerror = function (error) {
  console.error("Event stream has encoutered an unexpected error");
};
eventSource.onopen = function (event) {
  console.log("Event stream initialized");
};
