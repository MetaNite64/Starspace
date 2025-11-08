SMODS.Joker {
  key = "the_spacial",
  atlas = "jokers",
  pos = { x = 2, y = 5 },
  config = { extra = {
    xscores = 1.5,
    type = "star_flash"
  } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xscores,
      localize (card.ability.extra.type, "poker_hands")
    } }
  end,

  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xchips = card.ability.extra.xscores,
        xmult = card.ability.extra.xscores
      }
    end
  end
}
