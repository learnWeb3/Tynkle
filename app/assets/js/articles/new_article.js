import { saveArticle } from "../API_CLIENT/index.js";
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
    .querySelector("#save-article")
    .addEventListener("click", async function (event) {
      event.preventDefault();
      const content = quillDocument.getContents();
      const cover_image = document.querySelector("#cover_image").files
        ? document.querySelector("#cover_image").files[0]
        : null;
      const title = $("#title").val().length > 0 ? $("#title").val() : null;
      const description =
        $("#description").val().length > 0 ? $("#description").val() : null;
      if (cover_image && title && description) {
        const base64CoverImage = await toBase64(cover_image);
        const inputs = {
          content: JSON.stringify(content),
          cover_image: base64CoverImage,
          title,
          description,
        };
        const { status, data } = await saveArticle(inputs);
        status === 200
          ? $("body").append(
              getAlertTemplate(
                ["Votre document à été sauvegardé avec succès"],
                "success"
              )
            )
          : $("body").append(
              getAlertTemplate(
                ["Erreur lors de la sauvegarde du document"],
                "danger"
              )
            );

        handleDismissAlert();
      } else {
        $("body").append(
          getAlertTemplate(["Tous les champs sont obligatoires"], "danger")
        );
        handleDismissAlert();
      }
    });
};

// quill editor initialization
var quillDocument = new Quill("#editor", {
  modules: {
    toolbar: toolbarOptions,
  },
  theme: "snow",
  placeholder: "Contenu de l'article",
});

// save quill document to database as json object
handleSaveDocument(quillDocument);
