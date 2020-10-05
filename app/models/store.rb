class Store < ApplicationRecord
  # Validates name of the store and name of the owner, both should exist
  validates :name, :owner, presence: true

  # A store could have many transacations
  has_many :transactions
end
