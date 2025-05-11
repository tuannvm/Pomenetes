<p align="center">
<img src="https://raw.githubusercontent.com/tuannvm/Pomenetes/main/Pomenetes/Assets.xcassets/AppIcon.appiconset/128.png" width="128" height="128"/>
<p>
 
<h1 align="center">Pomenetes (formerly TomatoBar)</h1>
<p align="center">
<img src="https://img.shields.io/github/actions/workflow/status/tuannvm/Pomenetes/main.yml?branch=main"/> <img src="https://img.shields.io/github/downloads/tuannvm/Pomenetes/total"/> <img src="https://img.shields.io/github/v/release/tuannvm/Pomenetes?display_name=tag"/>
</p>

<img
  src="https://github.com/tuannvm/Pomenetes/raw/main/screenshot.png?raw=true"
  alt="Screenshot"
  width="50%"
  align="right"
/>

## Overview
Pomenetes is a modern, fully sandboxed Pomodoro timer for the macOS menu bar. All the essential features are here—configurable work and rest intervals, optional sounds, discreet actionable notifications, global hotkey, and more.

Pomenetes is a direct continuation and enhancement of TomatoBar, with a new name, new icon pipeline, and improved build automation.

## Key Features & Enhancements
- Fully renamed and rebranded as **Pomenetes** (formerly TomatoBar)
- Modernized icon pipeline with automated badge/status overlay support
- New scripts for asset generation and Contents.json automation
- Increases the maximum timer duration to 2 hours/120 minutes
- Adds an option to toggle Do Not Disturb automatically using a shortcut
- Adds sound customization: to use, open the sound folder from settings and place audio files named "windup", "ding" or "ticking" in mp3 or m4a/mp4 (aac/alac) format
- Adds a preset selector with 4 presets you can quickly switch between
- Adds a pause button, keyboard shortcut, and URL
- Adds a skip button, keyboard shortcut, and URL which can skip both work and rest
- Adds an "add a minute" button, keyboard shortcut, and URL
- Extends "stop after break" with "work" and "set" options
- Adds a "start with break" option
- Adds a "start timer on launch" option
- Makes numbers in the settings editable
- Displays current interval on the start/stop button when "Stop after" is disabled
- Turns the volume display into a percentage, adds long tap gesture on the percentage to mute/unmute
- Adds an option for a full screen mask
- Doesn't play sounds when volume is set to zero
- Increases the minimum macOS version requirement to Monterey

## Controlling the timer
Pomenetes can be controlled using `pomenetes://` URLs. To start or stop the timer from the command line, use `open pomenetes://startStop`. To pause or resume use `open pomenetes://pauseResume`. To skip use `open pomenetes://skip`. To add a minute use `open pomenetes://addMinute`

## Older versions
Touch bar integration and older macOS versions (earlier than Big Sur) are supported by TomatoBar versions prior to 3.0

## Licenses
 - Timer sounds are licensed from buddhabeats
 - "macos-focus-mode.shortcut" is taken from the <a href="https://github.com/arodik/macos-focus-mode">macos-focus-mode</a> project under the MIT license.
