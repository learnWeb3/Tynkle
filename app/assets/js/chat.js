import { sendmessage, ROOT_PATH, deletemessage } from "./API_CLIENT/index.js";
import { getMessageTemplate } from "./templates.js";

const handleSubmit = (formButton, input, subscribers) => formButton.addEventListener('click', async function (event) {
    event.preventDefault();
    const content = input.value;
    const data = {
        content,
        subscribers
    };
    const response = await sendmessage(data);
})


const updateMessageCount = (isAdded) => {
    const message_count_container = document.querySelector("#message-count");
    const message_count = parseInt(message_count_container.innerHTML);
    isAdded === -1 ? message_count_container.innerHTML = message_count - 1 : message_count_container.innerHTML = message_count + 1
}

const deleteMessage = (cssSelector) => {
    Array.from(document.querySelectorAll(cssSelector)).map((element) => element.addEventListener('click', async function (event) {
        event.preventDefault();
        const targetedMessage = event.target.parentNode;
        const response = await deletemessage(targetedMessage.dataset.id);
        if (response.status === 204) {
            targetedMessage.remove();
            updateMessageCount(-1);
        }
    }))
}
const streamMessages = (chat_id, current_chat_container, messages_container, current_user) => {
    const eventSource = new EventSource(ROOT_PATH + '/chats/' + chat_id + '/stream');
    eventSource.onmessage = function (message) {
        const msgData = JSON.parse(message.data);
        console.log(msgData)
        if (msgData.length > 0) {
            const isMessagePresent = document.querySelector('#message-' + msgData[0].id_message);
            if (!isMessagePresent) {
                const newMessage = document.createElement('div');
                const senderOrRecipient = current_user === msgData[0].id_user ? 'sender' : 'recipient';
                newMessage.classList.add('card-message', 'col-12', 'col-lg-8', 'p-4', 'my-2', 'shadow-sm', 'flex-column', 'd-flex', senderOrRecipient);
                newMessage.setAttribute('id', `message-${msgData[0].id_message}`);
                newMessage.setAttribute('data-id', msgData[0].id_message);
                newMessage.innerHTML = getMessageTemplate(msgData[0], current_user);
                messages_container.appendChild(newMessage);
                updateMessageCount(1);
                current_chat_container.scroll({
                    top: current_chat_container.scrollTopMax,
                    behavior: 'smooth'
                });
                deleteMessage('.delete-message');
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

window.addEventListener('DOMContentLoaded', async function (event) {
    const current_chat_container = document.querySelector("#current-chat-container");
    const messages_container = document.querySelector("#messages-container");
    const input = document.querySelector('#new_message input');
    const chat_id = input.dataset.id
    const subscribers = input.dataset.subscibersids.split(',');
    const current_user = input.dataset.current;
    const form = document.querySelector('#new_message');
    const formButtonSubmit = document.querySelector('#new_message_submit');
    await handleSubmit(formButtonSubmit, input, subscribers);
    deleteMessage('.delete-message')
    streamMessages(chat_id, current_chat_container, messages_container, current_user);
});