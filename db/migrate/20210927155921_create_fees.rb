class CreateFees < ActiveRecord::Migration[6.1]
  def change
    create_table :fees do |t|
      t.date :initial_date
      t.date :end_date
      t.boolean :payed
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
