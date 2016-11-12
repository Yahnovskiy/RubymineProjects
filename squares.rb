require 'thread'

def random_array(len, max_num=99)
  array = []
  (0...len).each { array << ((!number?(max_num) || max_num <= 0) ? Random.rand : Random.rand(max_num)) }
  array
end

def get_superclass(classes, class_name)
  classes << class_name
  (class_name.superclass == Object) ? classes : get_superclass(classes, class_name.superclass)
end

def number?(obj)
  classes = []
  get_superclass(classes, obj.class)
  classes.include?(Numeric)
end

class Home_square
  attr_reader :array_out
  def initialize(mutex, condition, array)
    @array_in = array
    @array_out = []
    @mutex = mutex
    @condition = condition
  end

  def make_squares
    until @array_in.empty?
      @mutex.synchronize do
        break if @array_in.empty?
        element = @array_in.delete_at(0)
        @array_out << element * element
        @condition.broadcast
      end
    end
  end
end

def main(array_len, threads_cnt)
  array = random_array(array_len)
  threads =[]
  arr_mutex = Mutex.new
  arr_condition = ConditionVariable.new
  puts "initial array size: #{array.size}"
  puts "initial array: #{array}"
  start_time = Time.now.to_f
  num = Home_square.new(arr_mutex, arr_condition, array)
  (0...threads_cnt).each { threads << Thread.new(num) { |n| n.make_squares } }
  puts "threads_count is #{threads.size}"
  threads.each {|t| t.join}
  puts "new array size: #{num.array_out.size}"
  puts "new array: #{num.array_out}"
  end_time = Time.now.to_f
  duration = end_time - start_time
  puts "duration is: #{duration}"
end

main(100000, 10)
