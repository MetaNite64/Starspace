SMODS.Joker {
  key = "creature",
  atlas = "jokers",
  pos = { x = 9, y = 2 },
  config = { extra = {
    chips = 0,
    mult = 0,
    chip_gain = 5,
    mult_gain = 1
  } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pools = {
    friends_of_astro = true
  },
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.chip_gain,
      card.ability.extra.mult_gain,
      card.ability.extra.chips,
      card.ability.extra.mult
    } }
  end,

  calculate = function(self, card, context)
    -- gain value at end of round
    if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
      local jokers = #G.jokers.cards
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "chips",
        scalar_value = "chip_gain",
        message_key = "a_chips",
        message_colour = G.C.CHIPS,
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + jokers*change
        end,
        no_message = true
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        message_key = "a_mult",
        message_colour = G.C.MULT,
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + jokers*change
        end,
        no_message = true
      })

      -- custom message because SMODS.scale_card stinky
      SMODS.calculate_effect( {
        message = localize( { type = "variable", key = "a_chips", vars = { jokers * card.ability.extra.chip_gain } } ),
        colour = G.C.CHIPS
      }, card)
      SMODS.calculate_effect( {
        message = localize( { type = "variable", key = "a_mult", vars = { jokers * card.ability.extra.mult_gain } } ),
        colour = G.C.MULT
      }, card)
    end

    -- give value
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
        mult = card.ability.extra.mult
      }
    end
  end
}
