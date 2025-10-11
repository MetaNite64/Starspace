SMODS.Joker {
  key = "guileful_joker",
  atlas = "jokers",
  pos = { x = 0, y = 6 },
  config = { extra = {
    handsize = 2,
    type = "Pair",
    triggered = false
  } },
  rarity = 2,
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.handsize,
      localize(card.ability.extra.type, "poker_hands")
    } }
  end,

  calculate = function(self, card, context)
    -- give handsize when given hand is played
    if context.joker_main and not context.blueprint and not card.ability.extra.triggered then
      if next(context.poker_hands[card.ability.extra.type]) then
        G.hand:change_size(card.ability.extra.handsize)
        card.ability.extra.triggered = true
        return {
          message = localize { type = "variable", key = "a_handsize", vars = { card.ability.extra.handsize } }
        }
      end
    end

    -- take handsize away
    if context.end_of_round and context.cardarea == G.jokers and card.ability.extra.triggered then
      G.hand:change_size(-card.ability.extra.handsize)
      card.ability.extra.triggered = false
    end
  end
}
