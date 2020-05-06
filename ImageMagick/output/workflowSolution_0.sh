
FontFamily=Helvetica
Color=Blue
echo -n "Choose Image:"
read Image
echo -n "Enter Text:"
read Content
convert $Image \
  \( +clone -fill $Color -stroke black -font $FontFamily -pointsize 60 -gravity north -annotate 0 "$Content" \) \
  \( +clone -modulate 100,100,30 \) \
  \( +clone -bordercolor $Color -border 40x40 \) \
-delete 0--2 output.png
