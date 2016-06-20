# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

    if $('a.size_input').length != 0
        $('a.size_input')[0].click()

    # $('div.box form').submit (event) ->
    #     url = $(this).attr('action')
    #     sellprice = parseInt( $('#priceValue').text(), 10)
        # console.log(url)
        # console.log(sellprice)

        # $.ajax
        #     type: 'POST'
        #     url: url
        #     data: { line_item: { sellprice: sellprice } }
        #     dataType: 'json'
        #     success: (json) ->
        #         console.log('success')

jQuery ->
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

    get_delivery = ->
        delivery = $('#delivery').val()
        return parseFloat(delivery).toFixed(2)

    get_amount = ->
        amount = $('#amount').val()
        return parseFloat(amount).toFixed(2)

    get_size = ->
        # in this method we either select the price value based on the flash
        # drive size, or, if it has a basic price, just simply the basic price
        # from the hidden #basicprice id

        selected_size = $('input[name=volume]:checked').val()
        if (selected_size == undefined)
            return parseFloat($('#basicprice')[0].innerText)
        else
            array = selected_size.split(",")[1].replace(']','')
            return parseFloat(array).toFixed(2)

    get_all_addservices = ->
        # This method delivers all checked addservice price
        # so we can first substract it before applying any multiplications
        addservices = new Array()
        addservicesParty = new Array()

        console.log('inside get all addservices:')
        checkboxes = document.getElementsByName("addservices[]")
        
        for checkbox in checkboxes

            addserviceprice_splitted = (checkbox.value).split(" ")
            # console.log(addserviceprice_splitted[2])
            
            # Here we need to check if the 'apply to whole party is true or false'
            party = addserviceprice_splitted[2]
                

            addserviceprice = parseFloat(addserviceprice_splitted[1]).toFixed(2)
            if checkbox.checked
                parsedPrice = parseFloat(addserviceprice)

                if party == 'true'
                    addservicesParty.push(parsedPrice)
                else
                    addservices.push(parsedPrice)

        if addservices.length > 0
            sum = addservices.reduce((a,b) => a+b)
        else
            sum = 0

        if addservicesParty.length > 0
            sumParty = addservicesParty.reduce((a,b) => a+b)
        else
            sumParty = 0

        console.log('Addservices combined: ' + addservices + '| Addservice to whole party: '+ addservicesParty)
        return [parseFloat(sum), parseFloat(sumParty)]

    calculate_delivery = ->
        # We recalculate delivery time based on amount of goods user has selected. When up to 200 cards, delivery time should
        # be one (1) day. Between 100 and 500, delivery time is 2 days. etc.
        amount_of_goods = get_amount()
        delivery = 1
        day = "день"
        switch
            when amount_of_goods <= 100 
                delivery = 1
                day = "день"
            when amount_of_goods >= 101 and amount_of_goods <= 500
                delivery = 2
                day = "дня"
            when amount_of_goods >= 501 and amount_of_goods <= 1500
                delivery = 3
                day = "дня"
            when amount_of_goods > 1500
                delivery = 6
                day = "дней"
            else
                delivery = 3
                day = "дня"
        $("#delivery").val(delivery + " " + day)


    recalculate = ->
        # This function recalculates the price
        base = get_size()
        deliveryCoefficient = get_delivery()
        amountCoefficient = get_multiplier()
        addservices = get_all_addservices()

        addserviceOne = addservices[0]
        addserviceParty = addservices[1]

        amount = $('#amount').val()

        console.log('base - ' + base + '| delivery - ' + deliveryCoefficient + ' | add service sum - ' + addservices + ' | amount coefficient - ' + amountCoefficient)

        endPriceOne = (base*deliveryCoefficient*amountCoefficient) + addserviceOne
        endPriceParty = (base * deliveryCoefficient * amountCoefficient) * amount
        endPriceAll = endPriceOne * amount + addserviceParty
        endPriceServices = (addserviceOne * amount) + addserviceParty

        $('#priceValue').text(endPriceAll.toFixed(2))
        $('#priceForOne').text(endPriceOne.toFixed(2))
        $('#priceForAll').text(endPriceParty.toFixed(2))
        $('#priceForAddservices').text(endPriceServices.toFixed(2))

    $('.size_input').click (event) ->
        recalculate()
    
    $('.addservice_checkbox').change (event) ->
        recalculate()
        

    $('#amount').on('input', (event) ->
        recalculate()
        calculate_delivery()
        )

    $('#delivery').change (event) ->
        recalculate()

    $("#thediv").click (event) ->
        $("#addservices").toggleClass("reveal-closed").toggleClass("reveal-open")

    $('#load_more_btn').click (event) ->
        event.preventDefault()