-- Joker table
STAR_UTIL.enabled_jokers = {
  'astro',
  'scrap',
  'sage',
  'crystal',
  'shard',

  'astronomical_joker',
  'chronological_joker',
  'seraphic_joker',
  'glorp',
  'shilling',

  'creature',
  'scrap_machete',
  'sage_halo',
  'crystal_goggles',
  'colon3c',

  --'selfie',
  --'flash_card',
  --'lets_take_a_look',
  --'meet_n_fuck_kingdom',
  --'limited_time_astro_curry',

  'rocket_pop',
  'combo_pizza',
  'bacon_burger',
  --'grapefruit_soda',
  --'jam_jar'

  'magolor',
  'meta_knight',
  'galacta_knight',
  'susie',
  'marx',
  
  'sans',
  --'genocides',
  'paradoxical_joker',
  --'forager',
  --'pikumiku',

  'writh_wrath',
  --'built_like_a_brick',
  --'parity_swap',
  --'ew_xchips',
  --'crazy_eights',

  --'honest_joker',
  'fluffy_joker',
  --'insane_joker',
  'lesbian_joker',
  'misaligned_joker',

  'edward_robinson', -- was not on here anywhere so i added it after misaligned like in the docs
  'ms_small_penny_rolls', -- same story

  --'loyal_joker',
  'shy_joker',
  --'rebellious_joker',
  --'jombo',
  --'junkyard',

  --'the_loner',
  'the_spacial',
  --'the_monarchy',
  --'antijoker',
  --'jimbo',

  'guileful_joker',
  'deceitful_joker',
  'thoughtful_joker',
  'sleightful_joker',
  'artful_joker',

  --'faithful_joker',
  'prideful_joker',
  --'slothful_joker',
  --'astrolabe',
  'rise_of_kingdoms',

  --'sappy',
  --'auzzy',
  --'paper_dragon',
  --'ghost',

  --'apollo_11',
  --'lock_with_ink_pen',
  --'plan_z',
  --'wee_ancient_joker',
  --'solar_system',
  
  --'black_card',
  --'extra_bullet',
  --'andromeda',
  --'its_a_seal',
  --'impostor',

  --'freegels',
  --'weed',
  --'gay_ass_legendary',
  --'slash_and_die',

  --'joker?',
  --'heat_death',
  --'stoned_joker',
  --'astro_arbiter',
  'aikoyori',

  --'aven',
  'meta',
  'plus2',
  --'kirby',
  --'meowww',

  --'purple_joker',
  --'true_black_card',
  --'big_rip',
  --'ever_higher',
  --'roaring_knight',
  
  --'overclocked_astro',
  --'overclocked_scrap',
  --'seraph',
  --'nxkoo',
}

-- Consumables table
STAR_UTIL.enabled_consumables = {
  'wolftopia',
  'illusioned',
  --'epitome',
  'retribution',
  'eclipse',
  'conductivity',
  'gemstone',
  'starspace',
}

-- Poker hands table
STAR_UTIL.enabled_hands = {
  'flash',
}

-- Challenges table
STAR_UTIL.enabled_challenges = {
  'point_deduction_5',
}

-- Editions table
STAR_UTIL.enabled_editions = {
  'astral',
  'otherworldly',
}

-- Seals table
STAR_UTIL.enabled_seals = {
  'rose_gold',
  'bronze',
  'emerald',
}

-- Stakes table
STAR_UTIL.enabled_stakes = {
  'amber',
  'amethyst',
}

-- Stickers table
STAR_UTIL.enabled_stickers = {
  'isolated',
  'gigantic',
}

-- Patches table
STAR_UTIL.enabled_patches = {
  'immortal',
  'cleansing',
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

-- Vouchers table
STAR_UTIL.enabled_vouchers = {
  'shoplift',
  'heist'
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

-- Shuffle function
-- taken from TOGA's Stuff
function STAR_UTIL.Shuffle(t, seed)
	seed = seed or 'shuffley'
	local rt = {}
	for i = 1, #t do
		rt[#rt+1] = t[i]
	end
	pseudoshuffle(rt, pseudoseed(seed))
	return rt
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


