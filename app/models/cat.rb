class Cat < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :dislikes
end
