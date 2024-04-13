require "test_helper"

class SupportRequestMailerTest < ActionMailer::TestCase
  test "respond" do
    mail = SupportRequestMailer.respond(support_requests(:one))
    assert_equal "Re: I have a problem", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["support@example.com"], mail.from
  end

end

