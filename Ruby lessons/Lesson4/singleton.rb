class Class
  alias old_new new
  @@instance = nil
  def new(*args)
    # puts args[0]
    # puts self.name
    if self.name == "AA"
      if (@@instance == nil)
        @@instance = old_new(*args)
        return @@instance
      else
        return @@instance
      end
    end
    return old_new(*args)
  end
end

class AA
  attr_accessor :a
  def initialize(a)
    @a = a
  end
end

class BB
  attr_accessor :b
  def initialize(b)
    @b = b
  end
end

def main
  a1 = AA.new(10)
  a2 = AA.new(20)
  b1 = BB.new(30)
  b2 = BB.new(40)

  puts a1.a
  puts a2.a
  puts b1.b
  puts b2.b
end
main
