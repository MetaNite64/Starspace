-- init_game_object hook: see enclosed comments
local igo_ref = Game.init_game_object
function Game.init_game_object(self)
  local ret = igo_ref(self)

  -- get list of all secret hands
  -- (i.e. invisible on game start)
  local secrets = {}
  for k, v in pairs(SMODS.PokerHands) do
    if (type(v.visible) == 'function' and not v:visible()) or not v.visible then
      table.insert(secrets, k)
    end
  end

  ret.starspace = {
    secret_hands = secrets
  }

  return ret
end

-- main_menu hook: add a random friend of astro to the title screen
local gmm_ref = Game.main_menu
function Game:main_menu(change_context)
  local ret = gmm_ref(self, change_context)

  -- get a table of all the friends of astro
  local friends = {}
  for i, v in pairs(SMODS.Centers) do
    if v.pools and v.pools.friends_of_astro then table.insert(friends, i) end
  end

  local cardkey = friends[math.ceil(math.random() * #friends)]
  local newcard = Card(
    G.title_top.T.x,
    G.title_top.T.y,
    G.CARD_W,
    G.CARD_H,
    G.P_CARDS.empty,
    G.P_CENTERS[cardkey],
    { bypass_discovery_center = true }
  )

  -- the magic incantations that fix the title screen
  G.title_top.T.w = G.title_top.T.w + 1.7675
  G.title_top.T.x = G.title_top.T.x - 0.8

  -- post-processing for the card
  G.title_top:emplace(newcard)
  newcard.T.w = newcard.T.w * 1.1 * 1.2
  newcard.T.h = newcard.T.h * 1.1 * 1.2
  newcard.no_ui = true
  newcard:set_sprites(newcard.config.center)
  newcard.states.visible = false
  G.E_MANAGER:add_event(Event({
    trigger = "after",
    delay = 0,
    blockable = false,
    blocking = false,
    func = function()
      if change_context == "splash" then
        newcard.states.visible = true
        newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
      else
        newcard.states.visible = true
        newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
      end
      return true
    end
  }))
  return ret
end

-- Card:flip hook: don't flip a joker if it has the Brave patch
local flip_ref = Card.flip
function Card.flip(self)
  if self.facing == 'front' and self.ability and self.ability.star_brave then return end
  flip_ref(self)
end

-- Card:get_chip_bonus hook: halve chip bonus for every copy of Susie present
local gcb_ref = Card.get_chip_bonus
function Card.get_chip_bonus(self)
  local susies = #SMODS.find_card("j_star_susie")
  local multiplier = math.pow(0.5, susies)
  return gcb_ref(self) * multiplier
end
