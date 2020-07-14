#!/bin/bash
if [ $# -ne 3 ]
	then
		echo "3 argument(s) expected."
		exit
fi
node539597562=$1
node173381567=$2
node173381566=$3

node19521642='node19521642.png'
convert $node539597562 -fuzz 35% -fill black +opaque $node173381567 +fuzz -fill white +opaque black $node19521642

node579869492='node579869492.png'
convert $node539597562 $node19521642 -compose multiply -composite -transparent black $node579869492

node579870453='node579870453.png'
convert $node539597562 $node579869492 -background none -layers flatten $node579870453

node579871414='node579871414.png'
convert $node579870453 +level-colors $node173381566, $node579871414

echo "1. output is: $node579871414"