// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

////////////////////////////*APPLICATION WIZARD*/////////////////////////

/*Application Wizard Form Validation*/

$('.next-tab').click(function( event ){
	event.preventDefault();
	$next_tab = $('#order_tabs > .active').next('li');
	$('#order_tabs > .active').next('li').removeClass('disabled').find('a').trigger('click');
  	$previous_tab = $('#order_tabs > .active').prev('li');

  	var id_prev = $previous_tab.attr('id');
  	var id_next = $next_tab.attr('id');
  	// console.log('#'.concat(id_prev));
  	$('#'.concat(id_prev).concat('_tab')).hide();
  	$('#'.concat(id_next).concat('_tab')).show();
});


$('.prev-tab').click(function( event ){
	event.preventDefault();
	
	$previous_tab = $('#order_tabs > .active').prev('li');
	$('#order_tabs > .active').prev('li').find('a').trigger('click');
	$current_tab = $('#order_tabs > .active').next('li');
	

  	var id_prev = $previous_tab.attr('id');
  	var id_next = $next_tab.attr('id');
  	// console.log('#'.concat(id_prev));
  	$('#'.concat(id_prev).concat('_tab')).show();
  	$('#'.concat(id_next).concat('_tab')).hide();

});