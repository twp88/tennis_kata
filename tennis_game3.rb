class TennisGame3
  SCRE_BRD = %w[Love Fifteen Thirty Forty].freeze

  def initialize(player1_name, player2_name)
    @p1_n = player1_name
    @p2_n = player2_name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    n == @p1_n ? @p1 += 1 : @p2 += 1
  end

  def score
    game_still_going? ? score_normally : deuce_advantage_or_win?
  end

  private

  def game_still_going?
    @p1 < 4 && @p2 < 4 && @p1 + @p2 < 6
  end

  def score_normally
    @p1 == @p2 ? SCRE_BRD[@p1] + '-All' : SCRE_BRD[@p1] + '-' + SCRE_BRD[@p2]
  end

  def deuce_advantage_or_win?
    if @p1 == @p2
      'Deuce'
    else
      s = @p1 > @p2 ? @p1_n : @p2_n
      (@p1 - @p2) * (@p1 - @p2) == 1 ? 'Advantage ' + s : 'Win for ' + s
    end
  end
end
