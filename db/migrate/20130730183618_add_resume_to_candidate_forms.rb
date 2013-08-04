class AddResumeToCandidateForms < ActiveRecord::Migration
  def change
    add_column :candidate_forms, :resume, :string
  end
end
