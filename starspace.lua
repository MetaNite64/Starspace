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

-- consumables atlas
SMODS.Atlas {
  key = "consumables",
  path = "consumables.png",
  px = 71, py = 95
}

-- card modifiers atlas
SMODS.Atlas {
  key = "card_mods",
  path = "card_mods.png",
  px = 71, py = 95
}

-- Cosmic rarity
SMODS.Rarity {
  key = "cosmic",
  badge_colour = HEX("ED3BAF"),
  default_weight = 0.025
}

-- Galactic rarity
SMODS.Rarity {
  key = "galactic",
  badge_colour = HEX("00E4FF"),
  default_weight = 0
}

STAR_UTIL.load_items(STAR_UTIL.enabled_jokers, 'content/jokers')
STAR_UTIL.load_items(STAR_UTIL.enabled_consumables, 'content/consumables')
STAR_UTIL.load_items(STAR_UTIL.enabled_seals, 'content/seals')
STAR_UTIL.load_items(STAR_UTIL.enabled_patches, 'content/patches')
STAR_UTIL.load_items(STAR_UTIL.enabled_quips, 'content/quips')
assert(SMODS.load_file('lib/collection.lua'))()
