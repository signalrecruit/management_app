class ChildrenDetail < ActiveRecord::Base
  belongs_to :employee

  def update_button_clicked?
  	return true if self.update_button == true
  end
end
