cat << 'EOF' > array.sh
# Shebang Header
#!/usr/bin/env bash

array=('First' 'Second' 'Third')
array+=('Fourth') # Appends element
echo ${array[@]}
# First Second Third Fourth

unset array[3] # Removes element at index 3, (Fourth)
echo ${array[@]}
# First Second Third

# Accesing elements through its position
echo ${array[0]} # First
echo ${array[1]} # Second
echo ${array[2]} # Third

# Count of array
echo ${#array[@]}
# 3
EOF
bash array.sh