#!/bin/bash
cd $(dirname "$0")
chmod 777 EventAssembler/Tools/*
cp FE8_clean.gba TeleshackII.gba
cd ./Text
python3 ../Tools/MacOS/textprocess text_buildfile.txt --parser-exe ../Event Assembler/Tools/ParseFile
cd ..
cd ./Maps
python3 ../Tools/tmx2ea-master/tmx2ea.py -s MasterMapInstaller.event
cd ..
mono EventAssembler/ColorzCore_FixPath.exe A FE8 -output:TeleshackII.gba -input:ROMBuildfile.event
python3 Tools/MacOS/ups make FE8_clean.gba TeleshackII.gba TeleshackII.ups
