SMODS.Joker {
  key = "galacta_knight",
  atlas = "jokers",
  pos = { x = 2, y = 2 },
  soul_pos = { x = 3, y = 2 },
  config = { extra = {
    repetitions = 3
  } },
  rarity = "star_galactic",
  cost = 40,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    return { vars = {
      card.ability.extra.repetitions
    } }
  end,

  calculate = function(self, card, context)
    if context.check_enhancement and not context.blueprint then
      if context.other_card.ability.set == "Enhanced" then
        return {
          m_gold = true,
          m_steel = true
        }
      end
    end

    if context.repetition and context.other_card.ability.set == "Enhanced" then
      return {
        repetitions = card.ability.extra.repetitions
      }
    end
  end
}
