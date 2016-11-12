class Producer

  def initialize(tumba, mutex, condition, name)
    @tumba = tumba
    @mutex = mutex
    @condition = condition
    @name = name
  end

  def execute
    while true
      @mutex.synchronize do
        while @tumba.size >= 4
          @condition.wait(@mutex)
        end
        @tumba.put("gold")
        @condition.broadcast
        puts "the producer #{@name} put the 'gold'"
      end
    end
  end
end