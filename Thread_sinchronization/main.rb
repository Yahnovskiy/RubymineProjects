require './sincron.rb'
require './Consumer.rb'
require './producer.rb'
def main
  mutex = Mutex.new
  condition = ConditionVariable.new
  thumb = Thumb.new
  p1 = Producer.new(thumb, mutex, condition, "p1")
  p2 = Producer.new(thumb, mutex, condition, "p2")
  p3 = Producer.new(thumb, mutex, condition, "p3")
  p4 = Producer.new(thumb, mutex, condition, "p4")
  c1 = Producer.new(thumb, mutex, condition, "c1")
  c2 = Producer.new(thumb, mutex, condition, "c2")
  t1 = Thread.new(p1) do |p|
    p.execute
  end
  t1 = Thread.new(p1) do |p|
    p.execute
  end
  t2 = Thread.new(p2) do |p|
    p.execute
  end
  t3 = Thread.new(p3) do |p|
    p.execute
  end
  t4 = Thread.new(p4) do |p|
    p.execute
  end
  t5 = Thread.new(c1) do |p|
    p.execute
  end
  t1 = Thread.new(c2) do |p|
    p.execute
  end
  t1.join
end
main