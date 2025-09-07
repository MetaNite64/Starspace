STAR_UTIL.Patch {
  key = "generous",
  badge_colour = HEX("B18F43"),
  atlas = "card_mods",
  pos = { x = 1, y = 2 },

  should_apply = function(self, card, center, area, bypass_roll)
    return not card.rental
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.cardarea == G.jokers then
      return {
        dollars = 2
      }
    end
  end
}
