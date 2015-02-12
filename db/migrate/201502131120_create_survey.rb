class CreateSurvey < ActiveRecord::Migration
  create_table :surveys do |t|
    t.string  :title
    t.integer :user_id

    t.timestamps
  end
end
