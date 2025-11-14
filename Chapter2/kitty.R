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
