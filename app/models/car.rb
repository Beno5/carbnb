class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
