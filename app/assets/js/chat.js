import { sendmessage, ROOT_PATH, deletemessage } from "./API_CLIENT/index.js";

const handleSubmit = async (form, input, chat_id, subscribers) => form.addEventListener('submit', async function (event) {
    event.preventDefault();
    const content = input.value;
    const data = {
        content,
        subscribers
    };
    const response = await sendmessage(data, chat_id);
})


const getTemplate = ({ id, id_chat, id_user, avatar, firstname, email, content, created_at, updated_at }) => {
    return (
        `<div class="row">
            <div class="col-1 d-flex flex-column justify-content-center">
                <img src="${ROOT_PATH}/app/assets/img/commons/avatar_placeholder.svg" height="48" width="48" alt="map pointer icon" class="img-fluid">
            </div>
            <div class="col">
                <p class="font-weight-bold mb-0">${firstname}</p>
                <p class="font-italic text-muted mb-0">${created_at}</p>
            </div>
        </div>
        <div class="row my-2">
            <p>
                ${content}
            </p>
        </div>`
    ).trim()

}

const deleteMessage = async (cssSelector) => {
    Array.from(document.querySelectorAll(cssSelector)).map((element) => element.addEventListener('click', async function (event) {
        event.preventDefault();
        const targetedMessage = event.target.parentNode;
        const response = await deletemessage(targetedMessage.dataset.id);
        response.status === 204 && targetedMessage.remove();
    }))
}
const streamMessages = (chat_id, current_chat_container, messages_container, current_user) => {
    const eventSource = new EventSource(ROOT_PATH + '/chats/' + chat_id + '/stream');
    eventSource.onmessage = function (message) {
        const msgData = JSON.parse(message.data);
        if (msgData.length > 0) {
            const isMessagePresent = document.querySelector('message-' + msgData[0].id)
            if (!isMessagePresent) {
                const newMessage = document.createElement('div');
                const senderOrRecipient = current_user === msgData[0].id_user ? 'sender' : 'recipient';
                newMessage.classList.add('card-message', 'col-12', 'col-lg-8', 'p-4', 'my-2', 'shadow-sm', senderOrRecipient);
                newMessage.setAttribute('id', `message-${msgData[0].id}`);
                newMessage.innerHTML = getTemplate(msgData[0]);
                messages_container.appendChild(newMessage);
                const message_count_container = document.querySelector("#message-count");
                const message_count = parseInt(message_count_container.innerHTML);
                message_count_container.innerHTML = message_count + 1
                current_chat_container.scroll({
                    top: current_chat_container.scrollTopMax,
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

window.addEventListener('DOMContentLoaded', async function (event) {
    const current_chat_container = document.querySelector("#current-chat-container");
    const messages_container = document.querySelector("#messages-container");
    const input = document.querySelector('#new_message input');
    const chat_id = input.dataset.id
    const subscribers = input.dataset.subscibersids.split(',');
    const current_user = input.dataset.current;
    const form = document.querySelector('#new_message');
    await handleSubmit(form, input, chat_id, subscribers);
    deleteMessage('.delete-message')
    streamMessages(chat_id, current_chat_container, messages_container, current_user);
});