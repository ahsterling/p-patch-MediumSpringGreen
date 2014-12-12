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

  $(".check-out").click(function(e) {
    e.preventDefault();
    var $btn = $(this);
    var $form = $btn.parents("form");
    console.log($form);
    var $url = $btn.parents("form").attr("action");
    console.log($url);
    var $tool = $form.parents("tr");
    console.log($tool);
    var $name = $tool.children(".tool-name").html();
    console.log($name);
    var $status = $tool.children(".tool-status").html();
    console.log($status);

    var $table = $("#unavailable-tools-list");
    console.log($table);

    $.ajax($url,  {
      type: "POST",
      data: $form.serialize(),
      success: function() {
        console.log("tool checked out");
        $tool.hide();
        
        $table.append("<tr class='unavailable-tool'><td>" + $name + "</td><td>" + $status + "</td></tr>");
      }
    });
  });


});
