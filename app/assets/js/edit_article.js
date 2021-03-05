import { updateArticle } from "./API_CLIENT/index.js";
import { getAlertTemplate } from "./templates.js";
import { handleDismissAlert } from "./flash.js";

const toolbarOptions = [
  ["bold", "italic", "underline", "strike", "link", "image"], // toggled buttons
  ["blockquote", "code-block"],

  [
    {
      header: 1,
    },
    {
      header: 2,
    },
  ], // custom button values
  [
    {
      list: "ordered",
    },
    {
      list: "bullet",
    },
  ],
  [
    {
      script: "sub",
    },
    {
      script: "super",
    },
  ], // superscript/subscript
  [
    {
      indent: "-1",
    },
    {
      indent: "+1",
    },
  ], // outdent/indent
  [
    {
      direction: "rtl",
    },
  ], // text direction

  [
    {
      size: ["small", false, "large", "huge"],
    },
  ], // custom dropdown
  [
    {
      header: [1, 2, 3, 4, 5, 6, false],
    },
  ],

  [
    {
      color: [],
    },
    {
      background: [],
    },
  ], // dropdown with defaults from theme
  [
    {
      font: [],
    },
  ],
  [
    {
      align: [],
    },
  ],

  ["clean"], // remove formatting button
];

const toolbarImageOptions = [["image"]];

const handleSaveDocument = (quillDocument, quillImage, id) => {
  document
    .querySelector("#save-article")
    .addEventListener("click", async function (event) {
      event.preventDefault();
      const content = quillDocument.getContents();
      const cover_image = quillImage.getContents();
      const title = $("#title").val();
      const description = $("#description").val();

      console.log( {
        content: JSON.stringify(content),
        cover_image: JSON.stringify(cover_image),
        title,
        description,
      });
      if (
        cover_image.ops[0].insert !== "\n" &&
        title !== "" &&
        description !== ""
      ) {
        const { status, data } = await updateArticle(
          {
            content: JSON.stringify(content),
            cover_image: JSON.stringify(cover_image),
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
var quillImage = new Quill("#image", {
  theme: "snow",
  readOnly: false,
  modules: {
    toolbar: toolbarImageOptions,
  },
});
quillDocument.setContents(content);
quillImage.setContents(coverImage);
handleSaveDocument(quillDocument, quillImage, id);
