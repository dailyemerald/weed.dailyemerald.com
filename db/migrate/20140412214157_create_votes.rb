class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :user
      t.string :checkboxes
      t.text :story
      t.boolean :story_approved

      t.timestamps
    end
    add_index :votes, :user
    add_index :votes, :story_approved
  end
end
