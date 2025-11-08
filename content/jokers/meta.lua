SMODS.Joker {
  key = "meta",
  atlas = "jokers",
  pos = { x = 11, y = 4 },
  soul_pos = { x = 12, y = 4 },
  config = { extra = {
    mult = 0,
    mult_gain = 1
  } },
  rarity = 4,
  cost = 20,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "she_they",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.mult,
      card.ability.extra.mult_gain
    } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint and not context.end_of_round then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        message_key = "a_mult",
        message_colour = G.C.RED
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult_gain",
        no_message = true,
        operation = function(ref_table, ref_value, initial, change)
          ref_table[ref_value] = initial + 1
        end
      })
    end
    if context.joker_main then
      return { mult = card.ability.extra.mult }
    end
  end
}
