class Lemons < Achievement
  class << self
    def title
      "When Life Gives You Lemons..."
    end

    def description
      "Lose 5 matches in a row"
    end

    def badge
      "icon-lemon"
    end

    def eligible?(player)
      last_matches = Match.where("winner_id = ? OR loser_id = ?", player.id, player.id).order("occured_at DESC").limit(5)
      return false if last_matches.count < 5
      last_matches.each{|match| return false if match.loser != player }
      true
    end
  end
end