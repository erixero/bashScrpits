#!/usr/bin/env bash
declare -A map
map[first]="1"
map[second]="2"
map[third]="3"
map[four]="4"
echo ${!map[@]}

unset map[first] # Delete entry
echo ${map[@]} # show all the values

echo ${!map[@]} # show all keys

echo ${map[second]} # show the value of first: 2

echo ${#map[@]} # show the number of elements in the map: 3
