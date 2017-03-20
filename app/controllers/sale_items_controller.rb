class SaleItemsController < ApplicationController

	def new
		@sale = current_sale
		@sale_item = @sale.sale_items.new
	end

	def create
		@sale = current_sale
		# if @sale.sale_items.exists?(:product_id => sale])
		# 	@sale_item = @sale.sale_items.find_by(:product_id => params[:product_id]).increment!(:quantity)
		# else
			@sale_item = @sale.sale_items.new(sale_item_params)
		# end
		## Work fine
		# @sale_item = SaleItem.where(sale_id: current_sale.id, product_id: params[:product_id]).first
		# @sale_item.increment(:quantity)

		# @sale_item = @sale.sale_items.new(sale_item_params)
		# @sale_item = @sale.sale_items.find_or_initialize_by(:product_id => params[:quantity])
		@sale_item.unit_price = Product.find_by(id: @sale_item.product_id).price
		@sale_item.total_price = @sale_item.unit_price * @sale_item.quantity

		@sale.subtotal = @sale.sale_items.sum(:total_price)
		@sale.discount=0.0
		@sale.sale_status_id =1
		@sale.payment_id = 1
		@sale.save
		session[:sale_id] = @sale.id
	end

  def destroy
    @sale = current_sale
    @sale_item = @sale.sale_items.find(params[:id])
    SaleItem.where(:product_id => @sale_item.product_id, :sale_id => current_sale.id).destroy_all
    # @sale_item.destroy
    @sale_items = @sale.sale_items
    # @sale = current_sale
    # @sale_item = @sale.sale_items.where(:product_id => params[:product_id])
    # @sale_item.destroy_all
    # @sale_item = @sale.sale_items.find(params[:id])
    # SaleItem.where(:product_id => @sale_item.product_id, :sale_id => current_sale.id).destroy_all
    # @sale_item.destroy
    # @sale_items = @sale.sale_items
    # session[:sale_id] = nil
  end

  def finished
	@sale = current_sale
	@sale.sale_status_id = 2
	@sale.save
	@sale = nil
	current_sale = nil
	session[:sale_id] = nil
	  redirect_to root_path, notice: "Compra finalizada!"
  
  end

private
	def sale_item_params
		params.require(:sale_item).permit(:quantity, :product_id)
	end

	def quantity_params
		params.require(:sale_item).permit(:quantity)
	end
end