#!/bin/bash

# Function to greet the customer
greet_customer() {
    local greetings=("Hello, welcome to Electronics Direct!" "Hi there! How can I help you today?" "Good day! Are you looking for something specific?")
    echo "${greetings[$(expr $RANDOM % ${#greetings[@]})]}"
}

# Function to display products
browse_products() {
    echo "We offer a wide range of electronics:"
    for key in $(echo "${!products[@]}" | tr ' ' '\n' | sort -n); do
        product=${products[$key]}
        price=$(echo "${prices[$product]}" | awk '{print int($1 + rand() * ($2 - $1 + 1))}')
        echo "$key. $product (Price: \$$price)"
    done
}

# Function to select products
select_products() {
    selected_products=()
    while true; do
        read -p "Enter the product number you would like to purchase (or type 'done' to finish): " choice
        case $choice in
            [1-5])
                product=${products[$choice]}
                selected_products+=("$product")
                echo "Successfully added to your cart: $product"
            ;;
            "done")
                break
            ;;
            *)
                echo "Invalid choice. Please choose a valid product number or type 'done' to finish."
            ;;
        esac
    done
}

# Function for checkout
checkout() {
    if [ ${#selected_products[@]} -eq 0 ]; then
        echo "No products selected. Thanks for browsing!"
        return
    fi
    echo "-------------------------------"
    echo "** Electronics Store - Receipt**"
    total_price=0
    for product in "${selected_products[@]}"; do
        price=$(echo "${prices[$product]}" | awk '{print int($1 + rand() * ($2 - $1 + 1))}')
        echo "Product: $product (Price: \$$price)"
        (( total_price += price ))
    done
    echo "-------------------------------"
    echo "Total Price: \$$total_price"
    read -p "How would you like to pay? (cash/credit): " payment_method
    payment_method=$(echo "$payment_method" | tr '[:upper:]' '[:lower:]')
    if [ "$payment_method" == "cash" ]; then
        echo "Thank you for your purchase! Your cash payment has been processed."
        elif [ "$payment_method" == "credit" ]; then
        while true; do
            read -p "Enter the name on the card: " card_name
            read -p "Enter the card number (16 digits): " card_number
            read -p "Enter the expiry date (MM/YY): " expiry_date
            read -p "Enter the CVS (3 digits): " cvs
            
            if [[ ${#card_number} -ne 16 ]]; then
                echo "Invalid card number. It must be exactly 16 digits."
                continue
                elif [[ ${#expiry_date} -ne 5 ]]; then
                echo "Invalid expiry date. It must be exactly 5 characters (MM/YY)."
                continue
                elif [[ ${#cvs} -ne 3 ]]; then
                echo "Invalid CVS. It must be exactly 3 digits."
                continue
            else
                break
            fi
        done
        echo "Thank you for your purchase! Your credit card payment has been processed."
        
    else
        echo "Invalid payment method. Please choose cash or credit."
    fi
}
