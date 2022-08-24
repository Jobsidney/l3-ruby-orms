require 'bundler'
Bundler.require

require_relative '../lib/student'

DB = { conn: SQLite3::Database.new("db/school.db") }

# RUN CODE FROM HERE
Student.create_table

#create_student
esther=Student.new(name: "Esther",age: 22)
esther.save