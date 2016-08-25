$(document).ready(function () {
  // Put your JavaScript behavior here

  function change_tab() {
    $(this).siblings().removeClass("active");
    $(this).addClass().addClass("active");

    $("div.tab-content").hide();
    var id = $(this).children(":first").attr('href');
    $(id).show();
  }

  var active_tab_id = $("ul").find("li.active > span").attr('href');
  $(active_tab_id).show();
  $("li").click(change_tab);

});
