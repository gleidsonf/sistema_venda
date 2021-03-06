class ProductsController < ApplicationController

	def index
		@products = Product.all		
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to root_path, alert: "Produto cadastrado com sucesso!"
		else
			render action: :new
		end
	end
private
	def product_params
		params.require(:product).permit(:name, :description, :price, :active)
	end
end