class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_sale
  # helper_method :current_sale_order

	# def current_sale
	# 	sale = Sale.find(current_sale)

	# 	if sale.nil?
	# 	sale = Sale.create subtotal: 0.0, discount: 0.0, total: 0.0, sale_status_id:1, payment_id: 1
	# 	end
	# 	sale
	# end  	

	def current_sale
		if !session[:sale_id].nil?
			Sale.find(session[:sale_id])
		else
			Sale.new
		end
	end
end
