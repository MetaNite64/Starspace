SMODS.Joker {
  key = "plus2",
  atlas = "jokers",
  pos = { x = 7, y = 5 },
  soul_pos = { x = 8, y = 5 },
  config = { card_limit = 2, extra_slots_used = 2 },
  rarity = "star_galactic",
  cost = 50,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  add_to_deck = function(self, card, from_debuff)
    local mods = G.GAME.modifiers
    mods.booster_choice_mod = (mods.booster_choice_mod or 0) + 2
    mods.booster_size_mod = (mods.booster_size_mod or 0) + 2
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
    ease_hands_played(2)
    ease_discard(2)
    G.hand:change_size(2)
    G.E_MANAGER:add_event(Event({
      func = function()
        change_shop_size(2)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 2
        return true
      end
    }))
    G.GAME.win_ante = G.GAME.win_ante + 2
  end,

  remove_from_deck = function(self, card, from_debuff)
    local mods = G.GAME.modifiers
    mods.booster_choice_mod = mods.booster_choice_mod - 2
    mods.booster_size_mod = mods.booster_size_mod - 2
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - 2
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - 2
    ease_hands_played(-2)
    ease_discard(-2)
    G.hand:change_size(-2)
    G.GAME.shop.joker_max = G.GAME.shop.joker_max - 2
    G.consumeables.config.card_limit = G.consumeables.config.card_limit - 2
    G.GAME.win_ante = G.GAME.win_ante - 2
  end,

  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      G.GAME.blind.chips = G.GAME.blind.chips + 2
      G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end

    if context.joker_main then
      return {
        chips = 2,
        mult = 2,
        xchips = 2,
        xmult = 2,
        dollars = 2,
        level_up = 2
      }
    end

    if context.mod_probability and not context.blueprint then
      return {
        numerator = context.numerator + 2,
        denominator = context.denominator + 2
      }
    end
  end
}

-- gradient for the text
SMODS.Gradient {
  key = "plus2",
  colours = {
    HEX("FF0000"),
    HEX("0000FF"),
    HEX("00FF00"),
    HEX("FFFF00")
  }
}
