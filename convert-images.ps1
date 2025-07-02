# PowerShell-скрипт для конвертации SVG в PNG/JPG для соцсетей
# Требуется установленный Inkscape (https://inkscape.org/ru/release/)

function Check-Inkscape {
    $inkscape = Get-Command inkscape -ErrorAction SilentlyContinue
    if (-not $inkscape) {
        Write-Host "Inkscape не найден! Пожалуйста, скачайте и установите: https://inkscape.org/ru/release/"
        exit 1
    }
}

Check-Inkscape

# Конвертация og-image.svg → og-image.png
inkscape images/og-image.svg --export-type=png --export-filename=images/og-image.png -w 1200 -h 630

# Конвертация twitter-image.svg → twitter-image.png
inkscape images/twitter-image.svg --export-type=png --export-filename=images/twitter-image.png -w 1200 -h 600

# Конвертация vk-image.svg → vk-image.jpg (качество 90)
inkscape images/vk-image.svg --export-type=jpg --export-filename=images/vk-image.jpg -w 1200 -h 630 --export-background="#fff" --export-jpeg-quality=90

Write-Host "Готово! PNG/JPG-файлы созданы в папке images/. Теперь закоммитьте их и задеплойте на GitHub Pages." 