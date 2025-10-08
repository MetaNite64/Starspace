STAR_UTIL = {}

-- Joker table
STAR_UTIL.enabled_jokers = {
  'astro',
  'scrap',
  'sage',
  'crystal',
  'shard',
  'paradoxical_joker',
  --'creature',
  'rocket_pop',
  'combo_pizza',
  'magolor',
  'meta_knight',
  'galacta_knight',
  --'kirby',
  --'susie',
  'bacon_burger',
  --'scrap_machete',
  --'sage_halo',
  --'crystal_goggles',
  --'writh_wrath',
  --'astronomical_joker',
  --'chronological_joker',
  --'angelic_joker',
  'glorp',
  --'quadratical',
  --':3c',
  --'chocolate_pi',
  --'wealth_distribution',
  --'aikoyori',
  --'gay_ass_legendary',
  --'marx',
  --'black_card',
  --'paper_dragon',
  --'crazy_eights',
  --'parity_swap',
  --'lock_with_ink_pen',
  --'solar_system',
  --'wee_ancient_joker',
  --'misaligned_joker',
  --'aven',
  --'sample_size',
  --'forager',
  'plus2',
  --'death_by_a_thousand_meows',
  --'lesbian_joker',
  --'jimbo',
  --'extra_bullet',
  --'slash_and_die',
  --'junkyard',
  --'shilling',
  --'antijoker',
  --'sappy',
  --'grapefruit_soda',
  --'andromeda',
  --'roaring_knight',
  --'nxkoo',
  --'seraph',
}

-- Consumables table
STAR_UTIL.enabled_consumables = {
  --'illusioned',
  --'epitome',
  --'retribution',
  'eclipse',
  'conductivity',
  'gemstone',
  'starspace',
}

-- Seals table
STAR_UTIL.enabled_seals = {
  'rose_gold',
  'bronze',
  'emerald',
}

-- Stickers table
STAR_UTIL.enabled_stickers = {
  'isolated',
  'gigantic',
}

-- Stakes table
STAR_UTIL.enabled_stakes = {
  'amber',
  'amethyst',
}

-- load patches
assert(SMODS.load_file('lib/patch.lua'))()
-- Patches table
STAR_UTIL.enabled_patches = {
  'generous',
  'brave',
  'efficient',
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
  bronze = HEX("ED8F49"),
  emerald = HEX("67CF83")
}
loc_colour()
for i, v in pairs(STAR_UTIL.colors) do
  G.ARGS.LOC_COLOURS["star_" .. i] = v
end

-- custom pronoun sets
if next(SMODS.find_mod("cardpronouns")) then
  CardPronouns.Pronoun {
    colour = HEX("80407E"),
    text_colour = G.C.WHITE,
    pronoun_table = { "She", "It" },
    in_pool = function()
      return true
    end,
    key = "she_it"
  }
  CardPronouns.Pronoun {
    colour = HEX("405780"),
    text_colour = G.C.WHITE,
    pronoun_table = { "He", "It" },
    in_pool = function()
      return true
    end,
    key = "he_it"
  }
end

-- load items function
function STAR_UTIL.load_items(names, path)
  for i = 1, #names do
    assert(SMODS.load_file(path .. '/' .. names[i] .. '.lua'))()
  end
end

-- check if a sticker is a patch
function STAR_UTIL.is_patch(name)
  local patches = {}
  for i, v in pairs(SMODS.Stickers) do
    if v.patch_sticker then patches[#patches + 1] = i end
  end
  for i, v in ipairs(patches) do
    if name == v then return true end
  end
  return false
end

-- optional features
SMODS.current_mod.optional_features = function()
  return {
    retrigger_joker = true,
  }
end

-- debuff stuff
SMODS.current_mod.set_debuff = function(card)
  -- never debuff brave cards
  if card.ability and card.ability.star_brave then
    return "prevent_debuff"
  end
end
