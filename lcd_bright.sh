#!/bin/bash
#
# lcd_bright.sh v0.1a
#
# Mark H. Harris
# 08/31/2017
#
# Usage:  lcd_bright.sh <U|D> <value>
#

MODE=`echo $1 |tr '[a-z]' '[A-Z]'`
LCDVALUE=`cat /sys/class/backlight/intel_backlight/brightness`

if [ "$MODE" = "U" ]
then
  NEWVALUE=$(( $LCDVALUE + $2 ))
  if [ $NEWVALUE -le 150 ]
  then
      echo $NEWVALUE > /sys/class/backlight/intel_backlight/brightness
      echo $NEWVALUE
  else
      echo $LCDVALUE
  fi
else
  NEWVALUE=$(( $LCDVALUE - $2 ))
  if [ $NEWVALUE -gt 0 ]
  then
      echo $NEWVALUE > /sys/class/backlight/intel_backlight/brightness
      echo $NEWVALUE
  else
      echo $LCDVALUE
  fi
fi
