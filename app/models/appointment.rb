class Appointment < ApplicationRecord
    belongs_to :user
    validates :dateOfservice, presence: true
    validates :timeOfservice, presence: true
end
