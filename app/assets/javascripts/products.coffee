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

    get_multiplier = ->
        amount = $('#amount').val()
        multiplier = 1.5
        multiplier = switch
            when amount <= 99 then multiplier = 1.5
            when amount >= 100 and amount < 300 then multiplier = 1.4
            when amount >= 300 and amount < 500 then multiplier = 1.3
            when amount >= 500 and amount < 1000 then multiplier = 1.25
            when amount >= 1000 and amount < 3000 then multiplier = 1.23
            when amount >= 3000 and amount < 7000 then multiplier = 1.2
        return multiplier

    $('.size_input').click (event) ->
        selected_value = $('input[name=volume]:checked').val()
        multiplier = get_multiplier()
        $('#priceValue').text(selected_value * multiplier)
    
    $('#amount').on('input', (event) ->
        amount = $(this).val()
        multiplier = get_multiplier()

        selected_value = $('input[name=volume]:checked').val()
        $('#priceValue').text(selected_value * multiplier)
    )
		
    		
