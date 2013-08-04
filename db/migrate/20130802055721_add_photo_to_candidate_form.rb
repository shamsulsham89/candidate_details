class AddPhotoToCandidateForm < ActiveRecord::Migration
  def change
    add_column :candidate_forms, :photo, :string
  end
end
