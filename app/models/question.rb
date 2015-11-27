class Question < ActiveRecord::Base
    has_many :questionaires
    has_many :answers
    belongs_to :quser

end
