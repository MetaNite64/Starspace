SMODS.Seal {
  key = "bronze",
  atlas = "card_mods",
  pos = { x = 1, y = 0 },
  badge_colour = STAR_UTIL.colors.bronze,

  calculate = function(self, card, context)
    if context.before and context.cardarea == G.play then
      local seal_count = 0
      for i, v in pairs(context.scoring_hand) do
        if v.seal then seal_count = seal_count + 1 end
      end

      if seal_count > 1 then
        return { level_up = seal_count - 1 }
      end
    end
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
