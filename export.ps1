[array]$SIZES = Import-Csv -Path .\export.csv
[string]$PREFIX = 'logo'

ForEach ($SIZE in $SIZES) {
  [int]$WIDTH = $SIZE.WIDTH
  [int]$HEIGHT = $SIZE.HEIGHT
  [string]$SOURCE = $SIZE.SOURCE
  [string]$TARGET = $SIZE.TARGET
  inkscape `
    --without-gui `
    --export-png="./images/${TARGET}-${WIDTH}x${HEIGHT}.png" `
    --export-width=$WIDTH `
    --export-height=$HEIGHT `
    --export-area-page `
    --file="./source/${PREFIX}-${SOURCE}.svg"
}

ForEach ($SIZE in ('large', 'small', 'wide', 'twitter-banner', 'wide-url-no-icon')) {
  inkscape `
    --without-gui `
    --export-plain-svg="./images/${PREFIX}-${SIZE}.svg" `
    --file="./source/${PREFIX}-${SIZE}.svg"
}

magick `
  ./images/favicon-*.png `
  ./favicon.ico
