generate_matrix <- function(type, center) {
  # Generate random values
  random_values <- rnorm(10, mean = center, sd=3) 
  
  # Create a matrix with type and random values
  matrix_data <- cbind(rep(type, 100), random_values)
  colnames(matrix_data) <- c("Type", "Time")
  
  return(matrix_data)
}

data = rbind(generate_matrix('Coffee', 7),
    generate_matrix('Coffee', 7),
    generate_matrix('Coffee', 7),
    generate_matrix('Coffee', 7),
    generate_matrix('Coffee', 11),
    generate_matrix('Coffee', 11),
    generate_matrix('Coffee', 11),
    generate_matrix('Coffee', 14),
    generate_matrix('R', 14),
    generate_matrix('R', 15),
    generate_matrix('R', 16),
    generate_matrix('R', 16),
    generate_matrix('R', 17),
    generate_matrix('Java', 10),
    generate_matrix('Java', 9),
    generate_matrix('Java', 13),
    generate_matrix('Python', 20),
    generate_matrix('Python', 22),
    generate_matrix('Python', 20)
    )

write.csv(data, file = "data/data.csv", row.names = FALSE)