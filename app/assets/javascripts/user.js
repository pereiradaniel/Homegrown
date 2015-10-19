$(document).on('ready page:load', function () {

    $('.show-all').on('click', function(event){
    	event.preventDefault();
    	// create menu variables
        var clickedElem = $(this);
        var slideoutList = $(this).next();


        if (slideoutList.hasClass("open")) {
            slideoutList.removeClass("open");
        }else{
            slideoutList.toggleClass("open");
        }
    });

});