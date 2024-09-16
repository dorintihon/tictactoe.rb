class TicTacToe
  def initialize
    @board = Array(1..9)  # Initial board with numbers 1 to 9
    @current_player = "X" # First player is X
  end

  # Display the current state of the board
  def display_board
    puts "\n"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "\n"
  end

  # Check if a player has won
  def check_winner
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]

    winning_combinations.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return @board[combo[0]]
      end
    end
    nil
  end

  # Check if the game board is full
  def board_full?
    @board.all? { |cell| cell.is_a?(String) }
  end

  # Switch the current player
  def switch_player
    @current_player = @current_player == "X" ? "O" : "X"
  end

  # Make a move on the board
  def make_move(position)
    if @board[position - 1].is_a?(Integer)
      @board[position - 1] = @current_player
    else
      puts "Position already taken, try again!"
      return false
    end
    true
  end

  # Start the game loop
  def play
    puts "Welcome to Tic-Tac-Toe!"
    display_board

    loop do
      puts "Player #{@current_player}'s turn. Choose a position (1-9):"
      position = gets.chomp.to_i

      if position.between?(1, 9) && make_move(position)
        display_board

        if winner = check_winner
          puts "Player #{winner} wins!"
          break
        elsif board_full?
          puts "It's a draw!"
          break
        else
          switch_player
        end
      else
        puts "Invalid move! Please enter a valid position."
      end
    end
  end
end

# Start the game
game = TicTacToe.new
game.play
