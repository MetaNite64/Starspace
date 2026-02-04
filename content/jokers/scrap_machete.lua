--[[SMODS.Joker {
  key = "scrap_machete",
  atlas = "jokers",
  pos = { x = 0, y = 1 },
  rarity = 1,
  cost = 6,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  
  calculate = function(self, card, context)
    if context.destroy_card and not context.blueprint then
      if #context.full_hand == 1 and context.destroy_card == context.full_hand[1] and G.GAME.current_round.hands_played == 0 then
        local destroyed = context.full_hand[1]
        local rank = destroyed.base.value
        local suit = destroyed.base.suit
        local enhancement = next(SMODS.get_enhancements(destroyed))
        local edition = destroyed.edition and destroyed.edition.key
        local seal = destroyed.seal

        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card {
              set = "Base",
              rank = rank,
              area = G.discard,
              key_append = "star_machete"
            }
            SMODS.add_card {
              set = "Base",
              suit = suit,
              area = G.discard,
              key_append = "star_machete"
            }
            SMODS.add_card {
              set = "Base",
              enhancement = enhancement,
              edition = edition,
              seal = seal,
              area = G.discard,
              key_append = "star_machete"
            }
            return true
          end
        }))

        return {
          message = localize("k_machete_ex"),
          remove = true
        }
      end
    end
  end
}]]


SMODS.Joker {
  key = "scrap_machete",
  atlas = "jokers",
  pos = { x = 0, y = 1 },
  rarity = 2,
  cost = 7,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  config = {
    extra = {
      xmult = 1,
      xmult_gain = 0.1,
    },
  },
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return {
      vars = {
        cae.xmult,cae.xmult_gain
      },
    }
  end,
  
  calculate = function(self, card, context)
    local cae = card.ability.extra
    if context.destroy_card and not context.blueprint then
      for k, v in pairs(context.scoring_hand) do
        if context.destroy_card == v and SMODS.get_enhancements(context.destroy_card)["m_mult"] then
            SMODS.scale_card(card,{
            ref_table = cae,
            ref_value = "xmult",
            scalar_value = "xmult_gain",
            scaling_message = {}
          })
          return{
            message = localize("k_machete_ex"),
            remove = true,
            message_card = context.destroy_card
          }
        end
      end
    end
    if context.joker_main then
      return {
        xmult = cae.xmult,
      }
    end
  end
}