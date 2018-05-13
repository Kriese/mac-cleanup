#!/bin/bash

# Clean User Cache
echo "cleaning user cache and logs"
rm -rf ~/Library/Caches/*
rm -rf ~/Library/logs/*
echo "done"

#ios photo caches
echo "cleaning IOS photo caches"
rm -rf /Users/Feng/Pictures/iPhoto\ Library/iPod\ Photo\ Cache/*
echo "done"

#application caches
echo "cleaning application caches"
for x in $(ls ~/Library/Containers/)
do
    echo "cleaning ~/Library/Containers/$x/Data/Library/Caches/"
    rm -rf ~/Library/Containers/$x/Data/Library/Caches/*
    echo "done"
done

echo 'Cleanup iOS Applications'
rm -rfv ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* &>/dev/null

echo "Clean System Log Files"
sudo rm -rfv /private/var/log/asl/*.asl &>/dev/null
sudo rm -rfv /Library/Logs/DiagnosticReports/* &>/dev/null
sudo rm -rfv /Library/Logs/Adobe/* &>/dev/null
rm -rfv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/* &>/dev/null
rm -rfv ~/Library/Logs/CoreSimulator/* &>/dev/null
echo "done"

echo 'Clear Adobe Cache Files'
if [ -d ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/ ]
	then
	sudo rm -rfv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null
	echo "done";
	else echo "nothing to clean";
fi

echo 'Cleanup XCode'
rm -rfv ~/Library/Developer/Xcode/DerivedData/* &>/dev/null
rm -rfv ~/Library/Developer/Xcode/Archives/* &>/dev/null

echo "Cleanup Homebrew Cache"
brew cleanup --force -s &>/dev/null
brew cask cleanup &>/dev/null
rm -rfv /Library/Caches/Homebrew/* &>/dev/null
brew tap --repair &>/dev/null

echo "Cleanup gems"
gem cleanup &>/dev/null

#memory cleanup
echo "Purge"
sudo purge
echo "done"

#system caches
echo "cleaning system caches"
sudo rm -rf /Library/Caches/*
echo "done"

#system logs
echo "cleaning system logs from /Library/logs"
sudo rm -rf /Library/logs/*
sudo rm -rf /var/log/*
echo "done"

echo "cleaning from /private/var/folders"
sudo rm -rf /private/var/folders/*
echo "done"

#clean Trashes
echo "Empty Trash on all mounted volumes"
sudo rm -rfv /Volumes/*/.Trashes &>/dev/null
sudo rm -rfv ~/.Trash &>/dev/null

echo "finished"
