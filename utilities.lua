STAR_UTIL = {}

-- Joker table
STAR_UTIL.enabled_jokers = {
  'astro',
  'scrap',
  'crystal',
  --'paradox',
  --'creature',
  'rocket_pop',
  --'microtransagolor',
  --'combo_pizza',
  --'sonic',
  --'rewrite',
  --'rewrite_ascended',
  'meta_knight',
  --'astro_burger',
  --'scrap_machete',
  --'checked_mate',
  --'writh_wrath',
  --'cosplay',
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
