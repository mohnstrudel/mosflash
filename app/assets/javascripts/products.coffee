# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#fileuploads').fileupload()
	add: (e, data) ->
	    data.context = $("#submit-data")
	    data.submit()

    $('li a').click (event) ->
        # event.preventDefault()
        $('a').removeClass('active')
        $(this).addClass('active')

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
        current_value = parseInt( $('#priceValue').text(), 10)
        multiplier = get_multiplier()
        eventPrices = new Array()
        $('input[name=addservices]:checked').each ->
            amount = parseInt( $(this).val(), 10)
            eventPrices.push(amount)
        
        if eventPrices.length > 0
            sum = eventPrices.reduce((a,b) => a+b)
        else
            sum = 0
        # console.log(sum)
        
        $('#priceValue').text(sum + selected_value * multiplier)
    
    $('input[name=addservices]').change (event) ->
        amount = parseInt( $(this).val(), 10)
        current_value = parseInt( $('#priceValue').text(), 10)
        # console.log(amount)
        # console.log(current_value)
        if (this.checked)
            $('#priceValue').text(current_value + amount)
        else
            $('#priceValue').text(current_value - amount)
        

    $('#amount').on('input', (event) ->
        amount = $(this).val()
        multiplier = get_multiplier()

        selected_value = $('input[name=volume]:checked').val()

        eventPrices = new Array()
        $('input[name=addservices]:checked').each ->
            amount = parseInt( $(this).val(), 10)
            eventPrices.push(amount)
        
        if eventPrices.length > 0
            sum = eventPrices.reduce((a,b) => a+b)
        else
            sum = 0
        # console.log(sum)
        
        $('#priceValue').text(sum + selected_value * multiplier)
    )


		
    		
