class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :token
      t.string :typeCard
      t.string :idCard
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
