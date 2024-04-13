require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase

  test "we create a SupportRequest when we get a support email" do
    receive_inbound_email_from_mail(
      to: "support@example.com",
      from: "chris@somewhere.net",
      subject: "Need help",
      body: "I can't figure out how to check out!!"
    )
    support_request = SupportRequest.last
    assert_equal "chris@somewhere.net", support_request.email
    assert_equal "Need help", support_request.subject
    assert_equal "I can't figure out how to check out!!", support_request.body
    assert_nil support_request.order
  end

  test "we create a SupportRequest with the most recent order" do
    recent_order = orders(:one)
    older_order = orders(:another_one)
    other_order  = orders(:other_customer)

    receive_inbound_email_from_mail(
      from: recent_order.email,
      to: "support@example.com",
      subject: "Need some help",
      body: "I cannot figure out the checking process"
    )

    latest_request = SupportRequest.last
    assert_equal latest_request.email, recent_order.email
    assert_equal latest_request.subject, "Need some help"
    assert_equal latest_request.body, "I cannot figure out the checking process"
    assert_equal latest_request.order, recent_order
  end
end
