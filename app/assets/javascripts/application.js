// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
var APP = APP || {};

APP = {
  common: {
    init: function() {
			// $(document).foundationTopBar();
			// $(document).foundationTopBar();
      $("a.check-in")
        .bind("ajax:beforeSend", function(e, xhr) {
          var $target = $(e.target).parent("span.check_in");
          var eventClass = $target.attr("class").split(" ")[1];

          $target.html("<i class=\"fi-check\"></i> Checked In");

          $("#" + eventClass + " span.check_in").each( function() {
            $(this).html("<i class=\"fi-check\"></i> Checked In");
          });
        });
    }
  },
  home: {
    init: function() {

    },
    index: function() {

		},
    dashboard: function() {
			$("form.button_to")
				.bind("ajax:beforeSend", function(e, xhr) {
          $(e.target).parent("span.check_in")
            .html("<i class=\"fi-check\"></i> Checked In");
				});
    },
    beta: function() {
      $("#beta_signup .activated")
        .bind("ajax:beforeSend", function(e, xhr) {
          var thank_you_div = "<div id=\"beta_thank_you\" " +
                              "class=\"large-8 columns large-centered " +
                              "text-center panel\">\n" +
                              "<h5>Thank you for signing up!</h5>\n" +
                              "<p>We'll be in touch soon " +
                              "with more information.</p>\n" +
                              "</div>";
          $(e.target).closest("div.row").html(thank_you_div);
        });
    }
  },
  projects: {
		index: function() {
			$("form.button_to")
				.bind("ajax:beforeSend", function(e, xhr) {
					$(e.target).parent("span.favorite").html('<a href="/dashboard"><i class="fi-star"></i></a>');
				});
		}
	}
}
UTIL = {
  exec : function(controller, action){
    var ns = APP,
    action = (action === undefined) ? "init" : action;

    if (controller !== "" &&
      ns[controller] &&
      typeof ns[controller][action] === "function" ) {
      ns[controller][action]();
    }
  },
  init: function() {
    var body = document.body,
    controller = body.getAttribute("data-controller"),
    action = body.getAttribute("data-action");
    UTIL.exec("common");
    UTIL.exec(controller);
    UTIL.exec(controller, action);
  }
};

//document.observe("dom:loaded", UTIL.init); //prototype
$(document).ready(UTIL.init); //jquery
$(function(){ $(document).foundation(); });

//scroll to top
$(window).scroll(function () {
  if ($(this).scrollTop() > 100) {
    $(".scrollup").fadeIn();
  } else {
    $(".scrollup").fadeOut();
  }
});
$(".scrollup").click(function () {
  $("html, body").animate({
    scrollTop: 0
  }, 600);
  return false;
});
