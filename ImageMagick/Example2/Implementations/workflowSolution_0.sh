#!/bin/bash
if [ $# -ne 3 ]
	then
		echo "3 argument(s) expected."
		exit
fi
node539597562=$1
node173381567=$2
node173381566=$3

node579868531='node579868531.png'
convert $node539597562 +level-colors $node173381566, $node579868531

node19522603='node19522603.png'
convert $node579868531 -fuzz 35% -fill black +opaque $node173381567 +fuzz -fill white +opaque black $node19522603

node579870453='node579870453.png'
convert $node579868531 $node19522603 -compose multiply -composite -transparent black $node579870453

node579871414='node579871414.png'
convert $node579868531 $node579870453 -background none -layers flatten $node579871414

echo "1. output is: $node579871414"