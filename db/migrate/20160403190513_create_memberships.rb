class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :family_id
      t.boolean :authorized, default: false

      t.timestamps null: false
    end
  end
end
