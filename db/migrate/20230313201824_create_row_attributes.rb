# frozen_string_literal: true

class CreateRowAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :row_attributes do |t|
      t.string :attr_type
      t.string :val
      t.belongs_to :row_importer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
