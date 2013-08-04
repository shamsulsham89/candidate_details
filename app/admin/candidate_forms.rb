ActiveAdmin.register CandidateForm do
  
  #filter :user, :collection => proc {(User.all).map{|c| [c.email, c.id]}}
  
  member_action :download_resume, :method => :get do
      candidate_form = CandidateForm.find(params[:id])
      send_file candidate_form.resume.path
  end
  
  member_action :download_image, :method => :get do
      candidate_form = CandidateForm.find(params[:id])
      send_file candidate_form.photo.path
  end
  
  config.per_page = 10
  
  index do 
   
    selectable_column
    
    column :name
    column :contact
    column :email
    column :birth_date    
    column :gender
    column :nationality
    column :other_nationality
    column :living_in_emirates
    column :visa_status
    column :other_visa_status
    column :visa_valid_till
    column :emirate_id
    column :languages_known
    column :other_language
    column :uae_dl
    column :have_car
    column :experience_in_uae
    column :experience_in_sp
    column :other_experience_in_sp
    column :job_type
    #column :resume
    column "Image" do |candidate_form|
      if candidate_form.photo.url
      link_to image_tag(candidate_form.photo.url, :size => "100x100", :alt => "#{candidate_form.photo}"), download_image_admin_candidate_form_path(candidate_form)
      else
        "No Image"
      end
    end
    column "Resume" do |candidate_form|
      link_to "Download", download_resume_admin_candidate_form_path(candidate_form)
    end
                 
    default_actions                   
  end
  
  
end
