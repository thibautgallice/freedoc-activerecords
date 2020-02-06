class Specialty < ApplicationRecord
  has_many :doctors, through: :join_table_doctor_specialties
end
