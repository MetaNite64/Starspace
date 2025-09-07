return {
  descriptions = {
    Joker = {
      j_star_astro = {
        name = "Astro",
        text = {
          "This Joker gains {X:chips,C:white}X#1#{} Chips",
          "when a {C:spades}Spade{} is scored,",
          "unless a {C:hearts}Heart{} is",
          "in the scored hand",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)"
        }
      },
      j_star_crystal = {
        name = "Crystal",
        text = {
          "Retrigger the {C:attention}Joker{} to",
          "the right #1# times"
        }
      },
      j_star_glorp = {
        name = "Glorp",
        text = {
          "{X:mult,C:white}X#1#{} Mult during",
          "{C:attention}context.#2#{},",
          "context changes at",
          "end of round"
        }
      },
      j_star_meta_knight = {
        name = "Meta Knight",
        text = {
          "Add one {C:attention}Steel{} card to the deck",
          "when {C:attention}Blind{} is selected.",
          "All played {C:attention}Steel{} cards become",
          "{C:attention}Gold{} cards when scored"
        }
      },
      j_star_rocket_pop = {
        name = "Rocket Pop",
        text = {
          "This Joker gains #2# {C:attention}trigger{} and",
          "loses {X:mult,C:white}#1#{} of its current {C:mult}xMult{}",
          "at the end of the round",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult, {C:attention}#4#{C:inactive} #5#)"
        }
      },
      j_star_sage = {
        name = "Sage",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "every time {C:gold}money{} is",
          "earned during scoring",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },
      j_star_scrap = {
        name = "Scrap",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "when a {C:hearts}Heart{} is scored,",
          "unless a {C:spades}Spade{} is",
          "in the scored hand",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },
      j_star_shard = {
        name = "Shard",
        text = {
          "Retrigger the leftmost",
          "{C:attention}Joker{} #1# times"
        }
      }
    },
    Other = {
      star_emerald_seal = {
        name = "Emerald Seal",
        text = {
          "Retrigger every other",
          "card with a {C:attention}seal{}",
          "in {C:attention}scoring hand{}"
        }
      },
      star_rose_gold_seal = {
        name = "Rose Gold Seal",
        text = {
          "Earn {C:money}$#1#{} per",
          "{C:attention}seal{} played in",
          "{C:attention}scoring hand{}"
        }
      },
    },
    Spectral = {
      c_star_starspace = {
        name = "Starspace",
        text = {
          "Creates a",
          "{C:star_galactic,E:1}Galactic{} Joker",
          "{C:inactive}(Must have room){}"
        }
      }
    }
  },
  misc = {
    dictionary = {
      k_plus_steel_ex = "+1 Steel",
      k_plus_trigger_ex = "+1 Trigger",
      k_star_cosmic = "Cosmic",
      k_star_galactic = "Galactic"
    },
    labels = {
      k_star_cosmic = "Cosmic",
      k_star_galactic = "Galactic",

      star_emerald_seal = "Emerald Seal",
      star_rose_gold_seal = "Rose Gold Seal",
    },
    quips = {
      star_astro_win_1 = { "TETRATION!!!!!" },
      star_astro_win_2 = { "Look!", "It's me!" },
      star_astro_win_3 = { "Hamburber ...", ":3" },
      star_astro_win_4 = { "This really was", "a Balatrotale." },
      star_astro_win_5 = { "Mreow!" },

      star_astro_lose_1 = { "Mreow!" },
      star_astro_lose_2 = { "Please don't", "tell Scrap..." },
      star_astro_lose_3 = { "I- I'm flabbergasted..." },
      star_astro_lose_4 = { "...It's okay! Bet'cha", "you'll find me in", "the next run!" },
      star_astro_lose_5 = { "Master Plan", "my ass!" },

      star_scrap_win_1 = { "Great minds think", "alike, Player." },
      star_scrap_win_2 = { "Well met." },
      star_scrap_win_3 = { "Good thinking, Player.", "I'm impressed." },
      star_scrap_win_4 = { "Sorry, how many Chips?" },

      star_scrap_lose_1 = { "I swear to god." },
      star_scrap_lose_2 = { "Use that brain", "of yours!" },
      star_scrap_lose_3 = { "Screw this, I'm making", "myself some apple pie..." },
      star_scrap_lose_4 = { "HISSSSSS" },

      star_sage_win_1 = { "ALL of the arrows!" },
      star_sage_win_2 = { "All of that time", "calculating and you STILL", "barely cleared Ante 4." },
      star_sage_win_3 = { "Pet the Astro.", "Pet the Scrap." },
      star_sage_win_4 = { "Call these televisions", "CRTs the way they", "be purrin" },
      star_sage_win_5 = { "Mrrrow..." },

      star_sage_lose_1 = { "Mrrrow..." },
      star_sage_lose_2 = { "Meet'cha in Heaven." },
      star_sage_lose_3 = { "Get in, loser.", "We're going to", "another run." },
      star_sage_lose_4 = { "Arright, who put", "hamburgers in", "the engine?" },
      star_sage_lose_5 = { "I'm not gonna", "plan your ass, Astro." }
    }
  }
}
