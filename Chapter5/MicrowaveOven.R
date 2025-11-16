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

# Create a microwave oven
a_microwave_oven <- microwave_oven_factory$new()

# Copy a_microwave_oven using <-
assigned_microwave_oven <- a_microwave_oven
  
# Copy a_microwave_oven using clone()
cloned_microwave_oven <- a_microwave_oven$clone()
  
# Change a_microwave_oven's power level  
a_microwave_oven$power_level_watts <- 400
  
# Check a_microwave_oven & assigned_microwave_oven same 
identical(a_microwave_oven$power_level_watts, assigned_microwave_oven$power_level_watts)

# Check a_microwave_oven & cloned_microwave_oven different 
identical(a_microwave_oven$power_level_watts, cloned_microwave_oven$power_level_watts)  

# Create a microwave oven
a_microwave_oven <- microwave_oven_factory$new()

# Look at its power plug
a_microwave_oven$power_plug

# Copy a_microwave_oven using clone(), no args
cloned_microwave_oven <- a_microwave_oven$clone()
  
# Copy a_microwave_oven using clone(), deep = TRUE
deep_cloned_microwave_oven <- a_microwave_oven$clone(deep=TRUE)
  
# Change a_microwave_oven's power plug type  
a_microwave_oven$power_plug$type <- "British"
  
# Check a_microwave_oven & cloned_microwave_oven same 
identical(a_microwave_oven$power_plug$type, cloned_microwave_oven$power_plug$type)

# Check a_microwave_oven & deep_cloned_microwave_oven different 
identical(a_microwave_oven$power_plug$type, deep_cloned_microwave_oven$power_plug$type)  

# Complete the class definition
smart_microwave_oven_factory <- R6Class(
  "SmartMicrowaveOven",
  inherit = microwave_oven_factory, # Specify inheritance
  private = list(
    # Add a field to store connection
    conn = NULL
  ),
  public = list(
    initialize = function() {
      # Connect to the database
      private$conn = dbConnect(RSQLite::SQLite(), "cooking-times.sqlite")
    },
    get_cooking_time = function(food) {
      dbGetQuery(
        private$conn,
        sprintf("SELECT time_seconds FROM cooking_times WHERE food = '%s'", food)
      )
    },
    finalize = function() {
      # Print a message
      message("Disconnecting from the cooking times database.")
      # Disconnect from the database
      dbDisconnect(private$conn)
    }
  )
)

# Create a smart microwave object
a_smart_microwave <- smart_microwave_oven_factory$new()
  
# Call the get_cooking_time() method
a_smart_microwave$get_cooking_time("soup")

# From previous step
smart_microwave_oven_factory <- R6Class(
  "SmartMicrowaveOven",
  inherit = microwave_oven_factory, 
  private = list(
    conn = NULL
  ),
  public = list(
    initialize = function() {
      private$conn <- dbConnect(SQLite(), "cooking-times.sqlite")
    },
    get_cooking_time = function(food) {
      dbGetQuery(
        private$conn,
        sprintf("SELECT time_seconds FROM cooking_times WHERE food = '%s'", food)
      )
    },
    finalize = function() {
      message("Disconnecting from the cooking times database.")
      dbDisconnect(private$conn)
    }
  )
)
a_smart_microwave <- smart_microwave_oven_factory$new()

# Remove the smart microwave
rm(a_smart_microwave)

# Force garbage collection
gc()
