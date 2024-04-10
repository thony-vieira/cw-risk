class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :card

  # Must return true to render approve
  def anti_fraud_checked
    checks = {
      'too_many_tx_in_row' => user.too_many_tx_in_row(self),
      'reject_tx_above_amount' => reject_tx_above_amount,
      'cbk_in_previous_transactions' => user.cbk_in_previous_transactions?,
      'too_many_tx_in_row_with_same_merchant' => user.too_many_tx_in_row_with_same_merchant(user_id, merchant_id, self)
    }

    failed_checks = checks.select { |_key, value| value == false }
    if failed_checks.any?
      { status: false, failed_check: failed_checks.keys.join(", ") }
    else
      { status: true }
    end
  end

  # method to define if a transaction was made after certain hour and with a certain amount
  MAX_AMOUNT_PER_PERIOD = 1000.00
  def reject_tx_above_amount
    ((transaction_date.hour >= 5 && transaction_date.hour < 22) ||
      transaction_amount <= MAX_AMOUNT_PER_PERIOD)
  end
end
