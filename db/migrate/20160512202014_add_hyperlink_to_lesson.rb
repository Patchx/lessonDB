class AddHyperlinkToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :hyperlink, :string
  end
end
