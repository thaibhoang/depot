class StoreController < ApplicationController
  skip_before_action :authorize
  include VisitStore, CurrentCart
  before_action :set_cart, only: %i[ index ]

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      set_visit_count
    end   
  end
end
