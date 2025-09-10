SMODS.Stake {
  name = "Amethyst Stake",
  key = "amethyst",
  applied_stakes = { "gold" }, -- for now until amber stake exists

  atlas = "stakes",
  pos = { x = 1, y = 0 },
  sticker_atlas = "stake_stickers",
  sticker_pos = { x = 1, y = 0 },

  colour = HEX("B472CA"),
  shiny = true,

  modifiers = function()
    G.GAME.modifiers.enable_gigantics_in_shop = true
  end
}
