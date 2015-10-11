class AddservicesController < ApplicationController
  def index
  	@addservices = Addservice.all
  end
end
