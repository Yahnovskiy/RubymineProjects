class Field
  def initialize()
     @cells = []
    # for in (0...3) do
    #   temp = []
    #   for in (0...3) do
    #     temp << Cell.new
    #   end
    #   @cells << temp
    # end
      for i in (0...3) do
      for j in (0...3) do
        @cells[i][j]= cell.new
      end
    end
  end
  def is_empty_cell?
    for i in (0...3) do
      for j in (0...3) do
        if (@cells[i][j].type? == "p")
        return true
        end
      end
    end
  end
  def is_line?(type)
  #   check line of x or o
     if @cells[0][0].type == type && @cells[0][1].type == type && @cells[0][2].type == type
      return true
     end
     if @cells[0][0].type == type && @cells[0][1].type == type && @cells[0][2].type == type
       return true
     end
     if @cells[0][0].type == type && @cells[0][1].type == type && @cells[0][2].type == type
       return true
     end
     if @cells[0][0].type == type && @cells[0][1].type == type && @cells[0][2].type == type
       return true
     end
     if @cells[0][0].type == type && @cells[0][1].type == type && @cells[0][2].type == type
       return true
     end
     if @cells[0][0].type == type && @cells[0][1].type == type && @cells[0][2].type == type
       return true
     end
     if @cells[0][0].type == type && @cells[0][1].type == type && @cells[0][2].type == type
       return true
     end

  end
  return false
end
