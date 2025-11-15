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

# Add a binding for power rating
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    ..power_rating_watts = 800,
    ..power_level_watts = 800
  ),
  # Add active list containing an active binding
  active = list(
    power_level_watts = function(value) {
      if(missing(value)) {
        # Return the private value
        private$..power_level_watts
      } else {
        # Assert that value is a number
        assert_is_a_number(value)
        # Assert that value is in a closed range from 0 to power rating
        assert_all_are_in_closed_range(value, lower=0, upper=private$..power_rating_watts)
        # Set the private power level to value
        private$..power_level_watts <- value
      }
    }
  )
)

# Make a microwave 
a_microwave_oven <- microwave_oven_factory$new()

# Get the power level
a_microwave_oven$power_level_watts

# Try to set the power level to "400"
a_microwave_oven$power_level_watts <- "400"

# Try to set the power level to 1600 watts
a_microwave_oven$power_level_watts <- 1600

# Set the power level to 400 watts
a_microwave_oven$power_level_watts <- 400
