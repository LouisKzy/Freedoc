class Doctor < ApplicationRecord
  has_many :patients, through: :appointments
  has_many :appointments
  belongs_to :city
  has_many :specialties, through: :doctor_specialties
  has_many :doctors_specialties
end

