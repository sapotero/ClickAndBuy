$(document).ready(function(){jQuery("ul.nav li.dropdown").hover(function(){jQuery(this).find(".dropdown-menu").stop(!0,!0).delay(200).fadeIn()},function(){jQuery(this).find(".dropdown-menu").stop(!0,!0).delay(200).fadeOut()}),$("[rel=tooltip]").tooltip(),$("[data-rel=tooltip]").tooltip(),$(".carousel").carousel({interval:!1}),$(".hover_img, .hover_colour").on("mouseover",function(){var o=$(this).find("img");o.stop().animate({opacity:.1},500)}),$(".hover_img, .hover_colour").on("mouseout",function(){var o=$(this).find("img");o.stop().animate({opacity:1},800)}),$(window).scroll(function(){$(this).scrollTop()>200?$(".go-top").fadeIn(200):$(".go-top").fadeOut(200)}),$(".go-top").click(function(o){o.preventDefault(),$("html, body").animate({scrollTop:0},300)})}),$(function(){$(".welcome").show().addClass("animated fadeInDown"),$(".welcome_index").show().addClass("animated fadeInDown"),$(".intro_sections h6").show().addClass("animated fadeInUp"),$(".fadeinup").show().addClass("animated fadeInUp"),$(".fadeindown").show().addClass("animated fadeInDown")}),$("a[data-rel]").each(function(){$(this).attr("rel",$(this).attr("data-rel")).removeAttr("data-rel")}),$("a[rel^='prettyPhoto']").prettyPhoto(),jQuery("a[rel^='prettyPhoto'], a[rel^='lightbox']").prettyPhoto({overlay_gallery:!1,social_tools:!1,deeplinking:!1});