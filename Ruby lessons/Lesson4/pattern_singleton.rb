class Singleton
   @@counter = 0
   attr_accessor :a
    if (@@counter > 2)
      def initialize (a)
      @a = a
      @@counter += 1
   end
  end
end

def main
  c = Singleton.new
  c1 = Singleton.new
  c2 = Singleton.new
  puts c.a
  puts c1.a
  puts c2.a
end

main
