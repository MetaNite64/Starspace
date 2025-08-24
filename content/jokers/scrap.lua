SMODS.Joker {
  key = "scrap",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  config = { extra = {
    xchips = 1,
    xchips_gain = 0.1,
    scale_this_hand = true
  } },
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  
  loc_txt = { ['en-us'] = {
    name = 'Scrap',
    text = {
      'This Joker gains {X:chips,C:white}X#1#{} Chips',
      'when a {C:hearts}Heart{} is scored,',
      'unless a {C:spades}Spade{} is',
      'in the scored hand',
      '{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)'
    }
  } },

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
        if v:is_suit('Spades') then
          card.ability.extra.scale_this_hand = false
          break
        end
      end
    end

    -- scale xchips when a spade is scored
    if context.individual and not context.blueprint and card.ability.extra.scale_this_hand then
      if context.other_card:is_suit('Hearts') then
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
