#!/bin/bash
ROOT=$(dirname "$(realpath "$0")")
if [ $1 == "--help" ];
then
echo Create tileset distribution for Cataclysm: Bright Nights
echo --------------------------------------------------------
echo Command syntax: sh distribution.sh \<tileset\>
echo --------------------------------------------
echo The currently supported tilesets are:
echo  - UltimateCataclysm \(ultica\)
echo  - RetroDays \(retrodays\)
elif [[ ( $1 == "ultica" || $1 == "UltimateCataclysm" ) ]];
then
TILESET="UltimateCataclysm"
elif [[ ( $1 == "retrodays" || $1 == "RetroDays" ) ]];
then
TILESET="RetroDays"
else
echo ERROR: Unsupported tileset \"$1\"
exit 1
fi
if [ ! -d "$ROOT/dist/$TILESET" ];
then
mkdir dist/$TILESET
if [ $? -ne 0 ]; 
then
echo ERROR: Failed to create distribution directory for $TILESET
exit 1
fi
echo Composing $TILESET tileset...
else
rm -rf dist/$TILESET
if [ $? -ne 0 ]; 
then
echo ERROR: Unable to clean distribution directory dist/$TILESET
exit 1
fi
echo Recomposing $TILESET tileset...
fi
python tools/compose.py gfx/$TILESET dist/$TILESET
