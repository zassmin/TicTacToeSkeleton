module GamesHelper

  def display_board
    "#{display_line(0)}" +
    "- - -\n" +
    "#{display_line(1)}" +
    "- - -\n" +
    "#{display_line(2)}"
  end

  def display_element(row, column)
    element = board[row][column]
    if element
      element
    else
      ' '
    end
  end

  def display_line(row)
    "#{display_element(row,0)}|#{display_element(row,1)}|#{display_element(row,2)}\n"
  end


end