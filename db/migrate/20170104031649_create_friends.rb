class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true
      t.references :stat, foreign_key: true

      t.timestamps
    end
  end
end
