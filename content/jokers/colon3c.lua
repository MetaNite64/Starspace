SMODS.Joker {
  key = "colon3c",
  atlas = "jokers",
  pos = { x = 3, y = 4 },
  config = { extra = {
    chips = 33,
    mult = 3,
    odds_1 = 3,
    odds_2 = 33
  } },
  rarity = 2,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    local num1, den1 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds_1, ":3c_1")
    local num2, den2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds_2, ":3c_2")
    return { vars = {
      card.ability.extra.chips,
      card.ability.extra.mult,
      num1, den1,
      num2, den2
    } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local multiplier = 1
      if SMODS.pseudorandom_probability(card, ":3c_1", 1, card.ability.extra.odds_1, ":3c_1") then
        multiplier = multiplier * 3
      end
      if SMODS.pseudorandom_probability(card, ":3c_2", 1, card.ability.extra.odds_2, ":3c_2") then
        multiplier = multiplier * 33
      end
      return {
        chips = card.ability.extra.chips * multiplier,
        mult = card.ability.extra.mult * multiplier
      }
    end
  end
}
