class Warehouse_queue
  attr_reader :wh_places, :max_wh_size

  def initialize(opt={})
    @wh_places = []
    @max_wh_size = opt.fetch(:max_wh_size, 5)
  end

  def put(cargo)
    @wh_places << cargo
  end

  def get
    @wh_places.delete_at(0)
  end
end