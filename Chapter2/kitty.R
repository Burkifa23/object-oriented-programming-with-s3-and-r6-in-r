# View the kitty
kitty

# Assign classes
class(kitty) <- c("cat", "mammal", "character")

# Does kitty inherit from cat/mammal/character?
inherits(kitty, "cat")
inherits(kitty, "mammal")
inherits(kitty, "character")



# Is kitty a character vector?
is.character(kitty)

# Does kitty inherit from dog?
inherits(kitty, "dog")

# Inspect your workspace
ls.str()

# cat method
what_am_i.cat <- function(x, ...)
{
  # Write a message
  message("I'm a cat")
  # Call NextMethod
  NextMethod("what_am_i")
}

# mammal method
what_am_i.mammal <- function(x, ...)
{
  # Write a message
  message("I'm a mammal")
  # Call NextMethod
  NextMethod("what_am_i")
}

# character method
what_am_i.character <- function(x, ...)
{
  # Write a message
  message("I'm a character vector")
  # DO NOT call NextMethod, as this is the end of the chain
}

# Call what_am_i()
what_am_i(kitty)
