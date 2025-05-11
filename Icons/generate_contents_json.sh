#!/bin/bash

#!/bin/bash

# Automatically generate Contents.json for all BarIcon*.imageset folders in ../Pomenetes/Assets.xcassets/

ASSET_DIR="../Pomenetes/Assets.xcassets"

find "$ASSET_DIR" -type d -name 'BarIcon*.imageset' | while read IMAGESET; do
  cat > "$IMAGESET/Contents.json" <<EOF
{
  "images" : [
    {
      "idiom" : "mac",
      "filename" : "icon_16x16.png",
      "scale" : "1x"
    },
    {
      "idiom" : "mac",
      "filename" : "icon_16x16@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "mac",
      "filename" : "icon_16x16@3x.png",
      "scale" : "3x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
EOF
  echo "Generated $IMAGESET/Contents.json"
done
