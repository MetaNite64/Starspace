STAR_UTIL.astro_quips_win = {
  "TETRATION!!!!!",
  "Look! It's me!",
  "Hamburber ... :3",
  "This really was a Balatrotale.",
  "Mreow!"
}

STAR_UTIL.astro_quips_lose = {
  "Mreow!",
  "Please don't tell Scrap...",
  "I- I'm flabbergasted.",
  "...It's okay! Bet'cha you'll find me in the next run!",
  "Master Plan my ass!"
}

for i = 1, #STAR_UTIL.astro_quips_win do
  SMODS.JimboQuip {
    key = "astro_win_" .. i,
    type = "win",
    extra = {
      center = "j_star_astro"
    }
  }
end

for i = 1, #STAR_UTIL.astro_quips_lose do
  SMODS.JimboQuip {
    key = "astro_lose_" .. i,
    type = "loss",
    extra = {
      center = "j_star_astro"
    }
  }
end
