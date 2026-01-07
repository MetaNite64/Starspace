SMODS.Shader {
  key = "otherworldly",
  path = "otherworldly.fs"
}

SMODS.Edition {
  key = "otherworldly",
  shader = "otherworldly",

  in_shop = true,
  weight = 1.732,
  extra_cost = 5,
  sound = { sound = "polychrome1", per = 1.2, vol = 0.7 },

  get_weight = function(self)
    return G.GAME.edition_rate * self.weight
  end,

  calculate = function(self, card, context)
    if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
      return { xmult = SMODS.get_scoring_parameter("chips") ^ 0.25 }
    end
  end
}
