class Gif < ApplicationRecord
    has_many :caption_joins, as: :captionable
    has_many :captions, through: :caption_joins, as: :captionable
end
