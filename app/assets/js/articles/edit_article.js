import { updateArticle } from "../API_CLIENT/index.js";
import { getAlertTemplate } from "../templates/templates.js";
import { handleDismissAlert } from "../commons/flash.js";
import { toBase64 } from "../articles/new_article.js";

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
    .querySelector("#save-article")
    .addEventListener("click", async function (event) {
      event.preventDefault();
      const content = quillDocument.getContents();
      const cover_image =
        document.querySelector("#cover_image").files.length > 0
          ? document.querySelector("#cover_image").files[0]
          : document.querySelector("#cover_image").dataset.image;
      const title = $("#title").val().length > 0 ? $("#title").val() : null;
      const description =
        $("#description").val().length > 0 ? $("#description").val() : null;

      if (cover_image && title && description) {
        const base64CoverImage =
          document.querySelector("#cover_image").files.length > 0
            ? await toBase64(cover_image)
            : cover_image;
        const { status, data } = await updateArticle(
          {
            content: JSON.stringify(content),
            cover_image: base64CoverImage,
            title,
            description,
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
      } else {
        $("body").append(
          getAlertTemplate(
            ["Erreur lors de la sauvegarde du document"],
            "danger"
          )
        );

        handleDismissAlert();
      }
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
