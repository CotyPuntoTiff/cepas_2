class Oenologist < ApplicationRecord
    has_many :wine_oenologists
    has_many :magazine_oenologists
    has_many :magazine, through: :magazine_oenologists
    has_many :wines, through: :wine_oenologists
end
