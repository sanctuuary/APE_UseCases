#!/bin/bash
if [ $# -ne 1 ]
	then
		echo "1 argument(s) expected."
		exit
fi
node2077172800=$1

node876449703='result.ps'
gmt pscoast -R2.81/50.52/7.84/53.75r -JM6i -P -W0p,white -K > $node876449703
gmt pscoast -R -J -Gdarkseagreen2 -N1p/thinner -Df -K -O -P >> $node876449703
node876448742=$node876449703
gmt pscoast -R -J -N1p/thinner -Df -O -K >> $node876448742
node876447781=$node876448742
"Error. Tool 'pscoast_W' is missing the execution code."
gmt pscoast -R -J -N1p/thinner -Df -K -O >> $node876446820
node876445859=$node876446820
gmt psxy -R -J -O -V -Wthinnest $node2077172800 >> $node876445859
node876444898=$node876445859
gmt psxy -R -J -O -Sc0.05 -Gred -Wthinnest $node2077172800 >> $node876444898
node876443937=$node876444898
"Error. Tool 'psbasemap_U' is missing the execution code."
"Error. Tool 'psbasemap_Bt' is missing the execution code."
"Error. Tool 'gs' is missing the execution code."
