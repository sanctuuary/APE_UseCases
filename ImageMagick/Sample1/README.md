# ImageMagick: Create a postcard [Sample1]

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
read -p "Enter Color [default:Cyan]: " Color
Color=${Color:-Cyan}
convert $Image -bordercolor $Color -border 40x40 $Image
convert $Image $Image +append $Image
read -p "Enter FontFamily name [default:Helvetica]: " FontFamily
FontFamily=${FontFamily:-Helvetica}
convert $Image -fill $Color -stroke black -font $FontFamily -pointsize 60 -gravity north -annotate 0 "$Content" $Image
```
Visualizations of workflows can be found in the corresponding folder:

[IMAGE]