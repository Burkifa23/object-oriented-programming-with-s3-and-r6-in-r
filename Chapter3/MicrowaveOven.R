# Define microwave_oven_factory
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800
  )
)


# View the microwave_oven_factory
microwave_oven_factory

# Make a new microwave oven
microwave_oven <- microwave_oven_factory$new()
