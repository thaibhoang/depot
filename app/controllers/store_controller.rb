class StoreController < ApplicationController
  skip_before_action :authorize
  include VisitStore, CurrentCart
  before_action :set_visit_count, :set_cart, only: %i[ index ]

  def index
    @products = Product.order(:title)   
  end
end
