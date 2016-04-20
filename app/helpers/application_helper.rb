module ApplicationHelper

	def image_or_default(object, options = {})
		# Usage:
		# as object you give either the 'parent' object, for example a product. Or you can give a specific image, that's
		# where which_one: 'each' comes in.
		# options[:which_one] - you can specify 'first', 'second', 'last' etc. or 'each' if you need to loop through all images.
		# options[:class] - a css class to provide, optional
		# options[:thumb] - the name for thumbnail you specified in the uploader class

		which_one = options[:which_one] || 'first'		
		thumb = options[:thumb]
		attributes_array = Array.new
		# object.attribute_names.each { |attribute| attributes_array.push(object.send(attribute)) }

		alt = request.original_fullpath.split(/[\/-]/).join(" ")

		if which_one == :each
			return image_tag(object.image.url(thumb), class: options[:class], alt: alt)
		elsif object.try(:images)
			if object.images.any?
				return image_tag(object.images.send(which_one).image.url(thumb), class: options[:class], alt: alt)
			else
				return image_tag("default.png", size: "270x380")
			end
		else
			return image_tag(object.send(options[:image_name]).url(thumb), class: options[:class], alt: alt)
		end		
	end


	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag('div', attributes, &block)
	end

	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})
	end

	def crb_kurs(dollars)
		require 'nokogiri'
		require 'open-uri'
		
		daterange = DateTime.now.to_date.strftime("%d/%m/%Y")
		# Central Bank api does not accept single date value, thus, we're using twice the same day as range...
		# don't ask me why this isn't implemented
		# doc = Nokogiri::HTML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=#{daterange}&date_req2=#{daterange}&VAL_NM_RQ=R01235"))

		doc = Nokogiri::HTML(open("http://www.cbr.ru/scripts/XML_daily_eng.asp?date_req=#{daterange}"))
		
		rateString = doc.xpath('//valcurs//valute[10]//value').inner_text	 
		# Because there are commas in the float number divider we need to convert them into dots, because
		# a number with a comma is considered a string by Rails
		rate = rateString.gsub(/,/ , '.').to_f

		# Custom + 3% to the whole value
		priceInDollars = (dollars * rate) * 1.03

		# To show customer current exchange rate we return both, the exchange rate and the dollar price
		# additionally we'll add the original price aswell
		return priceInDollars
	end

	def initialPrice(dollars)
		rubles = crb_kurs(dollars)
		amountMultiplier = 1.5
      	amountDelivery = Delivery.all.order(coefficient: :asc).first.coefficient
      	return rubles * amountMultiplier * amountDelivery
    end

	def russianize(number)
		if number == 1
			return ""
		elsif number == 2..4
			return "а"
		else
			return 'ов'
		end
	end
end
