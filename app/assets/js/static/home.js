const changeBackGroundOnScroll = () => {
  $(window).on("scroll", function (event) {
    const windowHeight = $(window).height();
    let scrollPos = $(this).scrollTop();
    if (scrollPos > windowHeight * 2 && scrollPos < 3 * windowHeight) {
      $("main").removeClass("bg-community ").addClass("bg-computer");
    } else if (scrollPos > 3.5 * windowHeight && scrollPos < 5 * windowHeight) {
      $("main").removeClass("bg-computer").addClass("bg-problem");
    } else {
      $("main").removeClass("bg-problem").addClass("bg-community");
    }
  });
};

changeBackGroundOnScroll();