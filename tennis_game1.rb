class TennisGame1
  DRAW_SCOREBOARD = {
    0 => 'Love-All',
    1 => 'Fifteen-All',
    2 => 'Thirty-All'
  }.freeze

  STND_SCOREBOARD = {
    0 => 'Love',
    1 => 'Fifteen',
    2 => 'Thirty',
    3 => 'Forty'
  }.freeze

  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1points = 0
    @p2points = 0
  end

  def won_point(player_name)
    player_name == @player1_name ? @p1points += 1 : @p2points += 1
  end

  def score
    if @p1points == @p2points
      points_draw
    elsif @p1points >= 4 || @p2points >= 4
      win_advantage
    else
      normal_score
    end
  end

  def points_draw
    DRAW_SCOREBOARD.fetch(@p1points, 'Deuce')
  end

  def normal_score
    [STND_SCOREBOARD[@p1points].to_s,
     '-',
     STND_SCOREBOARD[@p2points].to_s].join('')
  end

  def minus_result
    @p1points - @p2points
  end

  def win_advantage
    if minus_result == 1
      'Advantage ' + @player1_name
    elsif minus_result == -1
      'Advantage ' + @player2_name
    elsif minus_result >= 2
      'Win for ' + @player1_name
    else
      'Win for ' + @player2_name
    end
  end
end
