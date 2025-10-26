SMODS.Shader {
  key = "astral",
  path = "astral.fs"
}

SMODS.Edition {
  key = "astral",
  shader = "astral",

  config = { extra = {
    xchips = 0.25
  }},

  in_shop = true,
  weight = 3,
  extra_cost = 6,
  sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  loc_vars = function(self, info_queue, card)
    local xchips = card and card.edition and card.edition.extra.xchips or 0.25
    local joker_count = G.jokers and G.jokers.cards and #G.jokers.cards or 1
    return { vars = {
      xchips,
      1 + joker_count * xchips
    } }
  end,

  get_weight = function(self)
    return G.GAME.edition_rate * self.weight
  end,

  calculate = function(self, card, context)
    if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
      return { xchips = 1 + #G.jokers.cards * card.edition.extra.xchips }
    end
  end
}
