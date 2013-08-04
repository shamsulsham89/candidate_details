class CreateCandidateForms < ActiveRecord::Migration
  def change
    create_table :candidate_forms do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.date :birth_date
      t.string :gender
      t.string :nationality
      t.string :other_nationality, :string
      t.string :living_in_emirates
      t.string :visa_status
      t.string :other_visa_status, :string
      t.date :visa_valid_till
      t.string :emirate_id
      t.string :languages_known
      t.string :other_language, :string
      t.string :uae_dl
      t.string :have_car
      t.string :experience_in_uae
      t.string :experience_in_sp
      t.string :other_experience_in_sp, :string
      t.string :job_type
      
      t.timestamps
    end
  end
end
