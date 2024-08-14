# Function to print inverted full pyramid pattern
def inverted_full_pyramid(n):
    # Outer loop for the number of rows
    for i in range(n, 0, -1):
        # Inner loop for leading spaces in each row
        for j in range(n - i):
            print(" ", end="")
        # Inner loop for printing asterisks in each row
        for k in range(2*i - 1):
            print("*", end="")
        # Move to the next line after each row
        print("")

# Set the value of n (number of rows)
n = 5

# Call the function to print the inverted full pyramid
inverted_full_pyramid(n)
