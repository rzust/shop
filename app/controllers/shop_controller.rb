class ShopController < ApplicationController
  def index
    @featured = Shoppe::Product.where(featured: true).limit(8).includes(:default_image, :product_category, :variants).root.active.to_a
  end
end
