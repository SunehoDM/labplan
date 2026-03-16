#!/bin/bash
# LabPlan Desktop Widget — Linux
# Works on GNOME, KDE, i3, Sway, XFCE
#
# SETUP:
#   cp widget.html ~/labplan/widget.html
#   cp launch-widget.sh ~/labplan/
#   chmod +x ~/labplan/launch-widget.sh
#
# AUTO-START (GNOME/KDE):
#   Copy labplan-widget.desktop to ~/.config/autostart/

WIDGET="$HOME/labplan/widget.html"

# Adjust X,Y position and W,H size to your screen
POSX=1580
POSY=60
WIDTH=316
HEIGHT=520

# Find browser
BROWSER=""
for b in chromium-browser chromium google-chrome google-chrome-stable; do
  if command -v "$b" &>/dev/null; then BROWSER="$b"; break; fi
done

if [ -z "$BROWSER" ]; then
  echo "No Chromium/Chrome found. Install with: sudo apt install chromium-browser"
  exit 1
fi

"$BROWSER" \
  --app="file://$WIDGET" \
  --window-position="$POSX,$POSY" \
  --window-size="$WIDTH,$HEIGHT" \
  --no-first-run \
  --no-default-browser-check \
  --disable-background-networking \
  --class=LabPlanWidget \
  --name=LabPlanWidget \
  &

echo "LabPlan widget launched at ${POSX},${POSY}"
