class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.date :initial_date
      t.date :end_date
      t.boolean :payed, default: false
      t.decimal :price
      t.references :activity, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
