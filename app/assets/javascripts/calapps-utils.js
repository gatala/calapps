var calapps = {};

(function ($) {

calapps.adjustGalleryColumnHeight = function() {
	var mainMenuHeight = $("#main-menu").height();
	var totalDocumentHeight = $(window).height();
	$(".left-column-container").height(totalDocumentHeight - mainMenuHeight);
};

})(jQuery);
