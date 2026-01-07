SMODS.Joker {
  key = "marx",
  atlas = "jokers",
  pos = { x = 6, y = 5 },
  config = { extra = {
    xvalues = 2
  } },
  rarity = "star_cosmic",
  cost = 15,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xvalues
    } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      local ret = {}
      if context.other_card:is_suit("Clubs") then
        ret.xchips = 2
      end
      if context.other_card:is_suit("Hearts") then
        ret.xmult = 2
      end
      if ret.xchips or ret.xmult then return ret end
    end
  end
}
