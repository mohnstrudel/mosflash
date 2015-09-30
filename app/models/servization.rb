class Servization < ActiveRecord::Base
	belongs_to :product
	belongs_to :addservice

	after_initialize :init

	def init
		self.coefficient ||= 1
	end
end
