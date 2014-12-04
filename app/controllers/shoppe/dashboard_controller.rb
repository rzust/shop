module Shoppe
  class DashboardController < Shoppe::ApplicationController

    def home
      redirect_to :products
    end

  end
end