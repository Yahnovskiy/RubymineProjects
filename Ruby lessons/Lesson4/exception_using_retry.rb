class Divided_by_zero_exception < Exception
  attr_reader :message

  def initialize (message)
    @message = message
  end
end

def divide(a, b)
  begin
  if b == 0
    raise Divided_by_zero_exception.new("divided by 0")# возбудили исключение ищем подходящий рескью блок
  end
  return a/b
rescue Divided_by_zero_exception => e
  e.message
  puts "first rise exception"
  raise Exception
  end
end

def main
  begin
    puts divide(10, 0) # exception
  rescue Divided_by_zero_exception => e
    puts "Second raise exception"
  rescue Exception
    puts "Exception mesage"
  end
end

main

