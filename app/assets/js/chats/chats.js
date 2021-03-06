import { getMessages, ROOT_PATH, sendmessage } from "../API_CLIENT/index.js";
import { current_user, setCurrentUserId } from "../commons/current_user.js";
import { getChatTemplate, getMessageTemplate, getTypingAreaTemplate } from "../templates/templates.js";


const handleSubmit = (formButton, input, subscribers) => formButton.addEventListener('click', async function (event) {
  event.preventDefault();
  const content = input.value;
  const data = {
    content,
    subscribers
  };
  const response = await sendmessage(data);
})

const streamNewChats = (messages_container) => {
  const eventSource = new EventSource(ROOT_PATH + '/chats/stream');
  eventSource.onmessage = function (message) {
    const msgData = JSON.parse(message.data);
    if (msgData.length > 0) {
      const isMessagePresent = $('#chat-' + msgData[0].id).length > 0;
      if (!isMessagePresent) {
        messages_container.append(getChatTemplate(msgData[0]));
        handleChatClick();
      }
    }}
    eventSource.onopen = function () {
      console.log('Event source initialized chats')
    }

    eventSource.onerror = function (event) {
      console.error(event)
    }

  }


  const streamMessages = (chat_id, messages_container, current_user) => {
    const eventSource = new EventSource(ROOT_PATH + '/chats/' + chat_id + '/stream');
    eventSource.onmessage = function (message) {
      const msgData = JSON.parse(message.data);
      if (msgData.length > 0) {
        const isMessagePresent = document.querySelector('#message-' + msgData[0].message_id);
        if (!isMessagePresent) {
          messages_container.append(getMessageTemplate(msgData[0], current_user));
          messages_container[0].scroll({
            top: messages_container[0].scrollTopMax,
            behavior: 'smooth'
          });
        }
      }
    };
    eventSource.onerror = function (error) {
      console.error('Event stream has encoutered an unexpected error');
    };
    eventSource.onopen = function (event) {
      console.log('Event stream initialized');
    };
  }



  const handleChatClick = () =>  $(".message").on("click", async function (event) {
    event.preventDefault();
    const url = $(this).data("url");
    const messagesContainer = $("#messages-container");
    const generalContainer = $("#general-container");
    const typingZone = $('#new-message');
    typingZone.remove();
    messagesContainer.html('');
    const { status, data } = await getMessages(url);
    if (status === 200) {
      const { messages, chat } = data;
      generalContainer.append(
        getTypingAreaTemplate(chat.subscriber_ids, chat.id, current_user.id)
      );
      messages.map((message) =>
        messagesContainer.append(getMessageTemplate(message, current_user))
      );
      const formButton = document.querySelector('#new-message button');
      const input = document.querySelector('#new-message input');
      const subscribers = input.dataset.subscibersids.split(',');
      const messages_container = $('#messages-container')
      handleSubmit(formButton, input, subscribers);
      streamMessages(chat.id, messages_container, current_user)
    }
  });


  // getting current user
  setCurrentUserId(current_user);
  streamNewChats($('.messages-box .list-group'));
  handleChatClick();