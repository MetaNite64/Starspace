STAR_UTIL = {}

assert(SMODS.load_file('lib/definitions.lua'))()
assert(SMODS.load_file('lib/utilities.lua'))()
assert(SMODS.load_file('lib/hooks.lua'))()
assert(SMODS.load_file('lib/ui.lua'))()

-- Talisman compat
to_big = to_big or function(a)
    return a
end

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

-- stakes atlases
SMODS.Atlas {
  key = "stakes",
  path = "stakes.png",
  px = 29, py = 29
}

SMODS.Atlas {
  key = "stake_stickers",
  path = "stake_stickers.png",
  px = 71, py = 95
}

-- vouchers atlas
SMODS.Atlas {
  key = "vouchers",
  path = "vouchers.png",
  px = 71, py = 95
}

-- Cosmic rarity
SMODS.Rarity {
  key = "cosmic",
  badge_colour = HEX("ED3BAF"),
  default_weight = 0.025,

  pools = {
    ["Joker"] = true
  }
}

-- Galactic rarity
SMODS.Rarity {
  key = "galactic",
  badge_colour = HEX("00E4FF"),
  default_weight = 0
}

STAR_UTIL.load_items(STAR_UTIL.enabled_jokers, 'content/jokers')
STAR_UTIL.load_items(STAR_UTIL.enabled_consumables, 'content/consumables')
STAR_UTIL.load_items(STAR_UTIL.enabled_hands, 'content/pokerhands')
STAR_UTIL.load_items(STAR_UTIL.enabled_challenges, 'content/challenges')
STAR_UTIL.load_items(STAR_UTIL.enabled_editions, 'content/editions')
STAR_UTIL.load_items(STAR_UTIL.enabled_seals, 'content/seals')
STAR_UTIL.load_items(STAR_UTIL.enabled_stakes, 'content/stakes')
STAR_UTIL.load_items(STAR_UTIL.enabled_stickers, 'content/stickers')
STAR_UTIL.load_items(STAR_UTIL.enabled_patches, 'content/patches')
STAR_UTIL.load_items(STAR_UTIL.enabled_quips, 'content/quips')
STAR_UTIL.load_items(STAR_UTIL.enabled_vouchers, 'content/vouchers')
assert(SMODS.load_file('lib/collection.lua'))()
