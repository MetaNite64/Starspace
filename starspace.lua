STAR_UTIL = {}

assert(SMODS.load_file('lib/definitions.lua'))()
assert(SMODS.load_file('lib/utilities.lua'))()
assert(SMODS.load_file('lib/hooks.lua'))()

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

-- global mod calculate function
SMODS.current_mod.calculate = function(self, context)
  -- flip Isolated jokers during blinds
  if context.setting_blind and context.main_eval then
    STAR_UTIL.jank_isolated_flag = true
    local isolated_flag = false
    local isolated_cards = {}
    local isolated_positions = {}
    for i, v in ipairs(G.jokers.cards) do
      if v.ability.star_isolated and v.facing == "front" then
        v:flip()
        isolated_flag = true
        table.insert(isolated_cards, v)
        table.insert(isolated_positions, i)
      end
    end
    if isolated_flag then
      -- shuffle Isolated jokers during blinds
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.2,
        func = function()
          pseudoshuffle(isolated_cards)
          for i = 1, #isolated_cards do
            G.jokers.cards[isolated_positions[i]] = isolated_cards[i]
          end
          play_sound("cardSlide1", 0.85)
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          pseudoshuffle(isolated_cards)
          for i = 1, #isolated_cards do
            G.jokers.cards[isolated_positions[i]] = isolated_cards[i]
          end
          play_sound("cardSlide1", 1.15)
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          pseudoshuffle(isolated_cards)
          for i = 1, #isolated_cards do
            G.jokers.cards[isolated_positions[i]] = isolated_cards[i]
          end
          play_sound("cardSlide1", 1)
          return true
        end
      }))
    end
  end

  -- track used spectrals
  if context.using_consumeable and context.consumeable.config.center.set == "Spectral" then
    G.GAME.starspace.last_spectral = context.consumeable.config.center.key
  end
end

STAR_UTIL.load_items(STAR_UTIL.enabled_jokers, 'content/jokers')
STAR_UTIL.load_items(STAR_UTIL.enabled_consumables, 'content/consumables')
STAR_UTIL.load_items(STAR_UTIL.enabled_hands, 'content/pokerhands')
STAR_UTIL.load_items(STAR_UTIL.enabled_seals, 'content/seals')
STAR_UTIL.load_items(STAR_UTIL.enabled_stakes, 'content/stakes')
STAR_UTIL.load_items(STAR_UTIL.enabled_stickers, 'content/stickers')
STAR_UTIL.load_items(STAR_UTIL.enabled_patches, 'content/patches')
STAR_UTIL.load_items(STAR_UTIL.enabled_quips, 'content/quips')
assert(SMODS.load_file('lib/collection.lua'))()
