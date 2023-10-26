class Specialty < ApplicationRecord
  has_many :doctors, through: :doctor_specialties
end
