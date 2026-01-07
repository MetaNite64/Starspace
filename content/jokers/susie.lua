SMODS.Joker {
  key = "susie",
  atlas = "jokers",
  pos = { x = 1, y = 7 },
  config = { extra = {
    chips = 0,
    chip_gain = 4
  } },
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "she_her",

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.chip_gain,
      card.ability.extra.chips
    } }
  end,

  calculate = function(self, card, context)
    -- handle upgrade
    if context.after and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chip_gain",
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + change * #context.scoring_hand
        end,
        scaling_message = {
          message = localize { type = "variable", key = "a_chips", vars = { card.ability.extra.chip_gain * #context.scoring_hand } },
          colour = G.C.CHIPS
        }
      })
      return nil, true
    end

    -- give chips
    if context.joker_main then
      return { chips = card.ability.extra.chips }
    end
  end
}
