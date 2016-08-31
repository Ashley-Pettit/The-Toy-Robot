class Table
  def initialize
    @table_width = 5
    @table_height = 5
  end

  def table_range(width_or_height)
    # The actual range is 0..4 but 5 is used for ease of alteration.
    (0..width_or_height - 1)
  end

  def placement_in_bounds?(x_position, y_position)
    table_range(@table_width).include?(x_position) && table_range(@table_height).include?(y_position)
  end

  def move_in_bounds?(vector, x_position, y_position)
    # Will moving in the present direction cause a movement out of bounds?
    if vector == "NORTH" && table_range(@table_height).include?(y_position + 1)
      true
    elsif vector == "EAST" && table_range(@table_width).include?(x_position + 1)
      true
    elsif vector == "SOUTH" && table_range(@table_height).include?(y_position - 1)
      true
    elsif vector == "WEST" && table_range(@table_width).include?(x_position - 1)
      true
    else
      false
    end
  end
end
