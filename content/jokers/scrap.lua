SMODS.Joker {
  key = "scrap",
  atlas = "jokers",
  pos = { x = 1, y = 0 },
  config = { extra = {
    xmult = 1,
    xmult_gain = 0.5,
    scale_this_hand = true
  } },
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xmult_gain,
      card.ability.extra.xmult
    } }
  end,

  calculate = function(self, card, context)
    -- check if any spades are in the played hand
    if context.before and not context.blueprint then
      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit('Spades') then
          card.ability.extra.scale_this_hand = false
          break
        end
      end
    end

    -- scale xmult when a heart is scored
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if card.ability.extra.scale_this_hand and context.other_card:is_suit('Hearts') then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
        return {
          message = 'Upgraded!',
          colour = G.C.MULT,
          message_card = card
        }
      end
    end

    -- give xmult and reset scale_this_hand
    if context.joker_main then
      card.ability.extra.scale_this_hand = true
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end
}
