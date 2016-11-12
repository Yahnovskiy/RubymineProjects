class Consumer

  def initialize(tumba, mutex, condition, name)
    @tumba = tumba
    @mutex = mutex
    @condition = condition
    @name = name
  end

  def execute
    while true
      @mutex.synchronize do
        while @tumba.size == 0
          @condition.wait(@mutex)
        end
        @tumba.get
        @condition.broadcast
        puts "the consumer #{@name} took the 'gold'"
      end
    end
  end
end