#!/bin/bash

# Function that prints a statement and returns a value
my_function() {
  local value=42
  echo "This is a printed statement inside the function."
  echo $value  # Return a value using echo
}

# Capture the function output
result=$(my_function)

# Print the return value
echo "The returned value is: $result"
