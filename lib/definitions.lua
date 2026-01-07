-- Patch object
STAR_UTIL.Patch = SMODS.Sticker:extend {
  prefix_config = { key = true },
  should_apply = false,
  config = {},
  rate = 0,
  sets = {
    Default = true
  },

  draw = function(self, card)
    G.shared_stickers[self.key].role.draw_major = card
    G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
  end
}

-- Friends of Astro pool
SMODS.ObjectType {
  key = "friends_of_astro",
  default = "j_star_astro",
  cards = {}
}

-- scoring calculation for Point Deduction 5 challenge
SMODS.Scoring_Calculation {
  key = "point_deduction_5",
  func = function(self, chips, mult, flames)
    -- visuals
    return chips * mult * 0.5
  end,


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

  -- visuals for point deduction 5 challenge
  if context.final_scoring_step and G.GAME.modifiers.star_point_deduction_5 then
    G.E_MANAGER:add_event(Event({
      func = function()
      play_sound('gong', 0.35, 0.3)
      play_sound('gong', 0.35*1.5, 0.2)
      play_sound('tarot1', 1.5)
      ease_colour(G.C.UI_CHIPS, {0.5, 0, 0, 1})
      ease_colour(G.C.UI_MULT, {0.5, 0, 0, 1})
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        delay = 0.8,
        func = function()
        ease_colour(G.C.UI_CHIPS, G.C.BLUE, 0.8)
        ease_colour(G.C.UI_MULT, G.C.RED, 0.8)
        return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        delay = 1.3,
        no_delete = true,
        func = function()
        G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
        G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
        return true
        end
      }))
      return true
      end
    }))
  end
end

-- star_can_select_consumeable: checks if consumeable is selectable
-- mostly copied from SMODS can_select_from_booster
G.FUNCS.star_can_select_consumeable = function(e)
  local card = e.config.ref_table
  local card_limit = card.ability.card_limit
  local extra_slots_used = card.ability.extra_slots_used
  if #G.consumeables.cards < G.consumeables.config.card_limit + card_limit - extra_slots_used then
    e.config.colour = G.C.GREEN
    e.config.button = "star_select_consumeable"
  else
    e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    e.config.button = nil
  end
end
-- star_select_consumeable: wrapper that just calls use_card
G.FUNCS.star_select_consumeable = function(e, mute, nosave)
  return G.FUNCS.use_card(e, mute, nosave)
end

-- credits defined here
STAR_UTIL.credits = {
  squad = {
    colour = G.C.GREEN,
    entries = {
      "Astro",
      "Crystal",
      "Meta",
      "Sage"
    }
  },
  artists = {
    colour = G.C.CHIPS,
    entries = {
      "Astro",
      "Camostar",
      "candycane",
      "FirstTry",
      "Lyre",
      "Sage",
      "SDM_0"
    }
  },
  coders = {
    colour = G.C.PURPLE,
    entries = {
      "Meta",
      "ThunderEdge"
    }
  },
  shaders = {
    colour = G.C.MULT,
    entries = {
      "cassknows",
      "Meta"
    }
  }
}
