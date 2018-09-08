class TennisGame2
  NORMAL_SCOREBOARD = %w[Love Fifteen Thirty Forty].freeze
  DRAW_SCOREBOARD = %w[Love-All Fifteen-All Thirty-All].freeze
  LOVE_SCOREBOARD1 = %w[placeholder Fifteen-Love Thirty-Love Forty-Love].freeze
  LOVE_SCOREBOARD2 = %w[placeholder Love-Fifteen Love-Thirty Love-Forty].freeze

  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(player_name)
    @p1_points += 1 if player_name == @player1_name
    @p2_points += 1 if player_name == @player2_name
  end

  def score
    result = DRAW_SCOREBOARD[@p1_points] if p1_p2_drawing?
    result = LOVE_SCOREBOARD1[@p1_points] if p1_love?
    result = LOVE_SCOREBOARD2[@p2_points] if p2_love?

    if p1_beating_p2? || p2_beating_p1?
      result = NORMAL_SCOREBOARD[@p1_points] +
               '-' +
               NORMAL_SCOREBOARD[@p2_points]
    end

    result = 'Advantage ' + @player1_name if advantage_p1?
    result = 'Advantage ' + @player2_name if advantage_p2?

    result = 'Win for ' + @player1_name if p1_beaten_p2?
    result = 'Win for ' + @player2_name if p2_beaten_p1?
    result = 'Deuce' if deuce?

    result
  end

  private

  def p1_love?
    @p1_points > 0 && @p2_points.zero?
  end

  def p2_love?
    @p2_points > 0 && @p1_points.zero?
  end

  def p1_p2_drawing?
    @p1_points == @p2_points && @p1_points < 3
  end

  def deuce?
    @p1_points == @p2_points && @p1_points > 2
  end

  def advantage_p1?
    @p1_points > @p2_points && @p2_points >= 3
  end

  def advantage_p2?
    @p2_points > @p1_points && @p1_points >= 3
  end

  def p1_beating_p2?
    @p1_points > @p2_points && @p1_points < 4
  end

  def p2_beating_p1?
    @p2_points > @p1_points && @p2_points < 4
  end

  def p1_beaten_p2?
    @p1_points >= 4 && @p2_points >= 0 && @p1_points - @p2_points >= 2
  end

  def p2_beaten_p1?
    @p2_points >= 4 && @p1_points >= 0 && @p2_points - @p1_points >= 2
  end
end
