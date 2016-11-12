require 'thread'

class Sum
  attr_reader :first, :last, :result

  def initialize(first, last)
    @first = first
    @last = last
    @result = 0
  end

  def calculate
    (@first...@last).each{ |i| @result += i}
  end

  def to_s
    @result.to_s
  end
end

$cmp_data = []
def calculate_in_threads(max_number, threads_count)
  start_time = Time.now
  sum_parts = []
  threads = []
  step = (max_number / threads_count).floor
  first_num = 0
  last_num = if (threads_count == 1) then
               step + 1
             else
               step
             end

  while (last_num <= max_number)
    sum = Sum.new(first_num, last_num)
    sum_parts << sum
    th = Thread.new(sum) do |s|
      s.calculate
    end
    threads << th
    first_num = last_num
    last_num += step
  end
  if last_num > max_number
    last_num -= step
    sum = Sum.new(last_num, max_number + 1)
    sum_parts << sum
    th = Thread.new(sum) do |s|
      s.calculate
    end
    threads << th
  end

  # (0...threads_count).each do |i|
  #   sum = Sum.new(first_num, last_num)
  #   sum_parts << sum
  #   threads << Thread.new(sum){ |s| s.calculate }
  #   first_num = last_num
  #   if (i == threads_count - 2) then
  #     last_num += max_number - last_num + 1
  #   else
  #     last_num += step
  #   end
  # end

  threads.each {|t| t.join}
  # result = sum_parts.map{|p| p.result}.reduce(:+)
  result = 0
  sum_parts.each do |sp|
    result += sp.result
  end

  end_time = Time.now
  duration = end_time - start_time
  $cmp_data << {:duration => duration, :threads_count => threads_count, :result => result}
end

def main
  max_number = 100
  (1..10).each {|i| calculate_in_threads(max_number, i)}
  puts $cmp_data
  puts '-'*60
  puts $cmp_data.sort_by!{|el| el[:duration]}
end

main