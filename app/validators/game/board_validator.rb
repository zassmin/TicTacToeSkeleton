class Game::BoardValidator < ActiveModel::Validator
  def validate(record)
    board = record.board

    unless board.is_a? Array && board.length == 3
      record.errors[:board] << "Board must contain three rows. (An array with three elements)" and return
    end

    board.each do |row|
      unless row.is_a? Array && row.length == 3
        record.errors[:board] << "Row must contain three elements. (nil allowed)" and return
      end

      row.each do |cell|
        unless cell.in? [nil, 'x', 'o']
          record.errors[:board] << "Each cell must be either 'x', 'o' or nil."
        end

      end
    end
  end
end
