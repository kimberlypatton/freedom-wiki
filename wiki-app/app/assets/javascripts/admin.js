$(document).ready(function () {

  var active_tab_id = $("ul").find("li.active > span").attr('tab');
  $(active_tab_id).show();
  $("li").click(change_tab);

  function change_tab() {
    $(this).siblings().removeClass("active");
    $(this).addClass().addClass("active");

    $("div.tab-content").hide();
    var id = $(this).children(":first").attr('tab');
    $(id).show();
  }
});
