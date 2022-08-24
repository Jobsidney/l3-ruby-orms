require 'bundler'
Bundler.require

require_relative '../lib/student'

DB = { conn: SQLite3::Database.new("db/school.db") }

# RUN CODE FROM HERE
Student.create_table

#create_student
esther=Student.new(name: "Esther",age: 22,)
esther.save
job=Student.new(name: "Job",age: 22)
job.save

pp Student.show_all
p "YESSS"
esther.name="ANother Name"
esther.age=22
esther.update_record
esther.delete_student

pp Student.show_all
p "hello the oldest"
pp Student.the_oldest