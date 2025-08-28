assert(SMODS.load_file('utilities.lua'))()

-- placeholder atlas
SMODS.Atlas {
  key = "placeholder",
  path = "placeholder.png",
  px = 71, py = 95
}

-- joker atlas
SMODS.Atlas {
  key = "jokers",
  path = "jokers.png",
  px = 71, py = 95
}

STAR_UTIL.load_items(STAR_UTIL.enabled_jokers, 'content/jokers')
STAR_UTIL.load_items(STAR_UTIL.enabled_quips, 'content/quips')
