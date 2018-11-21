class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.belongs_to :user
      t.belongs_to :classroom
      t.timestamps
    end
  end
end
