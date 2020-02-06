# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# # Créer des Specialties
50.times do
  specialty = Specialty.create!(specialty_name: Faker::IndustrySegments.industry)
  puts "Specialty : #{specialty.specialty_name} created"
end

# Créer des Cities
50.times do
  city = City.create!(city_name: Faker::Address.city)
  puts "City : #{city.city_name} created"
end

# Créer des Docteurs et des Patients
200.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name,zip_code:Faker::Address.zip_code,city:City.all.sample)
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name,city:City.all.sample)
  puts "Doctor : #{doctor.first_name} created"
  puts "Patient : #{patient.first_name} created"
end

# Créer des Appointments
n = 0
100.times do
  random_doc = Doctor.all.sample
  appointment = Appointment.create!(doctor:random_doc,patient:Patient.all.sample,date:Faker::Time.forward(days: 5,  period: :evening, format: :long),city:random_doc.city)
  n = n+1
  puts "Appointment #{n} created"
end

# Attribuer des Specialties au Doctor
100.times do
  random_doc = Doctor.all.sample
  random_spe = Specialty.all.sample
  join_specialty = JoinTableDoctorSpecialty.create!(doctor:random_doc,specialty:random_spe)
  n = n+1
  puts "#{random_doc.first_name} is doing #{random_spe.specialty_name}"
end