class Student
    attr_accessor :name, :age, :id

    def initialize(name:, age:, id: nil)
        @id=id
        @name=name
        @id=id
    end
    

# TODO: CREATE TABLE
def self.create_table
    query= <<-SQL
        CREATE TABLE IF NOT EXISTS students(id INTEGER PRIMARY KEY,name TEXT,age INTEGER
        )
    SQL
    DB[:conn].execute(query)
end

# TODO: INSERT RECORD
def save
    query=<<-SQL
        INSERT INTO students(name,age) VALUES(?,?)
    SQL
    DB[:conn].execute(query,self.name,self.age)
    set_id
end

# TODO: SHOW ALL RECORDS



# TODO: UPDATE RECORD

# TODO: DELETE RECORD

# TODO: CONVERT TABLE RECORD TO RUBY OBJECT
def wholeTable(row)
    Student.new(
        name:row[1],
        age:row[2],
        id: row[0]
    )
end

# TODO: SEARCH FOR RECORD THAT MEETS CERTAIN CONDITIONS
private
def set_id
    query=<<-SQL
        SELECT last_insert_rowid() FROM students
    SQL
    retreved_id=DB[:conn].execute(query)
    self.id=retreved_id[0][0]
end

end
