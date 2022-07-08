#!/bin/bash

patch < patches/st-blinking_cursor-20211116-2f6e597.diff
patch < patches/st-scrollback-0.8.5.diff
patch < patches/st-0.8.5-autocomplete-20220327-230120.diff
patch < patches/st-defaultfontsize-20210225-4ef0cbd.diff
