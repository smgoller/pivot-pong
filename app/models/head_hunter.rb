class HeadHunter < Achievement
  class << self
    def title
      "Head Hunter"
    end

    def description
      "Accumulate 10 or more totems for your totem pole"
    end

    def badge
      "icon-user"
    end

    def eligible?(player)
      player.totems.count > 9
    end
  end
end