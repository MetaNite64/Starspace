SMODS.Joker {
  key = "rocket_pop",
  atlas = "jokers",
  pos = { x = 2, y = 0 },
  config = { extra = {
    xmult = 2,
    xmult_loss_percent = 0.1,
    retriggers = 0,
    retriggers_gain = 1
  } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return { vars = {
      tostring(100 * card.ability.extra.xmult_loss_percent) .. "%",
      card.ability.extra.retriggers_gain,
      card.ability.extra.xmult,
      card.ability.extra.retriggers + 1,
      (card.ability.extra.retriggers > 0 and "triggers") or "trigger"
    } }
  end,

  calculate = function(self, card, context)
    -- give xmult
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end

    -- retrigger self in joker_main
    if context.retrigger_joker_check and context.other_card == card and not context.blueprint then
      if card.ability.extra.retriggers > 0 and context.other_context.joker_main then
        return {
          repetitions = card.ability.extra.retriggers
        }
      end
    end

    -- scale self
    if context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.xmult = card.ability.extra.xmult * (1 - card.ability.extra.xmult_loss_percent)
      card.ability.extra.retriggers = card.ability.extra.retriggers + card.ability.extra.retriggers_gain
      if card.ability.extra.xmult <= 1 then
        -- food destruction
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound("tarot1")
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({
              trigger = "after",
              delay = 0.3,
              blockable = false,
              func = function()
                card:remove()
                return true
              end
            }))
            return true
          end
        }))
        return {
          message = localize("k_eaten_ex"),
          colour = G.C.FILTER
        }
      else
        return {
          message = localize { type = "variable", key = "a_mult_minus", vars = {
            tostring(100 * card.ability.extra.xmult_loss_percent) .. "%"
          } },
          colour = G.C.RED,
          extra = {
            message = localize("k_plus_trigger_ex"),
            colour = G.C.FILTER
          }
        }
      end
    end
  end
}
