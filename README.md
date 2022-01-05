# parallel-kicad-5.1

Simple way to keep Kicad 5.1 working while having the current v6 working.

# Procedure

1. Use apt to install the lated Kicad version (which is v6 right now)
2. Add the alternative PPA for 5.1 (5.1.12 is the current version of it)
3. Use the current repo to install 5.1.* locally in a folder

```bash
sudo add-apt-repository ppa:kicad/kicad-5.1-releases
sudo apt update
```

Run the following script to install Kicad 5.1.* locally in this folder.
```
./install_kicad.5.1.12.sh
```

To launch it, open a terminal and load this script
```
source load_kicad_5.1.sh
```

And then launch kicad from the terminal
```
kicad
```