#найти сумму ряда 1+2+3+...+1000
# в нескольких потоках
# 1-й кладывает [1;500)
# 2-1 складывает [500;1000)
# 3-й складывает 1 со 2
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
end


def main
  s1 = Sum.new(0, 500)
  s2 = Sum.new(500, 10001)
  thread1 = Thread.new(s1){ |s| s.calculate }
  thread2 = Thread.new(s2){ |s| s.calculate }

  thread1.join
  thread2.join
  res = s1.result + s2.result
  puts res.to_s
end

main


