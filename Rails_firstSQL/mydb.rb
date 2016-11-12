require 'pg'

def main
  # conn = PGconn.connect('127.0.0.1', 5432, '', '', 'myfirstrubydb', 'postgres', "1")
  # res=conn.exec("insert into myusers(name, surname)values('Ruby', 'Courses')")
  conn = PGconn.connect('127.0.0.1', 5432, '', '', 'myfirstrubydb', 'postgres', "1")
  res=conn.exec("select * from myusers")
  res.each do |row|
    puts row['name'] + '  ' + row['surname']+ '  '  +row['name']
  end
  conn.close
end
main