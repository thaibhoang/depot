class HandleErrorJob < ApplicationJob
  queue_as :default

  def perform(exception)
    HandleErrorMailer.notify(exception).deliver_later
  end
end
