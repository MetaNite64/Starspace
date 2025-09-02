STAR_UTIL.sage_quips_win = {
  "ALL of the arrows!",
  "All of that time calculating and you STILL barely cleared Ante 4.",
  "Pet the Astro. Pet the Scrap.",
  "Call these televisions CRTs the way they be purrin",
  "Mrrrow..."
}

STAR_UTIL.sage_quips_lose = {
  "Mrrrow...",
  "Meet'cha in Heaven.",
  "Get in, loser. We're going to another run.",
  "Arright, who put hamburgers in the engine?",
  "I'm not gonna plan your ass, Astro."
}

for i = 1, #STAR_UTIL.sage_quips_win do
  SMODS.JimboQuip {
    key = "sage_win_" .. i,
    type = "win",
    extra = {
      center = "j_star_sage"
    }
  }
end

for i = 1, #STAR_UTIL.sage_quips_lose do
  SMODS.JimboQuip {
    key = "sage_lose_" .. i,
    type = "loss",
    extra = {
      center = "j_star_sage"
    }
  }
end
