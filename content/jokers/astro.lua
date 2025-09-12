SMODS.Joker {
  key = "astro",
  atlas = "jokers",
  pos = { x = 0, y = 0 },
  config = { extra = {
    xchips = 1,
    xchips_gain = 0.1,
    scale_this_hand = true
  } },
  rarity = 2,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xchips_gain,
      card.ability.extra.xchips
    } }
  end,

  calculate = function(self, card, context)
    -- check if any hearts are in the played hand
    if context.before and not context.blueprint then
      for _, v in ipairs(context.scoring_hand) do
        if v:is_suit('Hearts') then
          card.ability.extra.scale_this_hand = false
          break
        end
      end
    end

    -- scale xchips when a spade is scored
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if card.ability.extra.scale_this_hand and context.other_card:is_suit('Spades') then
        card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_gain
        return {
          message = 'Upgraded!',
          colour = G.C.CHIPS,
          message_card = card
        }
      end
    end

    -- give xchips and reset scale_this_hand
    if context.joker_main then
      card.ability.extra.scale_this_hand = true
      return {
        xchips = card.ability.extra.xchips
      }
    end
  end
}
