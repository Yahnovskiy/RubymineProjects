class Sum
  attr_reader :result

  def initialize(first,last)
    @first=first
    @last=last
    @result=0

  end
  def calculate
    for i in @first..@last
      @result+=i
    end
  end
end

def main
  s1 = Sum.new(0,500)
  t1 = Thread.new(s1) do |s|
   s.calculate
  end
  s2 = Sum.new(500,1001)
  t2 = Thread.new(s2) do |s|
  s.calculate
  end
  t1.join
  t2.join
  res = s1.result + s2.result
  puts res
  end
main