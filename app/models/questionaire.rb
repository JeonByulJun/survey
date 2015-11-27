class Questionaire < ActiveRecord::Base
    belongs_to :question
    has_many :examples
end
