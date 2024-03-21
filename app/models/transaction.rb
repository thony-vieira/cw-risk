class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :card

  def anti_fraud_checked?
    p user.too_many_tx_in_row(self), reject_tx_above_amount, user.cbk_in_previous_transactions?
    user.too_many_tx_in_row(self) && reject_tx_above_amount && user.cbk_in_previous_transactions?
  end

  # method to define if a transaction was made after certain hour and with a certain amount
  MAX_AMOUNT_PER_PERIOD = 1000.00
  # def reject_tx_above_amount
  #   time_zone = Time.find_zone('UTC')
  #   # Period of day that transactions above "x" value will be reject
  #   # Consider the wanted hour with a -3 for the real hour, in this case is 22 until 5
  #   start_time = time_zone.now.beginning_of_day + 19.hours
  #   end_time = time_zone.now.end_of_day + 2.hours
  #   !(transaction_date.between?(start_time, end_time) && transaction_amount > MAX_AMOUNT_PER_PERIOD)
  # end
  def reject_tx_above_amount
    ((transaction_date.hour >= 5 && transaction_date.hour < 22) ||
      transaction_amount <= MAX_AMOUNT_PER_PERIOD)
  end
end
