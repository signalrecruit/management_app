class CompulsoryRequirement < ActiveRecord::Base
  belongs_to :requirement
  validates :score_1, :score_2, :score_3, :score_4, :score_5, :score_6, 
  	:score_7, :score_8, :score_9, :score_10, presence: true
end
