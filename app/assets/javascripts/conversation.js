$(document).on('ready page:load', function () {

    $('.message-history').on('click', function(event){
    	event.preventDefault();
    	// create menu variables
    	var slideoutList = $('.list-container');
        var mostRecentMessage = $('.most-recent-message');


        if (slideoutList.hasClass("open")) {
            slideoutList.removeClass("open");
            mostRecentMessage.removeClass("close");
        }else{
            slideoutList.toggleClass("open");
            mostRecentMessage.toggleClass("close");
        }
    });

});