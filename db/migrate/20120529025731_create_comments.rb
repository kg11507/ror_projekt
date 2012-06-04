class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.references :subject, :polymorphic => true
      t.timestamps
    end
  end
end
