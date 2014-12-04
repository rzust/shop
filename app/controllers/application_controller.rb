class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :categories, :currency_unit

  def categories
    categories ||= Shoppe::ProductCategory.only_parents
  end

  def currency_unit
    currency_unit ||= Shoppe::Setting.where(key: "currency_unit").take.value rescue "$"
  end
end
