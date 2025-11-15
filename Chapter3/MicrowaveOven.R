# Define microwave_oven_factory
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800
  ),
  # Add a cook method to the factory definition
  public = list(
    cook = function(time_seconds) {
      Sys.sleep(time_seconds)
      print("Your food is cooked")
    },
    # Add a open_door() method
    open_door = function() {
      private$door_is_open <- TRUE
    },
    # Add a close_door() method
    close_door = function() {
      private$door_is_open <- FALSE
    }
  )
)


# View the microwave_oven_factory
microwave_oven_factory

# Make a new microwave oven
microwave_oven <- microwave_oven_factory$new()

# Call cook method for 1 second
a_microwave_oven$cook(1)
