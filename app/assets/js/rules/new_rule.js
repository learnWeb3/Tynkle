import { saveRule } from "../API_CLIENT/index.js";
import { getAlertTemplate } from "../templates/templates.js";
import { handleDismissAlert } from "../commons/flash.js";

const toolbarOptions = [
  ["bold", "italic", "underline", "strike", "link", "image"], // toggled buttons
  ["blockquote", "code-block"],

  [{ header: 1 }, { header: 2 }], // custom button values
  [{ list: "ordered" }, { list: "bullet" }],
  [{ script: "sub" }, { script: "super" }], // superscript/subscript
  [{ indent: "-1" }, { indent: "+1" }], // outdent/indent
  [{ direction: "rtl" }], // text direction

  [{ size: ["small", false, "large", "huge"] }], // custom dropdown
  [{ header: [1, 2, 3, 4, 5, 6, false] }],

  [{ color: [] }, { background: [] }], // dropdown with defaults from theme
  [{ font: [] }],
  [{ align: [] }],

  ["clean"], // remove formatting button
];

export const toBase64 = (file) =>
  new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = (error) => reject(error);
  });

const handleSaveDocument = (quillDocument) => {
  document
    .querySelector("#save-rule")
    .addEventListener("click", async function (event) {
      event.preventDefault();
      const inputs = {
        content: JSON.stringify(quillDocument.getContents()),
      };
      const { status, data } = await saveRule(inputs);
      if (status === 200) {
        $("body").append(
          getAlertTemplate(
            ["Votre document à été sauvegardé avec succès"],
            "success"
          )
        );
      } else {
        $("body").append(
          getAlertTemplate(
            ["Erreur lors de la sauvegarde du document"],
            "danger"
          )
        );
      }
      handleDismissAlert();
    });
};

// quill editor initialization
var quillDocument = new Quill("#editor", {
  modules: {
    toolbar: toolbarOptions,
  },
  theme: "snow",
  placeholder: "Commencer à rediger les conditions d'utilisation",
});

// save quill document to database as json object
handleSaveDocument(quillDocument);
