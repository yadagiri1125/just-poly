class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
