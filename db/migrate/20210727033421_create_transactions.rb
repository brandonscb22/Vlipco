class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.float :amountInCents
      t.string :currency
      t.string :customerEmail
      t.json :paymentMethod
      t.string :reference
      t.integer :paymentSourceId
      t.json :response
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
