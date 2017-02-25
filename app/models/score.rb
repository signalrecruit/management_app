class Score < ActiveRecord::Base
  belongs_to :applicant_detail


  def score_applicant
    self.skills_check? ? self.update(skills_score: 1) : self.update(skills_score: 0)
    self.qualifications_check? ? self.update(qualifications_score: 1) : self.update(qualifications_score: 0)
    total = (self.skills_score + self.qualifications_score)/2
    self.update(total_score: total)
  end
end
