class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :dni
      t.string :phone_number
      t.date :birthday
      t.string :email

      t.timestamps
    end
  end
end
