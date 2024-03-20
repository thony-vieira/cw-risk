require 'csv'

namespace :import do
  desc "Import data from CSV file"
  task csv_data: :environment do
    require 'csv'

    file_path = Rails.root.join('lib', 'assets', 'data', 'transactional-sample.csv')

    CSV.foreach(file_path, headers: true) do |row|
      user = User.find_or_create_by(user_id: row['user_id'], device_id: row['device_id'])
      card = Card.find_or_create_by(user:, number: row['card_number'])
      Transaction.create!(transaction_id: row['transaction_id'],
                          card:,
                          user:,
                          merchant_id: row['merchant_id'],
                          transaction_date: row['transaction_date'],
                          transaction_amount: row['transaction_amount'],
                          has_cbk: row['has_cbk'] == 'TRUE')
    end
    puts "CSV data imported"
  end
end
