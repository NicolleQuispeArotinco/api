class CreatePersonal < ActiveRecord::Migration[6.0]
  def change
    create_table :personals do |t|
      t.string :name
      t.string :last_name
      t.string :area
      t.integer :years
    end
  end
end
