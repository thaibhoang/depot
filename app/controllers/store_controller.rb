class StoreController < ApplicationController
  include VisitStore
  before_action :set_visit_count, only: %i[ index ]

  def index
    @products = Product.order(:title)    
  end
end
