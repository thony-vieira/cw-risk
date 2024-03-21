class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def check_fraud
    transaction = Transaction.new(transaction_params)
    transaction.user = User.find_or_initialize_by(user_params)

    if transaction.anti_fraud_checked?

      render json: { transaction_id: transaction.transaction_id, recomendation: 'approve' }
    else
      render json: { transaction_id: transaction.transaction_id, recomendation: 'deny' }
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
