module A
  def method_A
    puts "A"
  end
end

module B
  def method_B
    puts "B"
    # puts @field
  end
end

class C
 include A
 include B
 # attr_accessor :field
 # def initialize
 #   @field = 50
 # end
  def method_C
    puts "C"
      end
end
def main
  c = C.new
  c.method_A
  c.method_B
  c.method_C
end
main