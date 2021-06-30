library(tidyverse)
place_queen <- function(queens=c()) {
  # If there are 8 queens placed, then this must be a solution.
  if (length(queens) == 8) {
    return(list(queens))
  }
  
  # Figre out where a queen can be placed in the next row.
  # Drop all columns that have already been taken - since we 
  # can't place a queen below an existing queen
  possible_placements <- setdiff(1:8, queens)
  
  # For each queen already on the board, find the diagonal 
  # positions that it can see in this row.
  diag_offsets <- seq.int(length(queens), 1)
  diags <- c(queens + diag_offsets, queens - diag_offsets)
  diags <- diags[diags > 0 & diags < 9]
  
  # Drop these diagonal columns from possible placements
  possible_placements <- setdiff(possible_placements, diags)
  
  # For each possible placement, try and place a queen
  possible_placements %>% 
    map(~place_queen(c(queens, .x))) %>%
    keep(~length(.x) > 0) %>%
    flatten()
}


#-----------------------------------------------------------------------------
#' Plot a single solution
#' @param queens a vector of 8 integers giving the column positions of 8 queens
#-----------------------------------------------------------------------------
plot_single_8queens <- function(queens) {
  queens_df <- data_frame(cols = queens, rows=1:8)
  board_df <- expand.grid(cols = 1:8, rows = 1:8) %>% 
    mutate(check = (cols + rows) %%2 == 1)
  
  ggplot(queens_df, aes(cols, rows)) + 
    geom_tile(data=board_df, aes(fill=check), colour='black') +
    geom_label(label='Q', fill='lightblue') + 
    theme_void() + 
    coord_equal() + 
    scale_fill_manual(values = c('TRUE'='white', 'FALSE'='black')) + 
    theme(
      legend.position = 'none'
    ) + 
    labs(title = paste("Queens", deparse(as.numeric(queens))))
  
}


#-----------------------------------------------------------------------------
# Start with no queens placed and generate all solutions. Plot the first 2
#-----------------------------------------------------------------------------
solutions <- place_queen(2)
length(solutions)
plot_single_8queens(solutions[[9]])
