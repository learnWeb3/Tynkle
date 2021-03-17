var quillDocument = new Quill("#editor", {
    theme: "snow",
    readOnly: true,
    modules: {
      toolbar: false
  }
});

quillDocument.setContents(content);
