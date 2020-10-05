class Importer < ApplicationRecord
  # This is the file importer model

  # Only one file at a time
  has_one_attached :file
  # One file could have many transactions
  has_many :transactions

  # The file needs to exist, can't parse without it
  validates :file, presence: true
end
