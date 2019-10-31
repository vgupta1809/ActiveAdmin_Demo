class Physician < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  accepts_nested_attributes_for :patients, allow_destroy: true
end
