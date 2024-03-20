Rails.application.routes.draw do
  post '/transactions/check_fraud', to: 'transactions#check_fraud'
end
