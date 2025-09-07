STAR_UTIL.Patches = {}
STAR_UTIL.Patch = SMODS.Sticker:extend {
  prefix_config = { key = true },
  should_apply = false,
  config = {},
  rate = 0,
  sets = {
    Default = true
  },

  apply = function(self, card, val)
    card.ability[self.key] = val and copy_table(self.config) or nil
  end,

  draw = function(self, card)
    G.shared_stickers[self.key].role.draw_major = card
    G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
  end
}
