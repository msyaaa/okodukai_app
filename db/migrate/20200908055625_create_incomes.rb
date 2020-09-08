class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :price, null: false
      t.text :description, null: false
      t.date :date, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
