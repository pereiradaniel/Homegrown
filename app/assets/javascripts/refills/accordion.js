$(document).on('ready page:load', function () {
  $('.js-accordion-trigger').on('click', function(e){
    jQuery(this).parent().find('.submenu').slideToggle('fast');  // apply the toggle to the ul
    jQuery(this).parent().toggleClass('is-expanded');
    e.preventDefault();
  });
});