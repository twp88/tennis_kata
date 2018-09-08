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
    if @p1_points == @p2_points && @p1_points < 3
      result = draw_score
    elsif @p1_points == @p2_points && @p1_points > 2
      result = 'Deuce'
    end

    if @p1_points > 0 && @p2_points.zero?
      result = p1_love_score(@p1_points)
    elsif @p2_points > 0 && @p1_points.zero?
      result = p2_love_score(@p2_points)
    end

    if @p1_points > @p2_points && @p1_points < 4
      p2_res = NORMAL_SCOREBOARD[@p2_points]
      p1_res = NORMAL_SCOREBOARD[@p1_points]
      result = p1_res + '-' + p2_res
    end
    if @p2_points > @p1_points && @p2_points < 4
      p2_res = NORMAL_SCOREBOARD[@p2_points]
      p1_res = NORMAL_SCOREBOARD[@p1_points]
      result = p1_res + '-' + p2_res
    end
    if @p1_points > @p2_points && @p2_points >= 3
      result = 'Advantage ' + @player1_name
    elsif @p2_points > @p1_points && @p1_points >= 3
      result = 'Advantage ' + @player2_name
    end
    if @p1_points >= 4 && @p2_points >= 0 && @p1_points - @p2_points >= 2
      result = 'Win for ' + @player1_name
    elsif @p2_points >= 4 && @p1_points >= 0 && @p2_points - @p1_points >= 2
      result = 'Win for ' + @player2_name
    end
    result
  end

  def draw_score
    DRAW_SCOREBOARD[@p1_points]
  end

  def p1_love_score(p1_player)
    LOVE_SCOREBOARD1[p1_player]
  end

  def p2_love_score(p1_player)
    LOVE_SCOREBOARD2[p1_player]
  end
end
