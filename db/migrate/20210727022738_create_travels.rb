class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|
      t.point :pointInit
      t.point :pointFinish
      t.references :userRider, null: false, foreign_key: { to_table: :users }
      t.references :userDriver, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
