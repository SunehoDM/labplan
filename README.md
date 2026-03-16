# LabPlan

A personal lab weekly planner — month/day calendar, task list, 11 color-coded categories, Google Calendar sync, and a liquid-glass desktop widget.

## Live App
**`https://SunehoDM.github.io/labplan`** (after deploy)

---

## Quick Deploy (5 min)

```bash
git clone https://github.com/SunehoDM/labplan
cd labplan
git add .
git commit -m "init"
git push origin main
```

Then: **GitHub repo → Settings → Pages → Source: main branch → Save**

Done. Live in ~2 minutes.

---

## Install as App

| Platform | How |
|----------|-----|
| Windows / Linux | Chrome → address bar install icon → Install |
| iPhone / iPad | Safari → Share → Add to Home Screen |
| Android | Chrome → menu → Add to Home Screen |

---

## Desktop Widget

### Windows
1. Copy `windows/launch-widget.bat` + `widget.html` to same folder
2. Edit `--window-position=X,Y` in the .bat for your screen
3. Double-click to launch
4. Auto-start: `Win+R` → `shell:startup` → paste shortcut

### Linux
```bash
mkdir -p ~/labplan
cp widget.html ~/labplan/
cp linux/launch-widget.sh ~/labplan/
chmod +x ~/labplan/launch-widget.sh
~/labplan/launch-widget.sh
```
Auto-start: add `~/labplan/launch-widget.sh` to your DE's startup apps, or create `~/.config/autostart/labplan.desktop` (see `linux/autostart-example.desktop`).

---

## Google Calendar Sync

1. Go to [console.cloud.google.com](https://console.cloud.google.com) → New Project → **LabPlan**
2. APIs & Services → Enable → **Google Calendar API**
3. Credentials → Create → OAuth Client ID → Web Application
   - Authorized JS origin: `https://SunehoDM.github.io`
   - Redirect URI: `https://SunehoDM.github.io/labplan/`
4. Copy the Client ID
5. Open `index.html`, find:
   ```js
   const GCAL_CLIENT_ID = 'YOUR_GOOGLE_CLIENT_ID';
   ```
   Replace with your Client ID, save, push.
6. In app: sidebar → **Connect Google Calendar** → sign in → done

Every saved entry auto-pushes to GCal, color-coded by category.

---

## Categories

| Icon | Category | Color |
|------|----------|-------|
| flask | Experiment | purple |
| envelope | Mail | blue |
| book | JC | red |
| document | Paper | yellow |
| bar chart | Analysis | teal |
| building | Official | orange |
| person | Personal | pink |
| grid | Plan Experiment | indigo |
| people | Meet someone | cyan |
| bell | Reminder | amber |
| flask | Make Reagents | green |

---

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `N` | New entry |
| `Esc` | Close modal |

---

## Data Storage

- Stored in browser `localStorage` — persists on that device
- GCal sync handles cross-device visibility (events show in Google Calendar on all devices)
- Widget reads from same localStorage as the main app on the same machine
