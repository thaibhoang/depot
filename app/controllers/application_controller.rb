class ApplicationController < ActionController::Base
  rescue_from StandardError do |exception|
    handle_error(exception)  # Assuming you have a generic handle_error method
  end
  
  def handle_error(exception)
    HandleErrorJob.perform_later(exception)
  end
end
