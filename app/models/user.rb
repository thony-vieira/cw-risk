class User < ApplicationRecord
  has_many :cards
  has_many :transactions

  # method to define what is the limit to transactions in the interval of an hour
  def too_many_tx_in_row(transaction)
    max_consecutive_transactions = 3
    one_hour_ago = transaction.transaction_date - 1.hour
    user_transactions = transactions.where(
      "transaction_date >= ?", one_hour_ago
    ).order(transaction_date: :asc).limit(max_consecutive_transactions)
    p user_transactions.count
    user_transactions.count < max_consecutive_transactions
  end

  # method to define if a transaction was made after certain hour and with a certain amount

  def cbk_in_previous_transactions?
    !transactions.exists?(has_cbk: true)
  end
end
