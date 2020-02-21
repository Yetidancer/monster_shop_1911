class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, force: :cascade do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :password_digest
    end
  end
end
