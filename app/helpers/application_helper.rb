module ApplicationHelper
  def format_currency(amount_in_usd)
    if I18n.locale == :vi
      exchange_rate = 24000
      amount_in_vnd = amount_in_usd * exchange_rate
      number_to_currency(amount_in_vnd)
    else
      number_to_currency(amount_in_usd)  # Default to USD formatting
    end
  end
end
