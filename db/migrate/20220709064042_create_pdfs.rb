class CreatePdfs < ActiveRecord::Migration[7.0]
  def change
    create_table :pdfs do |t|
      t.string :title
      t.datetime :last_accessed
      t.integer :current_page

      t.timestamps
    end
  end
end
