SMODS.Joker {
  key = "susie",
  atlas = "jokers",
  pos = { x = 1, y = 7 },
  config = { extra = {
    chips = 0
  } },
  rarity = 1,
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "she_her",

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.chips
    } }
  end,

  calculate = function(self, card, context)
    -- handle upgrade
    if context.individual and context.cardarea == G.play and not context.end_of_round and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.chips + context.other_card:get_chip_bonus()
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS,
        message_card = card
      }
    end

    -- give chips
    if context.joker_main then
      return { chips = card.ability.extra.chips }
    end
  end
}
