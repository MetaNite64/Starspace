SMODS.Sticker {
  key = "isolated",
  badge_colour = HEX("ED9251"),
  atlas = "card_mods",
  pos = { x = 0, y = 1 },

  should_apply = function(self, card, center, area, bypass_roll)
    return
        center.set == "Joker"
        and ((area == G.shop_jokers) or (area == G.pack_cards))
        and G.GAME.modifiers.enable_star_isolated
        and pseudorandom('star_isolated' .. G.GAME.round_resets.ante) > 0.6
  end
}
