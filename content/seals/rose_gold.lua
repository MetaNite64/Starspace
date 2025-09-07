SMODS.Seal {
  key = "rose_gold",
  atlas = "card_mods",
  pos = { x = 0, y = 0 },
  badge_colour = HEX("DA9592"),

  config = { extra = {
    seal_count = 0,
    money = 2
  } },

  loc_vars = function(self, info_queue, card)
    return { vars = { self.config.extra.money } }
  end,

  calculate = function(self, card, context)
    if context.before and context.cardarea == G.play then
      card.ability.seal.extra.seal_count = 0
      for i, v in pairs(context.scoring_hand) do
        print(v.seal)
        if v.seal then card.ability.seal.extra.seal_count = card.ability.seal.extra.seal_count + 1 end
      end
    end
  end,

  get_p_dollars = function(self, card)
    return card.ability.seal.extra.seal_count * card.ability.seal.extra.money
  end,

  -- thanks VanillaRemade
  draw = function(self, card, layer)
    if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
      G.shared_seals[card.seal].role.draw_major = card
      G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
      G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end
}
