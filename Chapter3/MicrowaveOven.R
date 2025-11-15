# Define microwave_oven_factory
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800
  ),
  private = list(
    ..power_rating_watts = 800
  ),
  active = list(
    # Add the binding here
    power_rating_watts = function() {
      private$..power_rating_watts
    },
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
    },
    # Add initialize() method here
    initialize = function(power_rating_watts, door_is_open) {
      if(!missing(power_rating_watts)) {
        private$power_rating_watts <- power_rating_watts
      }
      if(!missing(door_is_open)){
        private$door_is_open <- door_is_open
      } 
    }
  )
)


# View the microwave_oven_factory
microwave_oven_factory

# Make a new microwave oven
microwave_oven <- microwave_oven_factory$new()

# Call cook method for 1 second
a_microwave_oven$cook(1)


# Make a microwave
a_microwave_oven <- microwave_oven_factory$new(
  power_rating_watts = 650,
  door_is_open = TRUE
)


# Get the power rating
a_microwave_oven$power_rating_watts
