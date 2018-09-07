class TennisGame2
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
    result = ''
    if @p1_points == @p2_points && @p1_points < 3
      if @p1_points.zero?
        result = 'Love'
      end
      if @p1_points == 1
        result = 'Fifteen'
      end
      if @p1_points == 2
        result = 'Thirty'
      end
      result += '-All'
    end
    if @p1_points == @p2_points && @p1_points > 2
      result = 'Deuce'
    end

    p1_res = ''
    p2_res = ''
    if @p1_points > 0 && @p2_points.zero?
      if @p1_points == 1
        p1_res = 'Fifteen'
      end
      if @p1_points == 2
        p1_res = 'Thirty'
      end
      if @p1_points == 3
        p1_res = 'Forty'
      end
      p2_res = 'Love'
      result = p1_res + '-' + p2_res
    end
    if @p2_points > 0 && @p1_points.zero?
      if @p2_points == 1
        p2_res = 'Fifteen'
      end
      if @p2_points == 2
        p2_res = 'Thirty'
      end
      if @p2_points == 3
        p2_res = 'Forty'
      end

      p1_res = 'Love'
      result = p1_res + '-' + p2_res
    end

    if @p1_points > @p2_points && @p1_points < 4
      if @p1_points == 2
        p1_res = 'Thirty'
      end
      if @p1_points == 3
        p1_res = 'Forty'
      end
      if @p2_points == 1
        p2_res = 'Fifteen'
      end
      if @p2_points == 2
        p2_res = 'Thirty'
      end
      result = p1_res + '-' + p2_res
    end
    if @p2_points > @p1_points && @p2_points < 4
      if @p2_points == 2
        p2_res = 'Thirty'
      end
      if @p2_points == 3
        p2_res = 'Forty'
      end
      if @p1_points == 1
        p1_res = 'Fifteen'
      end
      if @p1_points == 2
        p1_res = 'Thirty'
      end
      result = p1_res + '-' + p2_res
    end
    if @p1_points > @p2_points && @p2_points >= 3
      result = 'Advantage ' + @player1_name
    end
    if @p2_points > @p1_points && @p1_points >= 3
      result = 'Advantage ' + @player2_name
    end
    if @p1_points >= 4 && @p2_points >= 0 && @p1_points - @p2_points >= 2
      result = 'Win for ' + @player1_name
    end
    if @p2_points >= 4 && @p1_points >= 0 && @p2_points - @p1_points >= 2
      result = 'Win for ' + @player2_name
    end
    result
  end

  def set_p1_score(number)
    (0..number).each do |i|
      p1_score
    end
  end

  def set_p2_score(number)
    (0..number).each do |i|
      p2_score
    end
  end
end
