SMODS.Joker {
  key = "meta",
  atlas = "jokers",
  pos = { x = 11, y = 4 },
  soul_pos = { x = 12, y = 4 },
  config = { extra = {
    mult = 0,
    mult_gain = 1,
    mult_gain_gain = 1
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
      card.ability.extra.mult_gain,
      card.ability.extra.mult_gain_gain
    } }
  end,

  calculate = function(self, card, context)
    -- upgrade when hand is played
    if context.before and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        message_key = "a_mult",
        message_colour = G.C.MULT
      })
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult_gain",
        scalar_value = "mult_gain_gain",
        no_message = true
      })
      return nil, true
    end

    -- give mult
    if context.joker_main then
      return { mult = card.ability.extra.mult }
    end
  end
}
