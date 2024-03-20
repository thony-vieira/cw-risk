class User < ApplicationRecord
  has_many :cards
  has_many :transactions

  # method to define what is the limit to transactions in the interval of an hour
  def too_many_tx_in_row
    max_consecutive_transactions = 3
    time_zone = Time.find_zone('UTC')
    one_hour_ago = time_zone - 1.hour
    user_transactions = transactions.where(
      "transaction_date >= ? AND transaction_date <= ?", one_hour_ago.beginning_of_hour, one_hour_ago.end_of_hour
    ).order(transaction_date: :desc).limit(max_consecutive_transactions)
    user_transactions.count < max_consecutive_transactions
  end

  # method to define if a transaction was made after certain hour and with a certain amount

  def cbk_in_previous_transactions?
    !transactions.exists?(has_cbk: true)
  end
end
