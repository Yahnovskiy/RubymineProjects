class Warehouse
  attr_reader :wh_name, :wh_queue, :wh_mutex, :wh_condition
  def initialize (opts={})
    @wh_name = opts.fetch(:wh_name, nil)
    @wh_queue = opts.fetch(:wh_queue, Warehouse_queue.new)
    @wh_mutex = opts.fetch(:wh_mutex, Mutex.new)
    @wh_condition = opts.fetch(:wh_condition, ConditionVariable.new)
  end

  def execute(action, name, dock_num)
    puts "warehouse '#{@wh_name}' capacity is #{@wh_queue.wh_places.size} in the dock '#{dock_num}'\n"
    if action == 'put'
      @wh_mutex.synchronize do
        if @wh_queue.wh_places.size <  @wh_queue.max_wh_size
          @wh_queue.put('cargo')
          puts "ship '#{name}' put cargo on dock '#{dock_num}' and warehouse '#{@wh_name}'\n"
          @wh_condition.broadcast
        else
          puts "ship '#{name}' wants to put cargo to dock '#{dock_num}', but warehouse '#{@wh_name}' in dock '#{dock_num}' is full\n"
        end
      end
    else
      @wh_mutex.synchronize do
        if @wh_queue.wh_places.empty?
          puts "ship '#{name}' wants to take cargo from dock '#{dock_num}', but warehouse '#{@wh_name}' in dock '#{dock_num}' is empty\n"
        else
          @wh_queue.get
          puts "ship '#{name}' take cargo from dock '#{dock_num}'\n"
          @wh_condition.broadcast
        end
      end
    end
    # sleep(0.5)
  end
end