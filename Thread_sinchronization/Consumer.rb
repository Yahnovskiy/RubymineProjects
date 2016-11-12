class Consumer
  def initialize(thumb, mutex, condition, name)
    @thumb = thumb
    @mutex = mutex
    @condition = condition
    @name = name
  end
  def execute
    while true
      @mutex.synchonize do #
        while @thumb.size == 0
          @condition.wait(mutex) # если равно нуль то ждать
        end
        @thumb.get
        @condition.broadcast
        puts "The consumer" + name + "Take the gold"
      end
    end
  end
end