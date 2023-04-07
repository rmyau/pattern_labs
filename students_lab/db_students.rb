require 'sqlite3'

db = SQLite3::Database.open "./db_student.sql"
db.results_as_hash = true
results = db.execute "SELECT * from students"
puts results