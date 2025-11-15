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
