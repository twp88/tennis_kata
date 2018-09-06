class TennisGame1

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
    @stnd_score_board = {
      0 => 'Love',
      1 => 'Fifteen',
      2 => 'Thirty',
      3 => 'Forty'
    }
  end

  def won_point(playerName)
    playerName == @player1Name ? @p1points += 1 : @p2points += 1
  end

  def score
    if @p1points == @p2points
      points_draw
    elsif @p1points >= 4 || @p2points >= 4
      minus_result
    else
      normal_score
    end
  end

  def normal_score
    result = ['', '-', '']
    (1...3).each do |i|
      if i == 1
        result[0] = @stnd_score_board[@p1points]
      else
        result[2] = @stnd_score_board[@p2points]
      end
    end
    result.join('')
  end

  def points_draw
    {
      0 => 'Love-All',
      1 => 'Fifteen-All',
      2 => 'Thirty-All',
    }.fetch(@p1points, 'Deuce')
  end

  def minus_result
    minusResult = @p1points - @p2points
    if minusResult == 1
      'Advantage ' + @player1Name
    elsif minusResult == -1
      'Advantage ' + @player2Name
    elsif minusResult >= 2
      'Win for ' + @player1Name
    else
      'Win for ' + @player2Name
    end
  end
end
