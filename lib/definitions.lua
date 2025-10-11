-- Patch object
STAR_UTIL.Patch = SMODS.Sticker:extend {
  prefix_config = { key = true },
  should_apply = false,
  config = {},
  rate = 0,
  sets = {
    Default = true
  },

  draw = function(self, card)
    G.shared_stickers[self.key].role.draw_major = card
    G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
  end
}

-- Friends of Astro pool
SMODS.ObjectType {
  key = "friends_of_astro",
  default = "j_star_astro",
  cards = {}
}
