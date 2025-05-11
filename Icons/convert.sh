#!/bin/bash -e
# Modernized icon conversion script for Pomenetes
ASSETS_PATH=../Pomenetes/Assets.xcassets
APPICON_SRC=pomenetes.png
APPICON_ICONSET=${ASSETS_PATH}/AppIcon.appiconset
BARICON_SRC=pomenetes.png
BARICON_ICONSET_IDLE=${ASSETS_PATH}/BarIconIdle.imageset
BARICON_ICONSET_WORK=${ASSETS_PATH}/BarIconWork.imageset
BARICON_ICONSET_SHORT_REST=${ASSETS_PATH}/BarIconShortRest.imageset
BARICON_ICONSET_LONG_REST=${ASSETS_PATH}/BarIconLongRest.imageset
BARICON_ICONSET_PAUSE=${ASSETS_PATH}/BarIconPause.imageset
BARICON_FONT_NAME="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
BARICON_FONT_SIZE_BASE=8
BARICON_TEXT_OFFSET_BASE=3

CONVERT="magick"

# Helper: check if required files exist
check_file() {
    if [ ! -f "$1" ]; then
        echo "Error: Missing required file: $1" >&2
        exit 1
    fi
}

check_file "$APPICON_SRC"
check_file "$BARICON_SRC"

# Generate a badge (dot or text) overlay on an icon
# Usage: badge_baricon <base_icon> <output_icon> <badge_text> <badge_color>
badge_baricon() {
    BASE_ICON="$1"
    OUTPUT_ICON="$2"
    BADGE_TEXT="$3"
    BADGE_COLOR="$4"
    # Draw a colored dot in the bottom-right and overlay text if provided
    $CONVERT "$BASE_ICON" \
        -fill "$BADGE_COLOR" -draw "circle 26,26 32,32" \
        -gravity southeast -fill white -pointsize 14 -annotate +2+2 "$BADGE_TEXT" \
        "$OUTPUT_ICON"
}

if [ "$1" == "appicon" ]; then
    ${CONVERT} -resize '!16x16' ${APPICON_SRC} ${APPICON_ICONSET}/icon_16x16.png
    ${CONVERT} -resize '!32x32' ${APPICON_SRC} ${APPICON_ICONSET}/icon_16x16@2x.png
    ${CONVERT} -resize '!32x32' ${APPICON_SRC} ${APPICON_ICONSET}/icon_32x32.png
    ${CONVERT} -resize '!64x64' ${APPICON_SRC} ${APPICON_ICONSET}/icon_32x32@2x.png
    ${CONVERT} -resize '!128x128' ${APPICON_SRC} ${APPICON_ICONSET}/icon_128x128.png
    ${CONVERT} -resize '!256x256' ${APPICON_SRC} ${APPICON_ICONSET}/icon_128x128@2x.png
    ${CONVERT} -resize '!256x256' ${APPICON_SRC} ${APPICON_ICONSET}/icon_256x256.png
    ${CONVERT} -resize '!512x512' ${APPICON_SRC} ${APPICON_ICONSET}/icon_256x256@2x.png
    ${CONVERT} -resize '!512x512' ${APPICON_SRC} ${APPICON_ICONSET}/icon_512x512.png
    ${CONVERT} -resize '!1024x1024' ${APPICON_SRC} ${APPICON_ICONSET}/icon_512x512@2x.png
fi

function convert_baricon() {
    ICONSET_NAME=$1
    ANNOTATE_TEXT=$2

    mkdir -p "${ICONSET_NAME}"
    for SCALE in $(seq 1 3); do
        IMAGE_SIZE="!$((16*SCALE))x$((16*SCALE))"
        POINT_SIZE=$((BARICON_FONT_SIZE_BASE*SCALE))
        OFFSET_X=1
        OFFSET_Y=$((BARICON_TEXT_OFFSET_BASE*SCALE))
        SCALE_NAME="@${SCALE}x"
        if [ ${SCALE} -eq 1 ]; then
            SCALE_NAME=""
        fi
        DEST_NAME="${ICONSET_NAME}/icon_16x16${SCALE_NAME}.png"
        if [ -n "${ANNOTATE_TEXT}" ]; then
            ${CONVERT} "${BARICON_SRC}" -resize "${IMAGE_SIZE}" -background none -font "${BARICON_FONT_NAME}" -pointsize ${POINT_SIZE} \
                -fill transparent -gravity center -annotate +${OFFSET_X}+${OFFSET_Y} "${ANNOTATE_TEXT}" \
                "${DEST_NAME}"
        else
            ${CONVERT} "${BARICON_SRC}" -resize "${IMAGE_SIZE}" -background none "${DEST_NAME}"
        fi
    done
}

if [ "$1" == "baricon" ]; then
    export LC_CTYPE="en_US.UTF-8" # Silences fontconfig warning

    convert_baricon ${BARICON_ICONSET_IDLE} ''
    convert_baricon ${BARICON_ICONSET_WORK} 'W'
    convert_baricon ${BARICON_ICONSET_SHORT_REST} 'R'
    convert_baricon ${BARICON_ICONSET_LONG_REST} 'L'
    convert_baricon ${BARICON_ICONSET_PAUSE} 'P'
fi
