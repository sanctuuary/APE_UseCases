
FontFamily=Helvetica
Color=Orange
echo -n "Enter Text:"
read Content
echo -n "Choose Image:"
read Image
convert $Image \
  \( +clone -fill $Color -stroke black -font $FontFamily -pointsize 30 -gravity south -annotate 0 "$Content" \) \
  \( +clone -modulate 100,100,30 \) \
  \( +clone -bordercolor $Color -border 40x40 \) \
-delete 0--2 output.png
