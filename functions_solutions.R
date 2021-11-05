# 1

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  result <- (x - rng[1]) / (rng[2] - rng[1])
  result[which(is.infinite(result) & result > 0)] <- 1
  result[which(is.infinite(result) & result < 0)] <- 0
  result
}

x <- c(Inf, -Inf, 1, 0, 0.3)

rescale01(x)

# 2

both_na <- function(x,y) {
  which(is.na(x) & is.na(y))
}

nanana <- c(1,2,NA,3,5,NA,6,NA)
batman <- c(NA,2,NA,3,5,NA,NA,NA)

both_na(nanana, batman)

# 3

bootleFunc <- function(start = 99, drink = "beer", vessel = "bottle") {
  if (start < 1) {
    return("You have no drinks left.")
  }
  new <- start - 1
  if (start == 1) {
    return(str_c(start, vessel, 
                 "of", 
                 drink, 
                 "on the wall,",
                 start, vessel,
                 "of",
                 drink, 
                 "If this",
                 vessel,
                 "happens to fall,",
                 "no",
                 str_c(vessel, "s"), 
                 "of",
                 drink, 
                 "on the wall.",
                 sep = " "
    ))
  }
  if (start == 2) {
    return(str_c(start, 
                 "bottles of beer on the wall,",
                 start,
                 "bottles of beer. If one of those bottles happens to fall",
                 new,
                 "bottle of beer on the wall.",
                 sep = " "
    ))
  }
  str_c(start, 
        "bottles of beer on the wall,",
        start,
        "bottles of beer. If one of those bottles happens to fall",
        new,
        "bottles of beer on the wall.",
        sep = " "
  )
}


