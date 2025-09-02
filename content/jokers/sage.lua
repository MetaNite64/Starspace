SMODS.Joker {
  key = "sage",
  atlas = "jokers",
  pos = { x = 3, y = 0 },
  soul_pos = { x = 4, y = 0 },
  config = { extra = {
    xmult = 1,
    xmult_gain = 6.66
  } },
  rarity = "star_galactic",
  cost = 50,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xmult_gain,
      card.ability.extra.xmult
    } }
  end,

  calculate = function(self, card, context)
    if context.money_altered and not context.blueprint then
      if context.amount > 0 and context.from_scoring then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "xmult",
          scalar_value = "xmult_gain"
        } )
      end
    end

    if context.joker_main then
      return { xmult = card.ability.extra.xmult }
    end
  end
}
