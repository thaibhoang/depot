class HandleErrorMailer < ApplicationMailer

  def notify(exception)
    @exception = exception
    mail to: "hoangthai.ftu53@gmail.com",
        subject: "Online book store notification: Exception occurred"
  end
end
