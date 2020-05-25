# ImageMagick: Create a postcard [Example 1]

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer) in an easy and understandable way.

The use case aims to demonstrate the usefulness of the synthesis approach for solving a workflow discovery problem with ImageMagick, an open-source software suite for displaying, creating, converting and modifying images.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, the tools have to be annotated accordingly, and the cooresponding software should be available.
## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar ImageMagick/Sample1/config.json
```
The results of the synthesis would be an executable script:

```text
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
```
A visualizations of workflow can be found in the corresponding folder:

[IMAGE]