class AddDefaultCurrentPageToPdfs < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pdfs, :current_page, 1
  end
end
