class Cocktail < ActiveRecord::Base
    belongs_to :user
    has_and_belongs_to_many :ingredients
    validates :title, presence: true

end