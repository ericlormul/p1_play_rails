class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string   "name"
      t.text     "description"
      t.string   "pic_url"
      t.string   "privider"
      t.string   "homepage"
      t.integer  "price"
      t.integer  "year"
      t.string   "season"
      t.string   "category"
      t.date     "start_date"
      t.date     "end_time"      

      t.timestamps null: false
    end
  end
end
