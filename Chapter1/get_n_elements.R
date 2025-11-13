# Create get_n_elements
get_n_elements <- function(x, ...)
{
  UseMethod("get_n_elements")
}

# View get_n_elements
get_n_elements

# Create a data.frame method for get_n_elements
get_n_elements.data.frame <- function(x, ...){
    nrow(x) * ncol(x)
}




# Call the method on the sleep dataset
n_elements_sleep <- get_n_elements(sleep)

# View the result
n_elements_sleep
