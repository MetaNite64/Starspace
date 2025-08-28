SMODS.Joker {
  key = "crystal",
  atlas = "jokers",
  pos = { x = 7, y = 0 },
  config = { extra = {
    retriggers = 3
  } },
  rarity = 3,
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
      local other_joker = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          other_joker = G.jokers.cards[i + 1]
          break
        end
      end
      if other_joker == context.other_card then
        return {
          repetitions = card.ability.extra.retriggers
        }
      end
    end
  end
}
