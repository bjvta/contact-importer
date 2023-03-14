# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :birthday
      t.string :phone
      t.string :address
      t.string :credit_card_number
      t.string :credit_card_network
      t.string :credit_card_last_for_digit
      t.string :email
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
