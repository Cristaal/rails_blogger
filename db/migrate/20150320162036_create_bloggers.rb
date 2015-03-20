class CreateBloggers < ActiveRecord::Migration
  def change
    create_table :bloggers do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
