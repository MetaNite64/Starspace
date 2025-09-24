SMODS.Joker {
  key = "paradoxical_joker",
  atlas = "jokers",
  pos = { x = 6, y = 7 },
  config = { extra = {
    mult = 0,
    mult_gain = 5
  } },
  rarity = 1,
  cost = 3,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.mult_gain,
      card.ability.extra.mult
    } }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      for i, v in ipairs(G.GAME.starspace.secret_hands) do
        if context.scoring_name == v then
          card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
          return {
            message = localize { type = "variable", key = "a_mult", vars = { card.ability.extra.mult_gain } },
            colour = G.C.MULT
          }
        end
      end
    end

    if context.joker_main then
      return { mult = card.ability.extra.mult }
    end
  end
}
