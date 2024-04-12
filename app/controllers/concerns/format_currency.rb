module FormatCurrency
  def format_currency(amount_in_usd)
    if I18n.locale == :vi
      exchange_rate = EXCHANGE_RATES['vi']['exchange_rate']
      amount_in_vnd = amount_in_usd * exchange_rate
      number_to_currency(amount_in_vnd, unit: "₫", precision: 0)
    else
      number_to_currency(amount_in_usd)  # Default to USD formatting
    end
  end
end

module ApplicationHelper
  include FormatCurrency
end
