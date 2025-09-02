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
  --'fool_spectral',
  'starspace',
  --'epitome',
  --'starship',
}

-- Quips table
STAR_UTIL.enabled_quips = {
  'astro_quips',
  'scrap_quips',
}

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
