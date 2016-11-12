require 'thread'
require './ship'
require './warehouse_queue'
require './sea_port_queue'
require './warehouse'
def main
  sea_port_mutex = Mutex.new
  sea_port_condition = ConditionVariable.new
  sea_port_queue = Sea_port_queue.new(:max_docks_count => 3)

  warehouses = []
  ships = []
  threads = []

  (0..sea_port_queue.max_docks_count).each { |i| warehouses << Warehouse.new(:wh_name => "wh_#{i}", :wh_queue => Warehouse_queue.new(:max_wh_size => 6)) }

  (1..10).each do |i|
    ships << Ship.new(:name => "ship_#{i}", :sea_port_queue => sea_port_queue, :sea_port_mutex => sea_port_mutex,
                      :sea_port_condition => sea_port_condition, :warehouses => warehouses)
  end

  ships.each { |ship| threads << Thread.new(ship) { |s| s.execute } }
  threads[0].join
end

main