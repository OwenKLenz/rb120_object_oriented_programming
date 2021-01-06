class Player
  NUMBER_OF_GUESSES = 7
  VALID_GUESS_RANGE = 1..100
  @@players = []

  attr_accessor :remaining_guesses, :score, :name, :guess

  def initialize(name)
    @name = name
    @guess = nil
    @remaining_guesses = NUMBER_OF_GUESSES
    @score = 0
    @@players << self
  end

  def self.players
    @@players
  end

  def self.no_guesses_remaining?
    players.all? { |player| player.remaining_guesses.zero? }
  end

  def start_turn
    puts "Hi #{name}!"
    puts "You have #{remaining_guesses} guesses remaining."
  end

  def acquire_guess
    guess = nil

    loop do
      print "Enter a number between 1 and 100: "
      guess = gets.chomp
      break if valid_number?(guess)
      print "Invalid guess. "
    end
    self.guess = guess.to_i
    self.remaining_guesses -= 1
  end

  def reset
    self.remaining_guesses = NUMBER_OF_GUESSES
    self.guess = nil
  end

  private

  def valid_number?(number)
    number == number.to_i.to_s && VALID_GUESS_RANGE.cover?(number.to_i)
  end

end

class GuessingGame
  WINNING_SCORE = 5

  RESULT_OF_GUESS = {
                     high: "Your guess is too high.",
                     low: "Your guess is too low",
                     same: "That's the number!"
  }

  def initialize
    @players = Player.players
    Player.new(acquire_name("Player 1"))
    Player.new(acquire_name("Player 2"))
    @current_outcome = nil
    @number = nil
  end

  def play
    reset
    loop do
      puts "New round!"
      player_turns
      reset
      display_scores
      finish_game if game_over?
    end
  end

  private

  def acquire_name(player)
    puts "Hello #{player}!"
    loop do
      puts "What is your name?"
      name = gets.chomp.strip
      return name unless invalid_name?(name)
      puts "Invalid name!"
    end
  end

  def invalid_name?(name)
    name.empty? || @players.any? { |player| player.name == name }
  end

  def finish_game
    @players.each do |player|
      if player.score == WINNING_SCORE
        puts "#{player.name} is the grand winner!"
        exit
      end
    end
  end

  def game_over?
    @players.any? { |player| player.score == WINNING_SCORE }
  end

  def display_scores
    @players.each do |player|
      score = player.score
      puts "#{player.name} has #{score} point#{score == 1 ? '' : "s"}!"
    end
  end

  def player_turns
    loop do
      @players.each do |player|
        player.start_turn
        player.acquire_guess
        determine_outcome(player)
        display_result
        end_turn(player)
        return if round_over?
      end
    end
  end

  def display_result
    puts RESULT_OF_GUESS[@current_outcome]
  end

  def end_turn(player)
    if @current_outcome == :same
      player.score += 1
      puts "#{player.name} wins!"
    elsif Player.no_guesses_remaining?
      puts "No guesses remaining. Round over..."
    end
  end

  def round_over?
    @current_outcome == :same || Player.no_guesses_remaining? ? true : false
  end

  def determine_outcome(player)
    @current_outcome = if player.guess > @number
                         :high
                       elsif player.guess < @number
                         :low
                       else
                         :same
                       end
  end

  def reset
    @players.each { |player| player.reset }
    @players.reverse!
    @number = rand(Player::VALID_GUESS_RANGE)
  end
end

game = GuessingGame.new

game.play