import { updateRule } from "../API_CLIENT/index.js";
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

const handleSaveDocument = (quillDocument, id) => {
  document
    .querySelector("#save-rule")
    .addEventListener("click", async function (event) {
      event.preventDefault();
      const content = quillDocument.getContents();
      const { status, data } = await updateRule(
        {
          content: JSON.stringify(content),
        },
        id
      );
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

var quillDocument = new Quill("#editor", {
  theme: "snow",
  readOnly: false,
  modules: {
    toolbar: toolbarOptions,
  },
});

quillDocument.setContents(content);
handleSaveDocument(quillDocument, id);
