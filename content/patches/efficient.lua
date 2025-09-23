STAR_UTIL.Patch {
  key = "efficient",
  badge_colour = HEX("CE88D5"),
  atlas = "card_mods",
  pos = { x = 4, y = 2 },
  patch_sticker = "star_gigantic",

  should_apply = false,

  apply = function(self, card, val)
    if not (card.config.center_key == 'c_base' and not card.children.front) then
      if val then
        card.ability.extra_slots_used = (card.ability.extra_slots_used + 1) / 2 - 1
      else
        card.ability.extra_slots_used = (card.ability.extra_slots_used + 1) * 2 - 1
      end
    end

    card.ability[self.key] = val
  end
}
