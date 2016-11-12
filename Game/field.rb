class Field
  def initialize
    @cells = []
    # for in (0...3) do
    # temp = []
    #   for in (0...3) do
    #   temp << Cell.new
    #   end
    #   @cells << temp
    # end

    for i in (0...3) do
      for j in (0...3) do
        @cells[i][j] = Cell.new
      end
    end
  end

  def is_empty_cell?
    for i in (0...3) do
      for j in (0...3) do
        if (@cells[i][j].type == "p")
          return true
        end
      end
    end
    return false
  end

  def is_line?(t)
    # check line of X or 0
    # дописать!!!!!!!!!!!!!!!!!!!!!!!!!!
    if @cells[0][0].type == t && @cells[0][1].type == t && @cells[0][2].type == t
      return true
    end
    return false
  end
  def show
    for i in 0..2 do
      for j in 0..2 do
        print @cells[i][j].type
      end
      puts '\n'
    end
    def add_point(x,y,type)
      @cells[x][y].type = type
    end
  end
end