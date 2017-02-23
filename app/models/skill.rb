class Skill < ActiveRecord::Base
  has_and_belongs_to_many :requirements
  validates :name, :score, presence: true
end
