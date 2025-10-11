SMODS.PokerHandPart {
  key = "flash",
  func = function(hand)
    -- borrowed some logic from paperback spectrum
    if #hand < 4 then return {} end
    
    local suits = {}
    for k, _ in pairs(SMODS.Suits) do
      suits[k] = false
    end

    -- handle non-wild cards first, pick the highest of the given suit
    for _, card in ipairs(hand) do
      if not SMODS.has_any_suit(card) then
        for suit, v in pairs(suits) do
          if card:is_suit(suit, nil, true) then
            if not v or card:get_id() > v:get_id() then
              suits[suit] = card
              break
            end
          end
        end
      end
    end

    -- build a sorted table of the wild cards
    local wilds = {}
    for _, card in ipairs(hand) do
      if SMODS.has_any_suit(card) then
        table.insert(wilds, card)
      end
    end
    table.sort(wilds, function(a, b)
      return a:get_id() > b:get_id()
    end)

    -- wild cards fill in the gaps
    for _, card in ipairs(wilds) do
      local card_added = false
      for suit, v in pairs(suits) do
        if card:is_suit(suit, nil, true) then
          if not v then
            suits[suit] = card
            card_added = true
            break
          end
        end
      end

      -- if the wild card didn't need to fill in the gap,
      -- then it can replace the lowest rank card in the hand
      -- if the wild card has a higher rank
      if not card_added then
        local lowest_rank = math.huge
        local lowest_suit = nil
        for suit, v in pairs(suits) do
          if card:is_suit(suit, nil, true) then
            if v:get_id() < lowest_rank then
              lowest_rank = v:get_id()
              lowest_suit = suit
            end
          end
        end
        if lowest_suit and card:get_id() > lowest_rank then
          suits[lowest_suit] = card
        end
      end
    end

    -- put together return table
    local ret = {}
    for _, v in pairs(suits) do
      if v then
        table.insert(ret, v)
      end
    end

    -- break down to just the top 4 ranks
    table.sort(ret, function(a, b)
      return a:get_id() >= b:get_id()
    end)

    while #ret > 4 do
      table.remove(ret)
    end

    if #ret == 4 then return { ret } end
    return {}
  end
}

SMODS.PokerHand {
  key = "flash",
  visible = true,
  chips = 25,
  mult = 2,
  l_chips = 15,
  l_mult = 2,
  example = {
    { "H_A", true },
    { "D_6", true },
    { "S_9", true },
    { "C_7", true },
    { "D_2", false }
  },

  evaluate = function(parts, hand)
    return parts.star_flash
  end
}
