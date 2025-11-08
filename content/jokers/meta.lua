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
    -- upgrade scaling val based on unscored cards
    if context.before and not context.blueprint then
      local unscored = #context.full_hand - #context.scoring_hand
      if unscored > 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult_gain",
          no_message = true,
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + unscored
          end
        })
        return {
          message = localize("k_upgrade_ex"),
          colour = G.C.MULT
        }
      end
    end
    -- upgrade mult whenever a card is scored
    if context.individual and context.cardarea == G.play and not context.blueprint then
      SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "mult",
        scalar_value = "mult_gain",
        no_message = true
      })
      return {
        message = localize { type = "variable", key = "a_mult", vars = { card.ability.extra.mult_gain } },
        colour = G.C.MULT,
        message_card = card
      }
    end
    -- give mult
    if context.joker_main then
      return { mult = card.ability.extra.mult }
    end
  end
}
