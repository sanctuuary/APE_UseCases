
convert $Image $Image +append $Image
read -p "Enter Color [default:Cyan]: " Color
Color=${Color:-Cyan}
read -p "Enter FontFamily name [default:Helvetica]: " FontFamily
FontFamily=${FontFamily:-Helvetica}
convert $Image -fill $Color -stroke black -font $FontFamily -pointsize 30 -gravity south -annotate 0 "$Content" $Image
convert $Image -bordercolor $Color -border 80x80 $Image
