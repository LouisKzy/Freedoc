require 'faker'


Appointment.destroy_all
Patient.destroy_all
Doctor.destroy_all
Specialty.destroy_all
City.destroy_all


cities_name = ["Paris", "Marseille", "Lyon", "Montpellier",] 
cities_name.each do |city| #creation des city
  City.create(
    city_name: city
  )
end

specialities = ["généraliste", "chirugien", "dentiste", "proctologue", "dermatologue", "pediatre", "Kiné", "Chiro"]
specialities.each do |string_selected_specialty| 
  Specialty.create(
    specialty_name: string_selected_specialty
  )
end


10.times do #creation des docs
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city_id: City.all.sample.id
  )
end


20.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.all.sample.id
  )
end


30.times do  # Vous pouvez ajuster le nombre de rendez-vous par docteur
  Appointment.create(
    date: Faker::Time.between_dates(from: Date.today, to: 1.year.from_now, period: :all),
    doctor_id: Doctor.all.sample.id,
    patient_id: Patient.all.sample.id,
    city_id: City.all.sample.id
  )
end

Doctor.all.each do |doc|
  2.times do |index|
    Specialty.create(
      specialty_name: Specialty.find(rand(1..4))
    )
  end
end