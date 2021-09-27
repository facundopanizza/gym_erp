class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
