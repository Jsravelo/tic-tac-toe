class Board
  attr_accessor :player1, :player2

  def initialize
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
    @player1 = 'X'
    @player2 = 'O'
  end

  def print_board
    puts '-------'
    @board.each do |row|
      print '|'
      row.each { |cell| print "#{cell}|" }
      puts "\n-------"
    end
  end

  def player_choice
    print "Select an option from \n['a1','a2','a3']\n['b1','b2','b3']\n['c1','c2','c3']\n"
    gets.chomp.to_sym
  end

  def update_cell(choice, symbol)
    case choice
    when :a1 then @board[0][0] = symbol
    when :a2 then @board[0][1] = symbol
    when :a3 then @board[0][2] = symbol
    when :b1 then @board[1][0] = symbol
    when :b2 then @board[1][1] = symbol
    when :b3 then @board[1][2] = symbol
    when :c1 then @board[2][0] = symbol
    when :c2 then @board[2][1] = symbol
    when :c3 then @board[2][2] = symbol
    end
  end

  def play
    loop do
      choice = player_choice
      update_cell(choice, player1)
      print_board
      break if winning_condition == true

      choice2 = player_choice
      update_cell(choice2, player2)
      print_board
      break if winning_condition == true
    end
  end

  def check_horizontal?
    @board.each do |row|
      return true if [row[0], row[1], row[2]].uniq == [player1] ||
                     [row[0], row[1], row[2]].uniq == [player2]
    end
  end

  def check_vertical?
    @board.transpose.each do |row|
      return true if [row[0], row[1], row[2]].uniq == [player1] ||
                     [row[0], row[1], row[2]].uniq == [player2]
    end
  end

  def check_diagonal?
    1.times do |col|
      return true if [@board[0][col], @board[1][col + 1], @board[2][col + 2]].uniq == [player1] ||
                     [@board[0][col], @board[1][col + 1], @board[2][col + 2]].uniq == [player2]
    end
  end

  def winning_condition
    true if check_vertical? == true || check_horizontal? == true || check_diagonal? == true
  end
end

b = Board.new
# b.print_board
b.play
