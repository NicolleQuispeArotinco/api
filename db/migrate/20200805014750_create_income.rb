class CreateIncome < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.integer :amount
      t.string :type_coin
      t.date :release_date
    end
  end
end
