class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
