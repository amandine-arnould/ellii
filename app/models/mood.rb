class Mood < ApplicationRecord
  belongs_to :user
  validates :score, presence: true

  SCORES = [1, 2, 3, 4, 5]

  def sentence
    case score
    when 1 then "Vous n'êtes pas en forme aujourd'hui"
    when 2 then "Peut faire mieux"
    when 3 then "Vous êtes ok"
    when 4 then "Whoaaa"
    when 5 then "😂"
    end
  end
end
