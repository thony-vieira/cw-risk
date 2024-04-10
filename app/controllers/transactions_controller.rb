class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def check_fraud
    transaction = Transaction.new(transaction_params)
    transaction.user = User.find_or_initialize_by(user_params)

    anti_fraud_result = transaction.anti_fraud_checked

    if anti_fraud_result[:status]
      render json: { transaction_id: transaction.transaction_id, recommendation: 'approve' }
    else
      render json: { transaction_id: transaction.transaction_id, recommendation: 'deny',
                     failed_checks: anti_fraud_result[:failed_check] }
    end
  end

  private

  def transaction_params
    params.permit(:transaction_id, :merchant_id, :transaction_date, :transaction_amount)
  end

  def user_params
    params.permit(:device_id, :user_id)
  end
end
