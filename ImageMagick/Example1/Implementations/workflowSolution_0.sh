#!/bin/bash
if [ $# -ne 2 ]
	then
		echo "2 argument(s) expected."
		exit
fi
node579867570=$1
node1548883689=$2

read -p "Enter Color [default:Cyan]: " node173380607
node173380607=${node173380607:-Cyan}

read -p "Enter FontFamily name [default:Helvetica]: " node1695080704
node1695080704=${node1695080704:-Helvetica}

node579870453='node579870453.png'
node579867570_height=$(($(identify -format '%h' $node579867570)/8))
convert $node579867570 -fill $node173380607 -stroke black -font $node1695080704 -pointsize $node579867570_height -gravity north -annotate 0 "$node1548883689" $node579870453

node579871414='node579871414.png'
node579870453_height=$(($(identify -format '%h' $node579870453)/10))
convert $node579870453 -bordercolor $node173380607 -border $node579870453_height $node579871414

echo "1. output is: $node579871414"