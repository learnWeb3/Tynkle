import { sendContactMessage } from "./API_CLIENT/index.js";
import { getAlertTemplate } from "./templates.js";
import { handleDismissAlert } from './flash.js';

const handleSendMessage = () =>
{
    $("#contact-form button").on("click", async function (event) {
        event.preventDefault();
        const form = $(this).closest("form");
        const email = form.find("#email").val();
        const firstname = form.find("#firstname").val();
        const lastname = form.find("#lastname").val();
        const subject = form.find("#subject").val();
        const message = form.find("#message").val();
        const data = {
          email,
          firstname,
          lastname,
          subject,
          message,
        };
      
        const { data: responseData, status } = await sendContactMessage(data);
        if (status === 200) {
          $("body").append(getAlertTemplate([responseData.message], "success"));
          ['#email', '#firstname', '#lastname', '#subject', '#message'].map((id)=>form.find(id).val(''));
        } else {
          $("body").append(
            getAlertTemplate(["Erreur lors de l'envoie du message"], "danger")
          );
        }
        handleDismissAlert();
      });
}

handleSendMessage();
