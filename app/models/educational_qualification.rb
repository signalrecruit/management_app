class EducationalQualification < ActiveRecord::Base
  belongs_to :employee

  def update_button_clicked?
  	self.update_button?
  end
end
