SMODS.Stake {
  name = "Amber Stake",
  key = "amber",
  applied_stakes = { "gold" },
  prefix_config = { applied_stakes = { mod = false } },

  atlas = "stakes",
  pos = { x = 0, y = 0 },
  sticker_atlas = "stake_stickers",
  sticker_pos = { x = 0, y = 0 },

  colour = HEX("FDA857"),
  shiny = true,

  modifiers = function()
    G.GAME.modifiers.enable_isolateds_in_shop = true
  end
}
