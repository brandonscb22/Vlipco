class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|
      t.point :pointInit, :geographic => true
      t.point :pointFinish, :geographic => true
      t.string :status
      t.references :userRider, null: false, foreign_key: { to_table: :users }
      t.references :userDriver, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
