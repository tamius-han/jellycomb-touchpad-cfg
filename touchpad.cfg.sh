#!/bin/bash

# Change any options here

tapping_enabled=1
tapping_enabled_default=1
tapping_drag_lock_enabled=1
tapping_drag_lock_enabled_default=1
middle_emulation_enabled=1
middle_emulation_enabled_default=1

# Config options end here


# get touchpad ID
touchpad_id=`xinput list | grep Touchpad | cut -d$'\t' -f 2 | cut -d '=' -f 2`


# get code IDs (I've tried that once, they seem to change between reboots on my laptop?)
code_tapping_enabled=`xinput list-props $touchpad_id | grep "Tapping Enabled (" | cut -d '(' -f 2 | cut -d ')' -f 1`
code_tapping_drag_lock_enabled=`xinput list-props $touchpad_id | grep "Tapping Drag Lock Enabled (" | cut -d '(' -f 2 | cut -d ')' -f 1`
code_middle_emulation_enabled=`xinput list-props $touchpad_id | grep "Middle Emulation Enabled (" | cut -d '(' -f 2 | cut -d ')' -f 1`

# this is here in case we'll ever attempt to set defaults
# code_tapping_enabled_default=`xinput list-props $touchpad_id | grep "Tapping Enabled Default (" | cut -d '(' -f 2 | cut -d ')' -f 1`
# code_tapping_drag_lock_enabled_default=`xinput list-props $touchpad_id | grep "Tapping Drag Lock Enabled Default (" | cut -d '(' -f 2 | cut -d ')' -f 1`
# code_middle_emulation_enabled_default=`xinput list-props $touchpad_id | grep "Middle Emulation Enabled Default (" | cut -d '(' -f 2 | cut -d ')' -f 1`


# set options
xinput set-prop $touchpad_id $code_tapping_enabled $tapping_enabled
xinput set-prop $touchpad_id $code_tapping_drag_lock_enabled $tapping_drag_lock_enabled
xinput set-prop $touchpad_id $code_middle_emulation_enabled $middle_emulation_enabled
# xinput set-prop $touchpad_id $code_tapping_enabled_default $tapping_enabled_default
# xinput set-prop $touchpad_id $code_tapping_drag_lock_enabled_default $tapping_drag_lock_enabled_default
# xinput set-prop $touchpad_id $code_middle_emulation_enabled_default $tapping_middle_emulation_enabled_default