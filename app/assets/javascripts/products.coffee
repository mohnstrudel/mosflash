# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#fileuploads').fileupload()
	add: (e, data) ->
	    data.context = $("#submit-data")
	    data.submit()

    $('form').on 'click', '.add_fields', (event) ->
    	time = new Date().getTime()
    	regexp = new RegExp($(this).data('id'), 'g')
    	$(this).before($(this).data('fields').replace(regexp, time))
    	event.preventDefault()

    $('.size_input').click (event) ->
        selected_value = $('input[name=volume]:checked').val()
        $('#priceValue').text(selected_value + ' руб.')
		
    		
