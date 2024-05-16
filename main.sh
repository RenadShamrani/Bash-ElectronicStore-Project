#!/bin/bash

# Source the product definitions and functions
source ./products.sh
source ./functions.sh

# Main function
main() {
    greet_customer
    browse_products
    select_products
    checkout
}

# Run main function
main
