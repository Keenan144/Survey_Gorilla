class CreateResponse < ActiveRecord::Migration
  create_table :responses do |t|
    t.string  :answer
    t.integer :count
    t.integer :question_id

    t.timestamps
  end
end
