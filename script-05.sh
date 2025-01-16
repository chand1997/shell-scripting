#!/bin/bash

#How to use array

MOVIES=("kgf" "kantara" "tagaru")


echo "First movie in array is : ${MOVIES[0]}"
echo "Second movie in array is : ${MOVIES[1]}"
echo "Third movie in array is : ${MOVIES[2]}"

#how to access all movies at once

echo "Movies : ${MOVIES[@]}"

