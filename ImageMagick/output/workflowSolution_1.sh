
echo -n "Choose Image:"
read Image
Color=Orange
echo -n "Enter Text:"
read Content
FontFamily=Helvetica
convert $Image \
  \( +clone -bordercolor $Color -border 40x40 \) \
  \( +clone -fill $Color -stroke black -font $FontFamily -pointsize 30 -gravity south -annotate 0 "$Content" \) \
  \( +clone -modulate 100,100,30 \) \
-delete 0--2 output.png
