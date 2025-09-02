SMODS.Joker {
  key = "shard",
  atlas = "jokers",
  pos = { x = 6, y = 0 },
  config = { extra = {
    retriggers = 3
  } },
  rarity = "star_cosmic",
  cost = 18,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.retriggers
    } }
  end,

  calculate = function(self, card, context)
    if context.retrigger_joker_check and context.other_card ~= card and not context.blueprint then
      if context.other_card == G.jokers.cards[1] then
        return {
          repetitions = card.ability.extra.retriggers
        }
      end
    end
  end
}
