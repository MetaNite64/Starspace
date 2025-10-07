-- thanks Paperback. I referenced pretty much everything from there lmao
local function collect_patches(count)
  local patches = {}
  for i, v in pairs(SMODS.Stickers) do
    if v.patch_sticker then
      if count then table.insert(patches, v)
      else patches[i] = v end
    end
  end
  return patches
end

SMODS.current_mod.custom_collection_tabs = function()
  local patches = collect_patches(true)
  return {
    UIBox_button({
      button = "your_collection_star_patches",
      id = "your_collection_star_patches",
      label = { localize("star_patches") },
      count = { tally = #patches, of = #patches },
      minw = 5,
      minh = 1
    })
  }
end

local function patches_ui()
  local patches = collect_patches()
  return SMODS.card_collection_UIBox(patches, { 5, 5 }, {
    snap_back = true,
    hide_single_page = true,
    collapse_single_page = true,
    center = 'c_base',
    h_mod = 1.18,
    back_func = 'your_collection_other_gameobjects',
    modify_card = function(card, center)
      card.ignore_pinned = true
      center:apply(card, true)
    end
  })
end

G.FUNCS.your_collection_star_patches = function()
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu {
    definition = patches_ui()
  }
end

-- take patches out of the Stickers list for the duration of a function call
local function no_patches(func)
  local removed = {}
  for k, v in pairs(SMODS.Stickers) do
    if STAR_UTIL.is_patch(k) then
      removed[k] = v
      SMODS.Stickers[k] = nil
    end
  end

  local ret = func()

  for k, v in pairs(removed) do
    SMODS.Stickers[k] = v
  end

  return ret
end

-- hide patches from the Stickers tab
local stickers_ui_ref = create_UIBox_your_collection_stickers
create_UIBox_your_collection_stickers = function()
  return no_patches(stickers_ui_ref)
end
