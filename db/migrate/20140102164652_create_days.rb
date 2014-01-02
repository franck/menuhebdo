class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :position
      t.integer :menu_template_id

      t.timestamps
    end
  end
end
