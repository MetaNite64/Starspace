STAR_UTIL = {}

-- Joker table
STAR_UTIL.enabled_jokers = {
  'astro',
  'scrap',
  'crystal',
  'sage',
  --'paradoxical_joker',
  --'creature',
  'rocket_pop',
  --'microtransagolor',
  --'combo_pizza',
  'meta_knight',
  --'galacta_knight',
  --'bacon_burger',
  'shard',
  --'scrap_machete',
  --'writh_wrath',
  --'astronomical_joker',
  --'chronological_joker',
  --'angelic_joker',
  'glorp',
  --'quadratical',
  --':3c',
  --'chocolate_pi',
}

-- Consumables table
STAR_UTIL.enabled_consumables = {
  --'illusioned',
  --'epitome',
  --'retribution',
  'eclipse',
  --'conductivity',
  'gemstone',
  'starspace',
}

-- Seals table
STAR_UTIL.enabled_seals = {
  'rose_gold',
  --'bronze',
  'emerald',
}

-- Quips table
STAR_UTIL.enabled_quips = {
  'astro_quips',
  'scrap_quips',
  'sage_quips',
}

-- custom colors
STAR_UTIL.colors = {
  rose_gold = HEX("DA9592"),
  emerald = HEX("67CF83")
}

loc_colour()
for i, v in pairs(STAR_UTIL.colors) do
  G.ARGS.LOC_COLOURS["star_" .. i] = v
end

function STAR_UTIL.load_items(names, path)
  for i = 1, #names do
    assert(SMODS.load_file(path .. '/' .. names[i] .. '.lua'))()
  end
end

SMODS.current_mod.optional_features = function()
  return {
    retrigger_joker = true
  }
end
