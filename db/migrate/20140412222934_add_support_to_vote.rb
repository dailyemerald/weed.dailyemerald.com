class AddSupportToVote < ActiveRecord::Migration
  def change
    add_column :votes, :support, :string
    add_index :votes, :support
  end
end
