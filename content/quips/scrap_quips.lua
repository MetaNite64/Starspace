STAR_UTIL.scrap_quips_win = {
  "Great minds think alike, Player.",
  "Well met.",
  "Good thinking, Player. I'm impressed.",
  "Sorry, how many Chips?"
}

STAR_UTIL.scrap_quips_lose = {
  "I swear to god.",
  "Use that brain of yours!",
  "Screw this, I'm making myself some apple pie...",
  "All that Multiplier for nothing, Player?",
  "HISSSSSS"
}

for i = 1, #STAR_UTIL.scrap_quips_win do
  SMODS.JimboQuip {
    key = "scrap_win_" .. i,
    type = "win",
    extra = {
      center = "j_star_scrap"
    }
  }
end

for i = 1, #STAR_UTIL.scrap_quips_lose do
  SMODS.JimboQuip {
    key = "scrap_lose_" .. i,
    type = "loss",
    extra = {
      center = "j_star_scrap"
    }
  }
end
