class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError
  end

  def self.winner(player1, player2)
    patron = /[PSR]/
    player1_hand = player1[1]
    player2_hand = player2[1]
    if !(player1_hand =~ patron) || !(player2_hand =~ patron)
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    case player1_hand
      when player2_hand
        player1
      when 'R'
        if player2_hand == 'S'
          player1
        else
          player2
        end
      when 'S'
        if player2_hand == 'R'
          player2
        else
          player1
        end
      when 'P'
        if player2_hand == 'R'
          player1
        else
          player2
        end
    end
  end

  def self.tournament_winner(tournament)
    winners = []
    if tournament[0][0].instance_of? String
      return winner(tournament[0], tournament[1])
    end
    winners << tournament_winner(tournament[0])
    winners << tournament_winner(tournament[1])
    tournament_winner(winners)
  end

end
