SMODS.Sticker {
  key = "gigantic",
  badge_colour = HEX("CE88D5"),
  atlas = "card_mods",
  pos = { x = 1, y = 1 },

  should_apply = function(self, card, center, area, bypass_roll)
    if bypass_roll then return G.GAME.modifiers.enable_rentals_in_shop end
    return G.GAME.modifiers.enable_rentals_in_shop
            and pseudorandom('gigantic' .. G.GAME.round_resets.ante) > 0.9
  end,

  apply = function(self, card, val)
    if not (card.config.center_key == 'c_base' and not card.children.front) then
      if val then
        card.ability.extra_slots_used = card.ability.extra_slots_used + 1
      else
        card.ability.extra_slots_used = card.ability.extra_slots_used - 1
      end
    end

    card.ability[self.key] = val
  end
}
