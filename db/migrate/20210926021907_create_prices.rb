class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.decimal :amount
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
