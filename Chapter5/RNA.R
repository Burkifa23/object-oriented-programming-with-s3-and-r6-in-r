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


