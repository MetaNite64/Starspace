SMODS.Sticker {
  key = "isolated",
  badge_colour = HEX("ED9251"),
  atlas = "card_mods",
  pos = { x = 0, y = 1 },

  should_apply = function(self, card, center, area, bypass_roll)
    if bypass_roll then return G.GAME.modifiers.enable_isolateds_in_shop end
    return G.GAME.modifiers.enable_isolateds_in_shop
            and card.config.center.set == 'Joker'
            and pseudorandom('isolated' .. G.GAME.round_resets.ante) > 0.6
  end
}
