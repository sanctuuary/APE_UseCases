#!/bin/bash
if [ $# -ne 3 ]
	then
		echo "3 argument(s) expected."
		exit
fi
node539597562=$1
node539597563=$2
node539597564=$3

node579868531='node579868531.png'
convert $node539597564 -modulate 100,100,30 $node579868531

node579869492='node579869492.png'
convert $node539597563 $node579868531 +append $node579869492

read -p "Enter Color [default:Cyan]: " node173378685
node173378685=${node173378685:-Cyan}

node19524525='node19524525.png'
convert $node539597562 -fuzz 44% -fill white +opaque $node173378685 -fill black +opaque white $node19524525

node579872375='node579872375.png'
convert $node579869492 $node19524525 -compose Multiply -composite $node579872375

echo "1. output is: $node579872375"