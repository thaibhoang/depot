class StoreController < ApplicationController
  skip_before_action :authorize
  include VisitStore, CurrentCart
  before_action :set_visit_count, :set_cart, only: %i[ index ]

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end   
  end
end
