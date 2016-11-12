#synchronization of threads
require 'thread'

class Tumba
  attr_reader :size

  def initialize
    @size = 0
    @places = []
  end

  def put(gold)
    @places << gold
    @size += 1
  end

  def get
    @size -= 1
    @places.delete_at(0)
  end
end
