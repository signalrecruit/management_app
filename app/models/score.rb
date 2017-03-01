class Score < ActiveRecord::Base
  belongs_to :applicant_detail
  
  # special validation for job description's compulsory requirements.

  def score_applicant
  	#reset score attributes
    self.update(skills_score: nil, qualifications_score: nil, requirement_1_score: nil, requirement_2_score: nil, requirement_3_score: nil, requirement_4_score: nil,
    	 requirement_5_score: nil, requirement_6_score: nil, requirement_7_score: nil, requirement_8_score: nil, 
    	 requirement_9_score: nil, requirement_10_score: nil, requirement_total_score: nil)

    # self.skills_check? ? self.update(skills_score: 1) : self.update(skills_score: 0)
    # self.qualifications_check? ? self.update(qualifications_score: 1) : self.update(qualifications_score: 0)

    if self.skills_check == true
      self.update(skills_score: 1)
    elsif self.skills_check == false
      self.update(skills_score: 0)
    end

    if qualifications_check == true
      self.update(qualifications_score: 1)
    elsif qualifications_check == false
      self.update(qualifications_score: 0)	    	
    end

    if self.requirement_1_check == true
      self.update(requirement_1_score: 1)
    elsif self.requirement_1_check == false
      self.update(requirement_1_score: 0)
    end

    if self.requirement_2_check == true
      self.update(requirement_2_score: 1)
    elsif self.requirement_2_check == false
      self.update(requirement_2_score: 0)
    end


    if self.requirement_3_check == true
      self.update(requirement_3_score: 1)
    elsif self.requirement_3_check == false
      self.update(requirement_3_score: 0)
    end
    
    if self.requirement_4_check == true
      self.update(requirement_4_score: 1)
    elsif self.requirement_4_check == false
      self.update(requirement_4_score: 0)
    end

    if self.requirement_5_check == true
      self.update(requirement_5_score: 1)
    elsif self.requirement_5_check == false
      self.update(requirement_5_score: 0)
    end

    if self.requirement_6_check == true
      self.update(requirement_6_score: 1)
    elsif self.requirement_6_check == false
      self.update(requirement_6_score: 0)
    end
    
    if self.requirement_7_check == true
      self.update(requirement_7_score: 1)
    elsif self.requirement_7_check == false
      self.update(requirement_7_score: 0) 
    end
    
    if self.requirement_8_check == true
      self.update(requirement_8_score: 1)
    elsif self.requirement_8_check == false
      self.update(requirement_8_score: 0)
    end
    
    if self.requirement_9_check == true
      self.update(requirement_9_score: 1)
    elsif self.requirement_9_check == false
      self.update(requirement_9_score: 0)
    end
    
    if self.requirement_10_check == true
      self.update(requirement_10_score: 1)
    elsif self.requirement_10_check == false
      self.update(requirement_10_score: 0)     	  	
    end
    

    requirement_total = [self.requirement_1_score, self.requirement_2_score, self.requirement_3_score, self.requirement_4_score, self.requirement_5_score,
     self.requirement_6_score, self.requirement_7_score, self.requirement_8_score, self.requirement_9_score, self.requirement_10_score]

     # remove nil elements

     requirement_total.each do |i|
       if i == nil
       	requirement_total.delete(nil)
       end
     end

     requirement_total_score = 0

     requirement_total.each { |i| requirement_total_score += i }

    self.update(requirement_total_score: requirement_total_score)

    total = ((self.skills_score + self.qualifications_score + self.requirement_total_score)/ (2 + requirement_total.length)) * 100
    self.update(total_score: total)
    # byebug
  end
end
