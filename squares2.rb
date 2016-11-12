require 'thread'

def random_array(len, max_num=3)
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

$i = 0

class Home_square
  attr_reader :put_el_queue
  def initialize(opts={})
    @get_el_mutex = opts.fetch(:get_element_mutex)
    @get_el_condition = opts.fetch(:get_element_condition)
    @get_el_queue = opts.fetch(:get_element_queue)
    @put_el_mutex = opts.fetch(:put_element_mutex)
    @put_el_condition = opts.fetch(:put_element_condition)
    @put_el_queue = opts.fetch(:put_element_queue)
    @elem = nil
  end

  def make_squares(opts={})
    thread_num = opts.fetch(:thread, "thread_0")
    until @get_el_queue.array.empty?
      @get_el_mutex.synchronize do
        unless @get_el_queue.array.empty?
          until @elem.nil?
            @get_el_condition.wait(@get_el_mutex)
          end
          @elem = @get_el_queue.get_first_element
          # puts "thread '#{thread_num}' is working; elem = #{@elem}; array size = #{@get_el_queue.array.size}\n"
          @get_el_condition.broadcast
        end
      end

      @put_el_mutex.synchronize do
        unless @get_el_queue.array.empty? && @elem.nil?
          square = @elem * @elem
          puts "thread '#{thread_num}' is working; elem = #{@elem}; square = #{square}, array size = #{@get_el_queue.array.size}\n"
          @put_el_queue.put_element(square)
          @elem = nil
          @put_el_condition.broadcast
        end
      end

    end
  end

end


class Square_queue
  attr_accessor :array
  def initialize(array)
    @array = array
  end

  def get_first_element
    @array.delete_at(0)
  end

  def put_element(el)
    @array << el
  end
end

def main(array_len, threads_cnt)
  array = random_array(array_len, 10)
  array_sqrs = []
  threads =[]
  arr_get_mutex = Mutex.new
  arr_get_condition = ConditionVariable.new
  get_queue = Square_queue.new(array)
  arr_put_mutex = Mutex.new
  arr_put_condition = ConditionVariable.new
  put_queue = Square_queue.new(array_sqrs)
  puts "initial array size: #{array.size}"
  puts "initial array: #{array}"
  start_time = Time.now.to_f
  (0...threads_cnt).each do |i|
    num = Home_square.new(:get_element_mutex => arr_get_mutex, :get_element_condition => arr_get_condition, :get_element_queue => get_queue,
                          :put_element_mutex => arr_put_mutex, :put_element_condition => arr_put_condition, :put_element_queue => put_queue
    )
    threads << Thread.new(num) { |n| n.make_squares(:thread => "thread_#{i+1}") }
  end
  puts "threads_count is #{threads.size}\n"
  threads.each {|t| t.join}
  puts "new array size: #{array_sqrs.size}"
  puts "new array: #{array_sqrs}"
  end_time = Time.now.to_f
  duration = end_time - start_time
  puts "duration is: #{duration}"
end

main(100000, 10)
