SMODS.Joker {
  key = "sage_halo",
  atlas = "jokers",
  pos = { x = 11, y = 2 },
  rarity = "star_cosmic",
  cost = 21,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  
  calculate = function(self, card, context)
    if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand >= 3 then
      local sixes = 0
      for i, v in pairs(context.full_hand) do
        if v:get_id() == 6 then
          sixes = sixes + 1
        end
      end
      if sixes == 3 then
        for i = 1, 6 do
          local to_lucky = pseudorandom_element(G.playing_cards, "sage_halo_pick")
          while true do
            if pseudorandom("sage_give_up") < (1 / (next(SMODS.get_enhancements(to_lucky)) and 8 or 1)) then break end
            to_lucky = pseudorandom_element(G.playing_cards, "sage_halo_pick")
          end
          if to_lucky.area == G.play or to_lucky.area == G.hand then
            local percent = 1.15 - (i - 0.999) / (6 - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
              trigger = "after",
              delay = 0.15,
              func = function()
                to_lucky:flip()
                play_sound("card1", percent)
                to_lucky:juice_up(0.3, 0.3)
                return true
              end
            }))
            G.E_MANAGER:add_event(Event({
              trigger = "after",
              delay = 0.1,
              func = function()
                to_lucky:set_ability("m_lucky")
                return true
              end
            }))
            percent = 0.85 - (i - 0.999) / (6 - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
              trigger = "after",
              delay = 0.15,
              func = function()
                to_lucky:flip()
                play_sound("tarot2", percent, 0.6)
                to_lucky:juice_up(0.3, 0.3)
                return true
              end
            }))
          else
            to_lucky:set_ability("m_lucky")
          end
          if not to_lucky.seal then to_lucky:set_seal("Gold") end
        end

        return {
          message = localize('k_plus_lucky_ex'),
          colour = G.C.SECONDARY_SET.Enhanced
        }
      end
    end
  end
}
