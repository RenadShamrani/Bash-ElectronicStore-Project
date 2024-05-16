# Define products and prices
declare -A products=(
    ["1"]="| Dell laptop       | Intel Core i7, 16 Ram |"
    ["2"]="| Samsung Tv        | 40in, 4k resolution   |"
    ["3"]="| Headphones        | Apple pro, White      |"
    ["4"]="| Iphone 15 pro     | 128GB, Rose Gold      |"
    ["5"]="| Samsung S21 Ultra | 256GB, Matte Black    |"
)

declare -A prices=(
    ["| Dell laptop       | Intel Core i7, 16 Ram |"]=4000
    ["| Samsung Tv        | 40in, 4k resolution   |"]=8000
    ["| Headphones        | Apple pro, White      |"]=1500
    ["| Iphone 15 pro     | 128GB, Rose Gold      |"]=4500
    ["| Samsung S21 Ultra | 256GB, Matte Black    |"]=5500
)

# Function to greet the customer
greet_customer() {
    local greetings=("Hello, welcome to Electronics Direct!" "Hi there! How can I help you today?" "Good day! Are you looking for something specific?")
    echo "${greetings[$(expr $RANDOM % ${#greetings[@]})]}"
}

# Function to display products
browse_products() {
    echo "We offer a wide range of electronics:"
    for key in "${!products[@]}"; do
        product=${products[$key]}
        price=${prices[$product]}
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
        price=${prices[$product]}
        echo "Product: $product (Price: \$$price)"
        (( total_price += price ))
    done
    echo "-------------------------------"
    echo "Total Price: \$$total_price"
    read -p "How would you like to pay? (cash/credit): " payment_method
    payment_method=$(echo "$payment_method" | tr '[:upper:]' '[:lower:]')
    if [ "$payment_method" == "cash" ] || [ "$payment_method" == "credit" ]; then
        echo "Thank you for your purchase! Your $payment_method payment has been processed."
    else
        echo "Invalid payment method. Please choose cash or credit."
    fi
}

# Main function
main() {
    greet_customer
    browse_products
    select_products
    checkout
}

# Run main function
main
