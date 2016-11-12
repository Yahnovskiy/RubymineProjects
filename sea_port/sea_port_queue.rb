class Sea_port_queue
  attr_reader :dock_places, :max_docks_count

  def initialize(opt={})
    @dock_places = []
    @max_docks_count = opt.fetch(:max_docks_count, 3)
  end

  def moor(dock_num, ship)
    (@dock_places.size < @max_docks_count) ? @dock_places << ship : @dock_places.insert(dock_num, ship)
    @dock_places.index(ship) + 1
  end

  def unmoor(ship)
    free_dock = @dock_places.index(ship)
    @dock_places.delete(ship)
    free_dock
  end
end