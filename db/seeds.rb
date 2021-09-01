# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


teacher_1 = User.new(email: "arthur@gmail.com", password: "123456", first_name: "Arthur", last_name: "Herminie", status: "teacher", phone_number: "0909090909", address: "30 rue saint-maur", admin: false)
teacher_1.avatar.attach(io: File.open(File.join(Rails.root,"app/assets/images/avatars/emile.jpg")), filename: "image")
teacher_1.save!
teacher_2 = User.new(email: "thibaut@gmail.com", password: "123456", first_name: "Thibaut", last_name: "Baissac", status: "teacher", phone_number: "0909090909", address: "22 rue Oberkampf", admin: false)
# teacher_2.avatar.attach(io: URI.open("https://www.lavienne86.fr/fileadmin/_processed_/0/d/csm_Bandeau-senior_4523517d1f.jpg"), filename: "emile_avatar.jpg", content_type: "image/jpg")
teacher_2.save!
teacher_3 = User.new(email: "daniela@gmail.com", password: "123456", first_name: "Daniela", last_name: "Mock-Zubia", status: "teacher", phone_number: "0909090909", address: "4 rue moret", admin: false)
# teacher_3.avatar.attach(io: URI.open("https://www.lavienne86.fr/fileadmin/_processed_/0/d/csm_Bandeau-senior_4523517d1f.jpg"), filename: "emile_avatar.jpg", content_type: "image/jpg")
teacher_3.save!
teacher_4 = User.new(email: "amandine@gmail.com", password: "123456", first_name: "Amandine", last_name: "Arnould", status: "teacher", phone_number: "0909090909", address: "8 rue des bluets", admin: false)
# teacher_4.avatar.attach(io: URI.open("https://www.lavienne86.fr/fileadmin/_processed_/0/d/csm_Bandeau-senior_4523517d1f.jpg"), filename: "emile_avatar.jpg", content_type: "image/jpg")
teacher_4.save!
senior = User.new(email: "emile@gmail.com", password: "123456", first_name: "Emile", last_name: "Ajar", status: "senior", phone_number: "0612872578", address: "16 villa Gaudelet", admin: false)
senior.avatar.attach(io: File.open(File.join(Rails.root,"app/assets/images/avatars/emile.jpg")), filename: "image")
senior.save!
#changer les photos des teachers

Mood.destroy_all
Mood.create!(score: 1, user: senior, created_at: Time.strptime("27/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 2, user: senior, created_at: Time.strptime("28/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 2, user: senior, created_at: Time.strptime("29/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 3, user: senior, created_at: Time.strptime("30/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 2, user: senior, created_at: Time.strptime("31/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 4, user: senior, created_at: Time.strptime("01/09/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 5, user: senior, created_at: Time.strptime("02/09/2021 12:00", "%d/%m/%Y %H:%M"))

#ACTIVITIES_MIND = ["Méditation", "Cours de cuisine", "Calligraphie", "Echecs", "Maquillage", "Musique", "Peinture", "Photographie"]
#on apprend à la maison
meditation = Activity.create!(title: "Méditation" , description: "yoo", duration: 60, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 2, admin_validation: true )
puts "Activity: #{meditation.title} created!"
cuisine = Activity.create!(title: "Cours de cuisine" , description: "yoo", duration: 75, remote: true, user: teacher_2, max_participants: 12, mind: true, min_participants: 2, admin_validation: true )
# puts "Activity: #{cuisine.title} created!"
Activity.create!(title: "Calligraphie", description: "sdgfh", duration: 65, remote: true, user: teacher_3, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Echecs", description: "qdbr", duration: 60, remote: true, user: teacher_3, max_participants: 2, mind: true, min_participants: 2, admin_validation: true )
#on bouge à distance
# ACTIVITIES_BODY = ["Yoga", "Danse", "Badminton", "Renforcement musculaire", "Marche"]
Activity.create!(title: "Maquillage", description: "qber", duration: 45, remote: true, user: teacher_4, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Musique", description: "qber", duration: 55, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Peinture", description: "qsrgv", duration: 50, remote: true, user: teacher_3, max_participants: 16, mind: true, min_participants: 2, admin_validation: true )
Activity.create!(title: "Photographie", description: "seV", duration: 45, remote: true, user: teacher_4, max_participants: 4, mind: true, min_participants: 2, admin_validation: true )

Activity.create!(title: "Yoga", description: "VQSZE", duration: 50, remote: false, user: teacher_3, max_participants: 18, mind: false, address: "17 rue des Bluets", min_participants: 6, admin_validation: true )
Activity.create!(title: "Danse", description: "QZEV", duration: 75, remote: false, user: teacher_3, max_participants: 14, mind: false, address: "8 rue Oberkampf", min_participants: 4, admin_validation: true )
Activity.create!(title: "Badminton", description: "QRB", duration: 50, remote: false, user_id: teacher_1.id, max_participants: 4, mind: false, address: "18 rue Saint-maur", min_participants: 10, admin_validation: true )
Activity.create!(title: "Renforcement musculaire", description: "QZV", duration: 35, remote: false, user_id: teacher_1.id, max_participants: 10, mind: false, address: "4 rue Moret", min_participants: 4, admin_validation: true )
Activity.create!(title: "Marche", description: "QZRBV", duration: 45, remote: false, user: teacher_4, max_participants: 20, mind: false, address: "28 avenue de la République", min_participants: 6, admin_validation: true )


puts "Nombre d'activités crées :#{Activity.count}"
Activity.all.each do |act|
  [
    Time.strptime("30/08/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("30/08/2021 16:00", "%d/%m/%Y %H:%M"),
    Time.strptime("01/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("01/09/2021 17:00", "%d/%m/%Y %H:%M"),
    Time.strptime("03/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("03/09/2021 17:00", "%d/%m/%Y %H:%M"),
    Time.strptime("05/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("05/09/2021 16:00", "%d/%m/%Y %H:%M"),
    Time.strptime("07/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("07/09/2021 16:00", "%d/%m/%Y %H:%M")
  ].each do |hour|
    session = Session.create!(start_at: hour, activity: act)
    puts "Session for #{session.activity.title} created! (at #{session.start_at})"
  end
end

Booking.create!(user: senior, session: Session.passed.sample)
