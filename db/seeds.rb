# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying all Bookings"
Booking.destroy_all
puts "Destroying all Messages"
Message.destroy_all
puts "Destroying all Sessions"
Session.destroy_all
puts "Destroying all Activitys"
Activity.destroy_all
puts "Destroying all Moods"
Mood.destroy_all
puts "Destroying all Users"
User.destroy_all

teacher_1 = User.new(email: "arthur@gmail.com", password: "123456", first_name: "Arthur", last_name: "Herminie", status: "teacher", phone_number: "0909090909", address: "30 rue saint-maur", admin: false)
teacher_1.avatar.attach(io: File.open(File.join(Rails.root,"app/assets/images/avatars/arthur.png")), filename: "image")
teacher_1.save!
teacher_2 = User.new(email: "thibaut@gmail.com", password: "123456", first_name: "Thibaut", last_name: "Baissac", status: "teacher", phone_number: "0909090909", address: "22 rue Oberkampf", admin: false)
teacher_2.avatar.attach(io: File.open(File.join(Rails.root,"app/assets/images/avatars/thibaut.png")), filename: "image")
teacher_2.save!
teacher_3 = User.new(email: "daniela@gmail.com", password: "123456", first_name: "Daniela", last_name: "Mock-Zubia", status: "teacher", phone_number: "0909090909", address: "4 rue moret", admin: false)
teacher_3.avatar.attach(io: File.open(File.join(Rails.root,"app/assets/images/avatars/daniela.png")), filename: "image")
teacher_3.save!
teacher_4 = User.new(email: "amandine@gmail.com", password: "123456", first_name: "Amandine", last_name: "Arnould", status: "teacher", phone_number: "0909090909", address: "8 rue des bluets", admin: false)
teacher_4.avatar.attach(io: File.open(File.join(Rails.root,"app/assets/images/avatars/amandine.png")), filename: "image")
teacher_4.save!
senior = User.new(email: "emile@gmail.com", password: "123456", first_name: "Émile", last_name: "Ajar", status: "senior", phone_number: "0612872578", address: "16 villa Gaudelet", admin: false)
senior.avatar.attach(io: File.open(File.join(Rails.root,"app/assets/images/avatars/emile.jpg")), filename: "image")
senior.save!
#changer les photos des teachers

Mood.create!(score: 1, user: senior, created_at: Time.strptime("27/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 2, user: senior, created_at: Time.strptime("28/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 2, user: senior, created_at: Time.strptime("29/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 3, user: senior, created_at: Time.strptime("30/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 2, user: senior, created_at: Time.strptime("31/08/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 4, user: senior, created_at: Time.strptime("01/09/2021 12:00", "%d/%m/%Y %H:%M"))
Mood.create!(score: 5, user: senior, created_at: Time.strptime("02/09/2021 12:00", "%d/%m/%Y %H:%M"))

#ACTIVITIES_MIND = ["Méditation", "Cours de cuisine", "Calligraphie", "Echecs", "Maquillage", "Musique", "Peinture", "Photographie"]
#on apprend à la maison
meditation = Activity.create!(title: "Méditation" , description: "Les techniques de méditation sont très diverses, elles peuvent cependant être classées selon leur foyer d'attention : une zone corporelle spécifique ou le déplacement d'une zone à une autre.", duration: 60, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 2, admin_validation: true )
puts "Activity: #{meditation.title} created!"
cuisine = Activity.create!(title: "Cours de cuisine" , description: "La cuisine est l'ensemble des techniques de préparation des aliments en vue de leur consommation par les êtres humains. La cuisine est diverse à travers le monde. Elle est l'un des éléments représentant la notion de terroir quand elle est le fruit des ressources naturelles et productions agricoles.", duration: 75, remote: true, user_id: teacher_2.id, max_participants: 12, mind: true, min_participants: 2, admin_validation: true )
# puts "Activity: #{cuisine.title} created!"
Activity.create!(title: "Calligraphie", description: "La calligraphie est, étymologiquement, la belle écriture, l'art de bien former les caractères d'écriture manuscrite. Presque toutes les civilisations qui pratiquent l'écriture ont développé un art de la « calligraphie", duration: 65, remote: true, user_id: teacher_3.id, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Partie d'échecs", description: "Le jeu d'échecs, ou les échecs, est un jeu de société opposant deux joueurs de part et d'autre d'un tablier appelé échiquier composé de soixante-quatre cases, 32 claires et 32 sombres nommées les cases blanches et les cases noires.", duration: 60, remote: true, user_id: teacher_3.id, max_participants: 2, mind: true, min_participants: 2, admin_validation: true )
#on bouge à distance
# ACTIVITIES_BODY = ["Yoga", "Danse", "Badminton", "Renforcement musculaire", "Marche"]
Activity.create!(title: "Maquillage", description: "Le maquillage est l'utilisation de produits cosmétiques a pour l'embellissement du visage, notamment de sa peau, et la modification des traits du visage et du corps pour la création de personnages au cinéma ou au théâtre.", duration: 45, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Musique", description: "La musique est un art et une activité culturelle consistant à combiner sons et silences au cours du temps. Les paramètres principaux sont le rythme (façon de combiner les sons dans le temps), la hauteur (combinaison dans les fréquences), les nuances et le timbre.", duration: 55, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Peinture", description: "La peinture est une forme artistique dont les diverses techniques consistent à appliquer manuellement ou mécaniquement, sur une surface, des couleurs sous forme de pigments mélangés à un liant ou un diluant. Les artistes peintres s'expriment sur des supports tels que la toile, le papier, le bois, etc.", duration: 50, remote: true, user_id: teacher_3.id, max_participants: 16, mind: true, min_participants: 2, admin_validation: true )
Activity.create!(title: "Photographie", description: "La photographie est l'ensemble des techniques, des procédés et des matériels qui permettent d'enregistrer un sujet en image fixe. Le terme « photographie » désigne aussi l'image obtenue, phototype (photographie visible et stable qu'elle soit négative ou positive", duration: 45, remote: true, user_id: teacher_4.id, max_participants: 4, mind: true, min_participants: 2, admin_validation: true )

Activity.create!(title: "Yoga", description: "Le yoga est la pratique d'un ensemble de postures et d 'exercices de respiration qui vise à apporter un bien être physique et mental. cet ancien art de vivre tel qu'il est expliqué dans les textes se révèle comme un chemin initiatique qui transcende la discipline physique.", duration: 50, remote: false, user_id: teacher_3.id, max_participants: 18, mind: false, address: "17 rue des Bluets", min_participants: 6, admin_validation: true )
Activity.create!(title: "Danse", description: "Depuis la nuit des temps, la danse était utilisée par les différentes cultures comme un rituel, un message, un art, ou encore comme un simple divertissement. Contemporain, classique, traditionnelle, urbaine, elle regroupe plusieurs catégories et reste aujourd'hui accessible à tous.", duration: 75, remote: false, user_id: teacher_3.id, max_participants: 14, mind: false, address: "8 rue Oberkampf", min_participants: 4, admin_validation: true )
Activity.create!(title: "Badminton", description: "Le badminton est un sport complet, tous les muscles étant sollicités, ainsi que l'équilibre, les réflexes, la coordination des mouvements dans l'espace, la tactique et la stratégie. C'est un sport qui améliore l'endurance, la vitesse, l'adresse et la précision des gestes, la souplesse et la concentration.", duration: 50, remote: false, user_id: teacher_1.id, max_participants: 4, mind: false, address: "18 rue Saint-maur", min_participants: 10, admin_validation: true )
Activity.create!(title: "Renforcement musculaire", description: "Le renforcement musculaire, accessible à tous selon l'intensité à laquelle il est réalisé, concourt à redonner au corps force et tonus, en agissant tel un anti-âge. Cela dit, ne confondons pas renforcement musculaire et musculation.", duration: 35, remote: false, user_id: teacher_1.id, max_participants: 10, mind: false, address: "4 rue Moret", min_participants: 4, admin_validation: true )
Activity.create!(title: "Marche", description: "Comme toutes les activités en endurance, marcher entraîne le cœur (qui doit prendre davantage) et permet progressivement d'avoir une fréquence cardiaque plus basse au repos. De quoi épargner votre palpitant… mais aussi vos artères, soumises à moins de pression !", duration: 45, remote: false, user_id: teacher_4.id, max_participants: 20, mind: false, address: "28 avenue de la République", min_participants: 6, admin_validation: true )


puts "Nombre d'activités crées :#{Activity.count}"
Activity.all.each do |act|
  [
    Time.strptime("02/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("02/09/2021 14:45", "%d/%m/%Y %H:%M"),
    Time.strptime("03/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("03/09/2021 14:45", "%d/%m/%Y %H:%M"),
    Time.strptime("04/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("04/09/2021 14:45", "%d/%m/%Y %H:%M"),
    Time.strptime("07/09/2021 12:00", "%d/%m/%Y %H:%M"),
    Time.strptime("07/09/2021 14:45", "%d/%m/%Y %H:%M")
  ].each do |hour|
    session = Session.create!(start_at: hour, activity: act)
    puts "Session for #{session.activity.title} created! (at #{session.start_at})"
  end
end

Booking.create!(user: senior, session: Session.passed.sample)
