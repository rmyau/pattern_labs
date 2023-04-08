require 'sqlite3'
class StudentDB
  private_class_method :new
  @@instance = nil
  def initialize
    @db = SQLite3::Database.open 'C:\Users\katya\Desktop\ruby_lab\db_student.sql'
    @db.results_as_hash=true
  end

  def self.instance
    if @@instance.nil?
      @@instance=StudentDB.new
    end
    @@instance
  end

  def execute(query, *args)
    @db.execute(query,*args)
  end

  def results_as_hash=(bool)
    @db.results_as_hash=bool
  end

end