SMODS.Consumable {
  key = "starspace",
  set = "Spectral",
  atlas = "consumables",
  pos = { x = 3, y = 0 },
  soul_pos = { x = 4, y = 0 },
  hidden = true,
  soul_set = "Spectral",
  soul_rate = 0.003,

  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,

  use = function(self, card, area, copier)
    -- all hand levels set to 1
    update_hand_text(
      { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
      { handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
    )
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        play_sound("tarot1")
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = true
        return true
      end
    }))
    update_hand_text(
      { delay = 0 },
      { mult = "-", StatusText = true }
    )
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.9,
      func = function()
        play_sound("tarot1")
        card:juice_up(0.8, 0.5)
        return true
      end
    }))
    update_hand_text(
      { delay = 0 },
      { chips = "-", StatusText = true }
    )
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.9,
      func = function()
        play_sound("tarot1")
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = nil
        return true
      end
    }))
    update_hand_text(
      { sound = "button", volume = 0.7, pitch = 0.9, delay = 0 },
      { level = "1" }
    )
    delay(1.3)
    for poker_hand_key, hand in pairs(G.GAME.hands) do
      SMODS.smart_level_up_hand(card, poker_hand_key, true, 1 - hand.level)
    end
    update_hand_text(
      { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
      { mult = 0, chips = 0, handname = "", level = "" }
    )

    -- add a Galactic joker
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.4,
      func = function()
        play_sound("timpani")
        SMODS.add_card( { set = "Joker", rarity = "star_galactic" } )
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    delay(0.6)
  end
}
