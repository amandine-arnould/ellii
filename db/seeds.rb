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
senior = User.new(email: "emile@gmail.com", password: "123456", first_name: "??mile", last_name: "Ajar", status: "senior", phone_number: "0612872578", address: "16 villa Gaudelet", admin: false)
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

#ACTIVITIES_MIND = ["M??ditation", "Cours de cuisine", "Calligraphie", "Echecs", "Maquillage", "Musique", "Peinture", "Photographie"]
#on apprend ?? la maison
meditation = Activity.create!(title: "M??ditation" , description: "Les techniques de m??ditation sont tr??s diverses, elles peuvent cependant ??tre class??es selon leur foyer d'attention : une zone corporelle sp??cifique ou le d??placement d'une zone ?? une autre.", duration: 60, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 2, admin_validation: true )
puts "Activity: #{meditation.title} created!"
cuisine = Activity.create!(title: "Cours de cuisine" , description: "La cuisine est l'ensemble des techniques de pr??paration des aliments en vue de leur consommation par les ??tres humains. La cuisine est diverse ?? travers le monde. Elle est l'un des ??l??ments repr??sentant la notion de terroir quand elle est le fruit des ressources naturelles et productions agricoles.", duration: 75, remote: true, user_id: teacher_2.id, max_participants: 12, mind: true, min_participants: 2, admin_validation: true )
# puts "Activity: #{cuisine.title} created!"
Activity.create!(title: "Calligraphie", description: "La calligraphie est, ??tymologiquement, la belle ??criture, l'art de bien former les caract??res d'??criture manuscrite. Presque toutes les civilisations qui pratiquent l'??criture ont d??velopp?? un art de la ?? calligraphie", duration: 65, remote: true, user_id: teacher_3.id, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Partie d'??checs", description: "Le jeu d'??checs, ou les ??checs, est un jeu de soci??t?? opposant deux joueurs de part et d'autre d'un tablier appel?? ??chiquier compos?? de soixante-quatre cases, 32 claires et 32 sombres nomm??es les cases blanches et les cases noires.", duration: 60, remote: true, user_id: teacher_3.id, max_participants: 2, mind: true, min_participants: 2, admin_validation: true )
#on bouge ?? distance
# ACTIVITIES_BODY = ["Yoga", "Danse", "Badminton", "Renforcement musculaire", "Marche"]
Activity.create!(title: "Maquillage", description: "Le maquillage est l'utilisation de produits cosm??tiques a pour l'embellissement du visage, notamment de sa peau, et la modification des traits du visage et du corps pour la cr??ation de personnages au cin??ma ou au th????tre.", duration: 45, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Musique", description: "La musique est un art et une activit?? culturelle consistant ?? combiner sons et silences au cours du temps. Les param??tres principaux sont le rythme (fa??on de combiner les sons dans le temps), la hauteur (combinaison dans les fr??quences), les nuances et le timbre.", duration: 55, remote: true, user_id: teacher_1.id, max_participants: 14, mind: true, min_participants: 4, admin_validation: true )
Activity.create!(title: "Peinture", description: "La peinture est une forme artistique dont les diverses techniques consistent ?? appliquer manuellement ou m??caniquement, sur une surface, des couleurs sous forme de pigments m??lang??s ?? un liant ou un diluant. Les artistes peintres s'expriment sur des supports tels que la toile, le papier, le bois, etc.", duration: 50, remote: true, user_id: teacher_3.id, max_participants: 16, mind: true, min_participants: 2, admin_validation: true )
Activity.create!(title: "Photographie", description: "La photographie est l'ensemble des techniques, des proc??d??s et des mat??riels qui permettent d'enregistrer un sujet en image fixe. Le terme ?? photographie ?? d??signe aussi l'image obtenue, phototype (photographie visible et stable qu'elle soit n??gative ou positive).", duration: 45, remote: true, user_id: teacher_4.id, max_participants: 4, mind: true, min_participants: 2, admin_validation: true )

Activity.create!(title: "Yoga", description: "Le yoga est la pratique d'un ensemble de postures et d 'exercices de respiration qui vise ?? apporter un bien ??tre physique et mental. cet ancien art de vivre tel qu'il est expliqu?? dans les textes se r??v??le comme un chemin initiatique qui transcende la discipline physique.", duration: 50, remote: false, user_id: teacher_3.id, max_participants: 18, mind: false, address: "17 rue des Bluets", min_participants: 6, admin_validation: true )
Activity.create!(title: "Danse", description: "Depuis la nuit des temps, la danse ??tait utilis??e par les diff??rentes cultures comme un rituel, un message, un art, ou encore comme un simple divertissement. Contemporain, classique, traditionnelle, urbaine, elle regroupe plusieurs cat??gories et reste aujourd'hui accessible ?? tous.", duration: 75, remote: false, user_id: teacher_3.id, max_participants: 14, mind: false, address: "8 rue Oberkampf", min_participants: 4, admin_validation: true )
Activity.create!(title: "Badminton", description: "Le badminton est un sport complet, tous les muscles ??tant sollicit??s, ainsi que l'??quilibre, les r??flexes, la coordination des mouvements dans l'espace, la tactique et la strat??gie. C'est un sport qui am??liore l'endurance, la vitesse, l'adresse et la pr??cision des gestes, la souplesse et la concentration.", duration: 50, remote: false, user_id: teacher_1.id, max_participants: 4, mind: false, address: "18 rue Saint-maur", min_participants: 10, admin_validation: true )
Activity.create!(title: "Renforcement musculaire", description: "Le renforcement musculaire, accessible ?? tous selon l'intensit?? ?? laquelle il est r??alis??, concourt ?? redonner au corps force et tonus, en agissant tel un anti-??ge. Cela dit, ne confondons pas renforcement musculaire et musculation.", duration: 35, remote: false, user_id: teacher_1.id, max_participants: 10, mind: false, address: "4 rue Moret", min_participants: 4, admin_validation: true )
Activity.create!(title: "Marche", description: "Comme toutes les activit??s en endurance, marcher entra??ne le c??ur (qui doit prendre davantage) et permet progressivement d'avoir une fr??quence cardiaque plus basse au repos. De quoi ??pargner votre palpitant??? mais aussi vos art??res, soumises ?? moins de pression???!", duration: 45, remote: false, user_id: teacher_4.id, max_participants: 20, mind: false, address: "28 avenue de la R??publique", min_participants: 6, admin_validation: true )


puts "Nombre d'activit??s cr??es :#{Activity.count}"
Activity.all.each do |act|
  [
    Time.zone.strptime("29/09/2021 14:00", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("29/09/2021 18:05", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("03/10/2021 14:30", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("03/10/2021 15:00", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("08/10/2021 14:00", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("08/10/2021 16:45", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("15/11/2021 14:00", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("01/01/2022 16:45", "%d/%m/%Y %H:%M"),
    Time.zone.strptime("01/01/2022 18:45", "%d/%m/%Y %H:%M")
  ].each do |hour|
    session = Session.create!(start_at: hour, activity: act)
    puts "Session for #{session.activity.title} created! (at #{session.start_at})"
  end
end

Booking.create!(user: senior, session: Session.passed.sample)
