module My_module
  MY_CONST = 100
  def mod_method (a, b)
    a+b
  end
  class A
    attr_accessor :c
    def initialize (c)
      @c = c

    end
  end
end
def my_method()
  include My_module

  val1 = 10
  val2 = 20
  include My_module
  puts My_module::mod_method(val1, val2)
  p = My_module::A.new(10)
puts p.c
end

my_method