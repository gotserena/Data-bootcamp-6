print("Welcome to Pao Ying Chub Game!")
print("Hello There!")

#01
c_actions <- list("Paper", "Scissors", "Rock")
win <- 0
lose <- 0
draw <- 0
is_play <- 1
while (is_play) {
  while (1) {
    print("What is your choose?")
    print("1. Paper, 2. Scissors, 3. Rock")
    action <- readLines("stdin", n=1)
    if (action == 1) {
      print("You : Paper")
      break
    } else if (action == 2) {
      print ("You : Scissors")
      break
    } else if (action == 3) {
      print("You : Rock")
      break
    } else {
      print ("Sorry we don't have this choice")
    }
  }

  #02
  Bots <- c("Paper", "Scissors", "Rock")
  b_action <- sample(Bots, 1)
  print(paste("Bot :",b_action))
  
  #03
  if ( c_actions[as.numeric(action)] == "Paper") {
    if (b_action == "Rock") {
      win <- win + 1
      print("Win")
    }
    else if (b_action == "Scissors") {
      lose <- lose + 1
      print("Lose")
    } else {
      draw <- draw + 1
      print("Draw")
    }
  } 
  else if ( c_actions[as.numeric(action)] == "Scissors") {
    if (b_action == "Paper") {
      win <- win + 1
      print("Win")
    }
    else if (b_action == "Rock") {
      lose <- lose + 1
      print("Lose")
    } else {
      draw <- draw + 1
      print("Draw")
    }
  } else {
    if (b_action == "Scissors") {
      win <- win + 1
      print("Win")
    }
    else if (b_action == "Paper") {
      lose <- lose + 1
      print("Lose")
    } else {
      draw <- draw + 1
      print("Draw")
    }
  } 
  
  #04
  print("Would you like to play more games?")
  print("1. Yes, 2. No")
  q_games <- readLines("stdin", n=1)
  if (q_games == 1) {
    print("You want to play the game again")
  } else if (q_games == 2) {
    print("You don't want to play games again")
    is_play <- 0
  }
}
