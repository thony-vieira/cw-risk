class User < ApplicationRecord
  has_many :cards, :transactions
end
