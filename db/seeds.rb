# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
    Survivor.create({
        name: Faker::Name.name,
        age: Faker::Number.number(2),
        gender: Faker::Gender.binary_type,
        abducted: false,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude
    })
end

300.times do
    ReportAbducted.create({
        survivor_report_id: Faker::Number.number(2),
        survivor_abducted_id: Faker::Number.number(2)
    })
end