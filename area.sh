#!/bin/bash

echo ""
echo ""
echo "-----------This is an area calculator for a rectangle-----------"
echo ""
echo ""

# the while loop is used in order to create a much easier way of allowing the user to repeat the whole script should they choose to
while true; do
#this line allows the user to select the unit of measurement they are entering in and stores it in the variable measurement
  read -p "Would you like to enter in Inches(i) or Centimeters(c)? " measurement

  if [[ "$measurement" != "c" ]] && [[ "$measurement" != "C" ]] && [[ "$measurement" != "i" ]] && [[ "$measurement" != "I" ]]; then
  #what this does is make sure that from the value entered above it is only c and i otherwise you continue with the program so you are prompted again
    echo "That is not a valid input. Please try again. The allowed inputs are i for inches and c for centimetres."
    continue
    #continues the prompt or displays it again
  fi

  if [[ "$measurement" == "c" ]] || [[ "$measurement" == "C" ]]; then
  #this is for the input above, it displays the different prompts based on the input it has just recieved
    read -p "Please enter the width of the rectangle in centimeters: " rWidthcm
    while ! [[ "$rWidthcm" =~ ^[0-9]*\.?[0-9]+$ ]]; do
      echo "Invalid input. Please enter a number."
      read -p "Please enter the width of the rectangle in centimeters: " rWidthcm
    done
    read -p "Please enter the height of the rectangle in centimeters: " rHeightcm
    while ! [[ "$rHeightcm" =~ ^[0-9]*\.?[0-9]+$ ]]; do
      echo "Invalid input. Please enter a number."
      read -p "Please enter the height of the rectangle in centimeters: " rHeightcm
    done
  else
  #implies inches becuase we removed any doubt of any other letter being inputed using the if statement
    read -p "Please enter the width of the rectangle in inches: " rWidthin
    while ! [[ "$rWidthin" =~ ^[0-9]*\.?[0-9]+$ ]]; do
      echo "Invalid input. Please enter a number."
      read -p "Please enter the width of the rectangle in inches: " rWidthin
    done
    read -p "Please enter the height of the rectangle in inches: " rHeightin
    while ! [[ "$rHeightin" =~ ^[0-9]*\.?[0-9]+$ ]]; do
      echo "Invalid input. Please enter a number."
      read -p "Please enter the height of the rectangle in inches: " rHeightin
    done
  fi

  if [[ "$measurement" == "c" ]] || [[ "$measurement" == "C" ]]; then
  #this block does the basic calculation for the centimeter to meter area or centimeter to inches area
    area_m=$(echo "scale=4; $rWidthcm/100*$rHeightcm/100" | bc -l)
    area_i=$(echo "scale=4; $rWidthcm/2.54*$rHeightcm/2.54" | bc -l)
    #bc -l is used to allow for floating numbers instead of using expr
  elif [[ "$measurement" == "i" ]] || [[ "$measurement" == "I" ]]; then
  #this block lets the program calculate the conversion from inches to meters only because inches to inches requires no conversion
    area_m=$(echo "scale=4; $rWidthin/39.37*$rHeightin/39.37" | bc -l)
    area_i=$(echo "scale=4; $rWidthin*$rHeightin" | bc -l)
  fi

  read -p "Would you like to see the area in Square Meters(m) or in Square Inches(i)? " displayUnit
  #this line reads the input and stores it in the variable named displayUnit
 
  if [[ "$displayUnit" == "m" ]] || [[ "$displayUnit" == "M" ]]; then
  #all this does is just display the area in eother unit of display
    echo "The area in meters is $area_m m^2"
  elif [[ "$displayUnit" == "i" ]] || [[ "$displayUnit" == "I" ]]; then
    echo "The area in inches is $area_i in^2"
  else
  #this will display only if the displayUnit variable is invalid so it reprompts the user to enter their values again with valid prompts
    echo "That is not a valid input. Please enter your values again. The only allowed inputs for the display area are i for inches or m for meters."
    continue
  fi

  read -p "Would you like to enter new data or quit? Enter y to repeat or any other key to quit: " repeat
  #this read the user's input and issues it to the repeat variable and then is used to allow the user to go through the program again

  if [[ "$repeat" != "y" ]] || [[ "$repeat" == "Y" ]]; then
    break
  fi
done