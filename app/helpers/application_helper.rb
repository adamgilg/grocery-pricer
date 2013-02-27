module ApplicationHelper
  def format_price(value)
    cents = value % 100
    dollars = value / 100
    "$#{dollars}.#{cents}"
  end

end
