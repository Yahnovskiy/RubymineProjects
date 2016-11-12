class Producer
  def initialize(thumb, mutex, condition, name)
    @thumb = thumb
    @mutex = mutex
    @condition = condition
    @name = name
  end
  def execute
    while true
      @mutex.synchronize do # флаjок поставил
        while @thumb.size >= 4
          condition.wait(@mutex) # standard wait method
        end
        @thumb.put("gold")
        @condition.broadcast
        puts "The producer" + @{name} + "Put the gold"
      end
    end
  end
end