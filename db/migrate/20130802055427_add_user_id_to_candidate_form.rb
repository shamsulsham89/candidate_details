class AddUserIdToCandidateForm < ActiveRecord::Migration
  def change
    add_column :candidate_forms, :user_id, :integer
  end
end
