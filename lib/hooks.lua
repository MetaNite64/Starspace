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
