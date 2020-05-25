# ImageMagick: More constraints [Example 2]

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer) in an easy and understandable way.

The use case aims to demonstrate the usefulness of the synthesis approach for solving a workflow discovery problem with ImageMagick, an open-source software suite for displaying, creating, converting and modifying images.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, the tools have to be annotated accordingly, and the cooresponding software should be available.
## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar ImageMagick/Sample2/config.json
```
The results of the synthesis would be an executable script:

```text
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
```
A visualization of the workflow can be found in the corresponding folder:

[IMAGE]