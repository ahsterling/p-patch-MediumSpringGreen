// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets

//= require_tree .

$(function() {
  $( "#event_datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});

  $(".forecast").hide();

  $(".close-forecast").hide();

  $(".expand-forecast").click( function() {
    $(".forecast").slideDown();
    $(".expand-forecast").hide();
    $(".close-forecast").show();
    // $(".expand-forecast").toggleClass("close-forecast expand-forecast");
  });

  $(".close-forecast").click(function() {
    $(".forecast").slideUp();
    $(".close-forecast").hide();
    $(".expand-forecast").show();
  });

  $("#available-tools-list").find(".unavailable").hide();
  $("#unavailable-tools-list").find(".available").hide();

  $(".check-out").click(function(e) {
    e.preventDefault();
    var $btn = $(this);
    var $form = $btn.parents("form");
    var $url = $btn.parents("form").attr("action");
    var $tool = $form.parents("tr");
    var $id = $tool.attr("id");
    console.log($id);
    var $name = $tool.children(".tool-name").html();
    var $status = $tool.children(".tool-status").html();
    var $table = $("#unavailable-tools-list");

    $.ajax($url,  {
      type: "POST",
      data: $form.serialize(),
      success: function() {
        console.log("tool checked out");
        $tool.removeClass("available");
        $tool.addClass("unavailable");
        console.log($tool);
        $tool.hide();
        var $updatedTool = $table.find("#" + $id);
        var button = '<form action="/tools/3" class="button_to" method="post"><div><input class="btn btn-danger check-in" type="submit" value="Return this tool!"><input name="authenticity_token" type="hidden" value="ecser3wJTag745oPo8bMUGKWItoSjG1LaJWBhjljVoI="><input name="status" type="hidden" value="in"></div></form>';
        console.log($updatedTool.html());
        $updatedTool.find(".tool-status").html("<td class='tool-status'>out</td>");
        $updatedTool.show();
      }
    });
  });

  $(".check-in").click(function(e) {
    e.preventDefault();
    e.preventDefault();
    var $btn = $(this);
    var $form = $btn.parents("form");
    var $url = $btn.parents("form").attr("action");
    var $tool = $form.parents("tr");
    var $id = $tool.attr("id");

    var $name = $tool.children(".tool-name").html();
    var $status = $tool.children(".tool-status").html();
    var $table = $("#available-tools-list");

    $.ajax($url,  {
      type: "POST",
      data: $form.serialize(),
      success: function() {

        console.log("tool checked in");
        $tool.removeClass("unavailable");
        $tool.addClass("available");
        console.log($tool);
        $tool.hide();
        var $updatedTool = $table.find("#" + $id);
        var button = '<form action="/tools/3" class="button_to" method="post"><div><input class="btn btn-danger check-in" type="submit" value="Check me out!"><input name="authenticity_token" type="hidden" value="ecser3wJTag745oPo8bMUGKWItoSjG1LaJWBhjljVoI="><input name="status" type="hidden" value="in"></div></form>';
        console.log($updatedTool.html());
        $updatedTool.find(".tool-status").html("<td class='tool-status'>in</td>");
        $updatedTool.show();

      }
    });

  });


});
