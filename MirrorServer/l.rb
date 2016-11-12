class Notimplemented < Exception
end

class A
  def f()
    raise Notimplemented.new

  end
end

class B < A
end

def main
  b = B.new
  b.f
end
main