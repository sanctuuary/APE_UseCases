
read -p "Enter Color [default:Cyan]: " Color
Color=${Color:-Cyan}
convert $Image -bordercolor $Color -border 40x40 $Image
read -p "Enter FontFamily name [default:Helvetica]: " FontFamily
FontFamily=${FontFamily:-Helvetica}
convert $Image -fill $Color -stroke black -font $FontFamily -pointsize 60 -gravity north -annotate 0 "$Content" $Image
