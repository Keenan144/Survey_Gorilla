class CreateQuestion < ActiveRecord::Migration
  create_table :questions do |t|
    t.string  :title
    t.integer :survey_id

    t.timestamps
  end
end
