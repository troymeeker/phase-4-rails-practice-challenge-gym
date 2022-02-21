class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.references :gym
      t.references :client
      t.integer :charge

      t.timestamps
    end
  end
end
