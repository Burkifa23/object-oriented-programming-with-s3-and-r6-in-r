# Assign lst
lst <- list(
  perfect = c(6, 28, 496),
  bases = c("A", "C", "G", "T")
)

# Copy lst
lst2 <- lst
  
# Change lst's bases element
lst$bases[4] <- "U"
  
# Test lst and lst2 identical
identical(lst$bases, lst2$bases)


env <- list2env(lst)

# Copy env
env2 <- env
  
# Change env's bases element
env$bases[4] <- "U"
  
# Test env and env2 identical
identical(env$bases, env2$bases)


# Complete the class definition
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    shared = {
      # Create a new environment named e
      e <- new.env()
      # Assign safety_warning into e
      e$safety_warning <- "Warning. Do not try to cook metal objects."
      # Return e
      e
    }
  ),
  active = list(
    # Add the safety_warning binding
    safety_warning = function(value) {
      if(missing(value)) {
        private$shared$safety_warning
      } else {
        private$shared$safety_warning <- value
      }
    }
  )
)

# Create two microwave ovens
a_microwave_oven <- microwave_oven_factory$new()
another_microwave_oven <- microwave_oven_factory$new()
  
# Change the safety warning for a_microwave_oven
a_microwave_oven$safety_warning <- "Warning. If the food is too hot you may scald yourself."
  
# Verify that the warning has change for another_microwave
another_microwave_oven$safety_warning
