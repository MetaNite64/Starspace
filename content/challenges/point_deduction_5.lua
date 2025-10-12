SMODS.Challenge {
  key = "point_deduction_5",
  rules = {
    custom = {
      { id = "star_point_deduction_5" }
    }
  },
  consumeables = {
    { id = "c_star_starspace" }
  },
  apply = function()
    SMODS.set_scoring_calculation("star_point_deduction_5")
  end
}
