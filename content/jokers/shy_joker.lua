SMODS.Joker {
  key = "shy_joker",
  atlas = "jokers",
  pos = { x = 1, y = 5 },
  config = { extra = {
    chips = 50,
    type = "star_flash"
  } },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.chips,
      localize (card.ability.extra.type, "poker_hands")
    } }
  end,

  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return { chips = card.ability.extra.chips }
    end
  end
}
