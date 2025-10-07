STAR_UTIL.Patch {
  key = "generous",
  badge_colour = HEX("B18F43"),
  atlas = "card_mods",
  pos = { x = 1, y = 2 },
  patch_sticker = "rental",

  calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual then
      return {
        dollars = 2
      }
    end
  end
}
