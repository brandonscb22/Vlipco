class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastName
      t.string :email
      t.string :phone
      t.string :typeUser

      t.timestamps
    end
  end
end
