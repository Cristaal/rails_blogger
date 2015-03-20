
ActiveRecord::Schema.define(version: 20150320162036) do


  enable_extension "plpgsql"

  create_table "bloggers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
