class CandidateForm < ActiveRecord::Base
  attr_accessible :birth_date, :contact, :email, :emirate_id, :experience_in_sp, :experience_in_uae, :gender, :have_car, :job_type, :languages_known, :living_in_emirates, :name, :nationality, :uae_dl, :visa_status, :visa_valid_till, :resume
  attr_accessible :photo, :user_id, :other_nationality, :other_visa_status, :other_language, :other_experience_in_sp
  mount_uploader :resume, ResumeUploader
  mount_uploader :photo, PhotoUploader
  
  validates :name,  presence: true
  validates :contact,  presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,  presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :birth_date,  presence: true
  validates :gender,  presence: true
  validates :nationality,  presence: true
  validates :living_in_emirates,  presence: true
  validates :visa_status,  presence: true
  validates :visa_valid_till,  presence: true
  validates :emirate_id,  presence: true
  validates :languages_known,  presence: true
  validates :uae_dl,  presence: true
  validates :have_car,  presence: true
  validates :experience_in_uae,  presence: true
  #validates :experience_in_sp,  presence: true
  validates :job_type,  presence: true
  validates :resume,  presence: true, :on => :create
  
  validate :other_nationality, :if  => :other_nation
  def other_nation  
    if nationality == "Other"
      if other_nationality == ""
      errors.add(:other_nationality, "can't be blank")
      end
    else
    end
  end
  
  validate :other_visa_status, :if  => :other_visa
  def other_visa  
    if visa_status == "Other"
      if other_visa_status == ""
      errors.add(:other_visa_status, "can't be blank")
      end
    end
  end
  
  validate :other_language, :if  => :other_lang
  def other_lang  
      if languages_known.split(',').last == "Other" 
        if other_language == ""
         errors.add(:other_language, "can't be blank")
        end
      end
  end
  
  validate :other_experience_in_sp, :if  => :other_exp_sp
  def other_exp_sp 
      if experience_in_sp.split(',').last == "Other" 
        if other_experience_in_sp == ""
         errors.add(:other_experience_in_sp, "can't be blank")
        end
      end
  end
  
  belongs_to :user
end
