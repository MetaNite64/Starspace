SMODS.Joker {
  key = "astronomical_joker",
  atlas = "jokers",
  pos = { x = 1, y = 1 },
  config = { extra = {
    chips = 0,
    chip_scale = 15
  } },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.chip_scale,
      card.ability.extra.chips >= 0 and ("+" .. card.ability.extra.chips) or card.ability.extra.chips
    } }
  end,

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      for i, v in pairs(context.removed) do
        if v:is_suit("Hearts") then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_value = "chip_scale",
            message_key = "a_chips",
            message_colour = G.C.CHIPS
          })
        end
        if v:is_suit("Spades") then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "chips",
            scalar_value = "chip_scale",
            message_key = "a_chips_minus",
            message_colour = G.C.CHIPS,
            operation = "-"
          })
        end
      end
    end
    if context.joker_main then
      return { chips = card.ability.extra.chips }
    end
  end
}
