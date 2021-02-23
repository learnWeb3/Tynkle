import { ROOT_PATH, makeOffers, sendmessage } from "./API_CLIENT/index.js";

const handleNewMessage = (current_user) => {
  const modalBody = document.querySelector("#new-message .modal-body");
  const sendButton = document.querySelector(
    "#new-message .modal-footer .btn.btn-success"
  );
  const form = document.querySelector("#new-message-form");
  const formButtonSubmit = document.querySelector(
    "button#new-message-form-submit"
  );
  const input = document.querySelector("#new-message-form #content");
  formButtonSubmit.addEventListener("click", async function (event) {
    event.preventDefault();
    if (current_user.id) {
      const subscribers = [form.dataset.idauthor, current_user.id];
      const content = input.value;
      const data = {
        content,
        subscribers,
      };
      const { data: responseData, status } = await sendmessage(data);
      if (status === 200) {
        form.remove();
        const img = new Image(64, 64);
        const p = document.createElement("p");
        const text = document.createTextNode("Message envoyé avec succès");
        p.classList.add("font-weight-bold", "my-2");
        p.appendChild(text);
        img.src = ROOT_PATH + "/app/assets/icons/success.svg";
        modalBody.classList.remove("d-block", "overflow-auto");
        modalBody.classList.add(
          "d-flex",
          "justify-content-center",
          "align-items-center",
          "flex-column"
        );
        modalBody.appendChild(img);
        modalBody.appendChild(p);
        sendButton.remove();
      } else {
        console.error(responseData);
      }
    }
  });
};

const handleNewOffer = (current_user) => {
  const sendButton = document.querySelector(
    "#new-offer .modal-footer .btn.btn-success"
  );
  const modalBody = document.querySelector("#new-offer .modal-body");
  const form = document.querySelector("#new-offer-form");
  const formButtonSubmit = document.querySelector(
    "button#new-offer-form-submit"
  );
  const id_post = form.dataset.idpost;
  formButtonSubmit.addEventListener("click", async function (event) {
    event.preventDefault();
    if (current_user.id) {
      let data = {};
      const formData = new FormData(form);
      for (const pair of formData.entries()) {
        data[pair[0]] = pair[1];
      }
      data.id_post = parseInt(id_post);
      data.id_user = parseInt(current_user.id);
      const { data: responseData, status } = await makeOffers(data);
      if (status === 200) {
        form.remove();
        const img = new Image(64, 64);
        const p = document.createElement("p");
        const text = document.createTextNode("Offre envoyé avec succès");
        p.classList.add("font-weight-bold", "my-2");
        p.appendChild(text);
        img.src = ROOT_PATH + "/app/assets/icons/success.svg";
        modalBody.classList.remove("d-block", "overflow-auto");
        modalBody.classList.add(
          "d-flex",
          "justify-content-center",
          "align-items-center",
          "flex-column"
        );
        modalBody.appendChild(img);
        modalBody.appendChild(p);
        sendButton.remove();
      } else {
        console.log(responseData);
        alert("error");
      }
    }
  });
};

export { handleNewMessage, handleNewOffer };
