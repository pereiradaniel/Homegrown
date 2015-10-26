$(document).ready(function() {

	$("#logout").click(function () {
		$.removeCookie('latitude', { path: '/' });
		$.removeCookie('longitude', { path: '/' });
	});

});