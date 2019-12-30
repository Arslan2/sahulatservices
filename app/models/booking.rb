class Booking < ApplicationRecord
  validates :name, :phone, :service, :address, presence: true
end
