Just some dot config files ... nothing special

## dconf
Create an backup of dconf keybindings:
```bash
$ dconf dump /org/gnome/desktop/wm/keybindings/ > dconf/org.gnome.desktop.wm.keybindings.backup
```
Import keybindings into dconf
```bash
$ dconf load /org/gnome/desktop/wm/keybindings/ < dconf/org.gnome.desktop.wm.keybindings.backup
```
