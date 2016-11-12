class Player
  def initialize(type, field)
    @type = type
    @field = field
  end

  def is_empty_cell?
  @field.is_empty_cell?
end

def is_win?
  @field.is_line?(@type)
end

def step
  #
end
def get_free_cell
  for i in 0..2 do
    for j in 0..2 do
      if @cells[i][j].type = "p"
        return i,j
      end
    end
  end

end
end