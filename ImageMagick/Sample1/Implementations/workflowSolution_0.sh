
read -p "Enter FontFamily name [default:Helvetica]: " FontFamily
FontFamily=${FontFamily:-Helvetica}
read -p "Enter Color [default:Cyan]: " Color
Color=${Color:-Cyan}
convert $Image -fill $Color -stroke black -font $FontFamily -pointsize 30 -gravity south -annotate 0 "$Content" $Image
convert $Image -bordercolor $Color -border 40x40 $Image
