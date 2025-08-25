SMODS.Joker {
  key = "meta_knight",
  atlas = "jokers",
  pos = { x = 3, y = 0 },
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  calculate = function(self, card, context)
    -- create random steel card at start of blind
    if context.setting_blind then
      local steel_card = SMODS.create_card { set = "Base", enhancement = "m_steel", area = G.discard }
      G.playing_card = (G.playing_card and G.playing_card + 1) or 1
      steel_card.playing_card = G.playing_card
      table.insert(G.playing_cards, steel_card)

      -- animation event
      G.E_MANAGER:add_event(Event({
        func = function()
          steel_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
          G.play:emplace(steel_card)
          return true
        end
      }))
      
      return {
        message = localize('k_plus_steel_ex'),
        colour = G.C.SECONDARY_SET.Enhanced,
        func = function()
          G.E_MANAGER:add_event(Event({
            func = function()
              G.deck.config.card_limit = G.deck.config.card_limit + 1
              return true
            end
          }))
          draw_card(G.play, G.deck, 90, 'up')
          SMODS.calculate_context({ playing_card_added = true, cards = { steel_card } })
        end
      }
    end

    -- turn steel cards into gold cards when played and scored
    if context.before and context.main_eval and not context.blueprint then
      local steels = 0
      for _, scored in ipairs(context.scoring_hand) do
        if SMODS.has_enhancement(scored, "m_steel") then
          steels = steels + 1
          scored:set_ability("m_gold", nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              scored:juice_up()
              return true
            end
          }))
        end
      end
      if steels > 0 then
        return {
          message = localize("k_gold"),
          colour = G.C.MONEY
        }
      end
    end
  end
}
