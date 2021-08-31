# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mood.destroy_all
mood1 = Mood.new(score: 1, user_id: 2, created_at: Time.strptime("28/08/2021 12:00", "%d/%m/%Y %H:%M") )
mood1.save!
mood2 = Mood.new(score: 2, user_id: 2, created_at: Time.strptime("29/08/2021 12:00", "%d/%m/%Y %H:%M") )
mood2.save!
mood3 = Mood.new(score: 3, user_id: 2, created_at: Time.strptime("30/08/2021 12:00", "%d/%m/%Y %H:%M"))
mood3.save!
mood4 = Mood.new(score: 3, user_id: 2, created_at: Time.strptime("31/08/2021 12:00", "%d/%m/%Y %H:%M"))
mood4.save!
mood5 = Mood.new(score: 2, user_id: 2, created_at: Time.strptime("01/09/2021 12:00", "%d/%m/%Y %H:%M"))
mood5.save!
mood6 = Mood.new(score: 3, user_id: 2, created_at: Time.strptime("02/09/2021 12:00", "%d/%m/%Y %H:%M"))
mood6.save!
mood7 = Mood.new(score: 4, user_id: 2, created_at: Time.strptime("03/09/2021 12:00", "%d/%m/%Y %H:%M"))
mood7.save!
