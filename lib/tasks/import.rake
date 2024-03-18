require 'csv'

namespace :import do
  desc "Import data from CSV file"
  task csv_data: :environment do
    require 'csv'

    file_path = Rails.root.join('lib', 'assets', 'data', 'transactional-sample.csv')

    CSV.foreach(file_path, headers: true) do |row|
      transactions_attributes = {
        transaction_id: row['Transaction id'],
        merchant_id: row['Merchant id'],
        user_id: row['User id'],
        card_number: row['Card Number'],
        transaction_date: row['Transaction Date'],
        transaction_amount: row['Transaction Amount'],
        device_id: row['Devide id'],
        has_cbk: row['Has CBK?']
      }
    end
    puts "CSV data imported"
  end
end
