require './warehouse'
class Ship
  def initialize(opts={})
    @sea_port_queue = opts.fetch(:sea_port_queue, nil)
    @sea_port_mutex = opts.fetch(:sea_port_mutex, nil)
    @sea_port_condition = opts.fetch(:sea_port_condition, nil)
    @name = opts.fetch(:name, nil)
    @warehouses = opts.fetch(:warehouses, 1)
    @dock_num = 0
  end

  def execute
    actions = %w[put take]
    while true
      @sea_port_mutex.synchronize do
        while @sea_port_queue.dock_places.size == @sea_port_queue.max_docks_count
          @sea_port_condition.wait(@sea_port_mutex)
        end
        @dock_num = @sea_port_queue.moor(@free_dock, @name)
        puts "ship '#{@name}' is moored to dock '#{@dock_num}'\n"
        action = actions[Random.rand(actions.size)]
        @warehouses[@dock_num].execute(action, @name, @dock_num)
        # @sea_port_condition.broadcast
        # sleep 0.5
      end

      @sea_port_mutex.synchronize do
        @free_dock = @sea_port_queue.unmoor(@name)
        puts "ship '#{@name}' unmoored from the dock '#{@dock_num}'\n"
        @sea_port_condition.broadcast
      end

    end
  end
end