SMODS.Joker {
  key = "galacta_knight",
  atlas = "jokers",
  pos = { x = 2, y = 2 },
  rarity = "star_cosmic",
  cost = 12,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
  end,

  calculate = function(self, card, context)
    if context.fix_probability and not context.blueprint then
      if context.identifier == "glass" then
        return {
          numerator = 0
        }
      end
    end
    if context.mod_probability and not context.blueprint then
      if context.identifier == "lucky_mult" or context.identifier == "lucky_money" then
        return {
          numerator = context.numerator * 4
        }
      end
    end
  end
}
