class CreateMenuTemplates < ActiveRecord::Migration
  def change
    create_table :menu_templates do |t|
      t.string :title

      t.timestamps
    end
  end
end
