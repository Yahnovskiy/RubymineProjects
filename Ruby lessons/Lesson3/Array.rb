# my_array1 = [1,20,50,80]
# my_array2 = my_array1.clone
# my_array2 << 1000
# puts my_array1.to_s
# puts my_array2.to_s

#classes
class A
  attr_accessor :a
  def initialize ()
  end
end
# objects клонирование
p1 = A.new()
p2 = A.new()
p1.a = 10
p2.a = 20

my_array3 = [p1, p2]
my_array4 = [p1.clone, p2.clone]

my_array3[0].a = 100
# puts "my_array3[0].a= #{my_array3[0].a}"
for i in (0...my_array4.length)
  puts my_array4[i].a
end