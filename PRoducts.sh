#!/bin/bash

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
