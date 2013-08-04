class AddFieldsToCandidateForm < ActiveRecord::Migration
  def change
    add_column :candidate_forms, :other_nationality, :string
    add_column :candidate_forms, :other_visa_status, :string
    add_column :candidate_forms, :other_language, :string
    add_column :candidate_forms, :other_experience_in_sp, :string
  end
end
