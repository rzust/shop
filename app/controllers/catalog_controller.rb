class CatalogController < ApplicationController

  before_filter do
    if params[:category_id]
      @product_category = Shoppe::ProductCategory.where(:permalink => params[:category_id]).first!
    end
    if @product_category && params[:product_id]
      @product = @product_category.products.where(:permalink => params[:product_id]).active.first!
    end
  end

  def index
    if !@product_category.nil?
      @products = @product_category.products.includes(:default_image, :product_category, :variants).root.active
    else
      @products = Shoppe::Product.all.includes(:default_image, :product_category, :variants).root.active
    end
    @title    = "Productos"
  end

  def show
    @attributes = @product.product_attributes.public.to_a
  end

end
