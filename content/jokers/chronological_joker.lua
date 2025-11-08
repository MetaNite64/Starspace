SMODS.Joker {
  key = "chronological_joker",
  atlas = "jokers",
  pos = { x = 2, y = 1 },
  config = { extra = {
    mult = 0,
    mult_scale = 2
  } },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.mult_scale,
      card.ability.extra.mult >= 0 and ("+" .. card.ability.extra.mult) or card.ability.extra.mult
    } }
  end,

  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      for i, v in pairs(context.removed) do
        if v:is_suit("Spades") then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "mult",
            scalar_value = "mult_scale",
            message_key = "a_mult",
            message_colour = G.C.MULT
          })
        end
        if v:is_suit("Hearts") then
          SMODS.scale_card(card, {
            ref_table = card.ability.extra,
            ref_value = "mult",
            scalar_value = "mult_scale",
            message_key = "a_mult_minus",
            message_colour = G.C.MULT,
            operation = "-"
          })
        end
      end
    end
    if context.joker_main then
      return { mult = card.ability.extra.mult }
    end
  end
}
