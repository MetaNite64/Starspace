-- Joker table
STAR_UTIL.enabled_jokers = {
  'astro',
  'scrap',
  'sage',
  'crystal',
  'shard',
  'paradoxical_joker',
  'creature',
  'rocket_pop',
  'combo_pizza',
  'magolor',
  'meta_knight',
  'galacta_knight',
  --'kirby',
  'susie',
  'bacon_burger',
  'scrap_machete',
  --'sage_halo',
  'crystal_goggles',
  'writh_wrath',
  --'astronomical_joker',
  --'chronological_joker',
  --'angelic_joker',
  'glorp',
  --'quadratical',
  --':3c',
  --'chocolate_pi',
  --'wealth_distribution',
  'aikoyori',
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
  --'rise_of_kingdoms',
  --'jimbo',
  --'extra_bullet',
  --'slash_and_die',
  --'junkyard',
  --'shilling',
  --'antijoker',
  --'sappy',
  --'plan_z',
  --'astro_arbiter',
  --'astrolabe',
  --'grapefruit_soda',
  --'honest_joker',
  --'loyal_joker',
  --'the_loner',
  --'insane_joker',
  --'rebellious_joker',
  --'the_monarchy',
  'fluffy_joker',
  'shy_joker',
  'the_spacial',
  --'scaly_joker',
  --'timid_joker',
  --'the_mirrored',
  --'faithful_joker',
  'guileful_joker',
  'deceitful_joker',
  'thoughtful_joker',
  'sleightful_joker',
  'artful_joker',
  --'slothful_joker',
  'prideful_joker',
  --'plentiful_joker',
  --'meet_n_huh',
  --'andromeda',
  --'heat_death',
  'meta',
  --'weed',
  --'auzzy',
  --'roaring_knight',
  --'nxkoo',
  --'true_black_card',
  --'big_rip',
  --'overclocked_astro',
  --'seraph',
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
