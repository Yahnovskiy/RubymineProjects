require './producer'
require './consumer'
require './tumba'

def main
  mutex = Mutex.new
  condition = ConditionVariable.new
  tumb = Tumba.new
  p1 = Producer.new(tumb, mutex, condition, "p1")
  p2 = Producer.new(tumb, mutex, condition, "p2")
  p3 = Producer.new(tumb, mutex, condition, "p3")
  p4 = Producer.new(tumb, mutex, condition, "p4")

  c1 = Consumer.new(tumb, mutex, condition, "c1")
  c2 = Consumer.new(tumb, mutex, condition, "c2")

  t1 = Thread.new(p1) {|p| p.execute}
  t2 = Thread.new(p2) {|p| p.execute}
  t3 = Thread.new(p3) {|p| p.execute}
  t4 = Thread.new(p4) {|p| p.execute}
  t5 = Thread.new(c1) {|c| c.execute}
  t6 = Thread.new(c2) {|c| c.execute}

  t1.join
end

main