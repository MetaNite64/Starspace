-- init_game_object hook
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

-- Card:flip hook: don't flip a joker if it has the Brave patch
local flip_ref = Card.flip
function Card.flip(self)
  if self.facing == 'front' and self.ability and self.ability.star_brave then return end
  flip_ref(self)
end
