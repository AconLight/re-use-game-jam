#!/bin/bash

# update mod https://github.com/eDonnes124/Town-Of-Us-R script

GDIR="${HOME}/.steam/steam/steamapps/common/Among Us" # steam game dir
WINPFX="${HOME}/.steam/steam/steamapps/compatdata/945360/pfx" # wine prefix for among us

read -p "START THE GAME NORMAL BEFORE APPLYING THE MOD! (Press Enter after Among Us is running)"

echo "checking release..."
VERLINK=$(curl -s https://api.github.com/repos/eDonnes124/Town-Of-Us-R/releases/latest \
    | grep "browser_download_url.*zip" \
    | cut -d : -f 2,3 \
    | tr -d '\" ')

echo "getting release from ${VERLINK}..."
wget -q ${VERLINK}
mkdir tmpdir

echo "unzipping release..."
unzip -o -qq *.zip -d tmpdir
#find tmpdir/*/* -maxdepth 0 -exec mv -f {} "${GDIR}" \;
find tmpdir/*/* -maxdepth 0 -exec rsync -a --remove-source-files {} "${GDIR}" \;

# cleanup
rm -f $(basename ${VERLINK})
rm -rf tmpdir/

# winhttp enable
echo "adding winhttp dll..."
WINEPREFIX="${WINPFX}" wine reg add 'HKCU\Software\Wine\DllOverrides' /v winhttp /d native,builtin /f &> /dev/null
