class Mood < ApplicationRecord
  belongs_to :user
  validates :score, presence: true

  SCORES = [1, 2, 3, 4, 5]

  def sentence
    case score
    when 1 then "Vous n'avez pas l'air d'aller bien aujourd'hui. N'hésitez pas à nous contacter pour en discuter."
    when 2 then "Une petite baisse de régime aujourd'hui ? Un atelier et ça repart !"
    when 3 then "Qu'est ce que ce sera aujourd'hui pour vous ? Plutôt chez vous ou dehors ?"
    when 4 then "Superbe nouvelle! Faisons tout pour faire perdurer cette dynamique! "
    when 5 then "Votre motivation fait plaisir à voir !"
    end
  end
end
