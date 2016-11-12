class A
  @@static_field = 10
  MY_CONST = 100


  def set_static_field(value)
    @@static_field = value
  end

  def get_static_field()
    @@static_field
  end
end
# creating object
def main
  # a1 = A.new
  # a2 = A.new
  # a1.set_static_field(10000)
  # puts a2.get_static_field
  A.set_static_field(100)
  puts A.get_static_field
  
end

main

# create static method
