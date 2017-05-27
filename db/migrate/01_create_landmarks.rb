class CreateLandmarks < ActiveRecord::Migration
  #raise "Write CreateLandmarks migration here"
  create_table :landmarks do |l|
    l.string :name
    l.integer :year_completed
  end
end
