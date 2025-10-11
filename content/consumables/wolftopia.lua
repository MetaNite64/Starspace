SMODS.Consumable {
  key = "wolftopia",
  set = "Planet",
  atlas = "consumables",
  cost = 3,
  pos = { x = 0, y = 2 },
  config = { hand_type = "star_flash" },

  loc_vars = function(self, info_queue, card)
    local hand = G.GAME.hands[card.ability.hand_type]
    return { vars = {
      hand.level,
      localize(card.ability.hand_type, "poker_hands"),
      hand.l_mult,
      hand.l_chips,
      colours = { (hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand.level)]) }
    } }
  end
}
