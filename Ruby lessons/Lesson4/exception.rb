class Divided_by_zero_exception < Exception
  attr_reader :message

  def initialize (message)
    @message = message

  end
  
end

def divide(a, b)
  if b == 0
    raise Divided_by_zero_exception.new("divided by 0")# возбудили исключение ищем подходящий рескью блок
  end
  return a/b
end

def main
  begin
  puts divide(10, 0) # exception
  puts divide(10, 2)
  rescue Divided_by_zero_exception => e
  puts e.message
  puts "Exception"

  rescue Exception => e
  puts e.message
    puts "Divided by 0"
  end

ensure # метод который вызывается в любом случае
  puts "ensure"
end

main
# обрабатывается первый рескью блок