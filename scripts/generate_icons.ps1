Add-Type -AssemblyName System.Drawing

$iconDir = "C:\source\JustTalk\src-tauri\icons"
$resDir = "C:\source\JustTalk\src-tauri\resources"

$bmp = New-Object System.Drawing.Bitmap(512, 512)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = 'HighQuality'
$g.TextRenderingHint = 'AntiAliasGridFit'

# Background: dark
$g.Clear([System.Drawing.Color]::FromArgb(13, 13, 13))

# Gradient rectangle for JT badge
$rect = New-Object System.Drawing.Rectangle(56, 96, 400, 320)
$brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
    (New-Object System.Drawing.Point(0, 0)),
    (New-Object System.Drawing.Point(512, 512)),
    [System.Drawing.Color]::FromArgb(0, 229, 160),
    [System.Drawing.Color]::FromArgb(124, 58, 237)
)
$g.FillRectangle($brush, $rect)

# "JT" text centered
$font = New-Object System.Drawing.Font('Segoe UI', 160, [System.Drawing.FontStyle]::Bold)
$sf = New-Object System.Drawing.StringFormat
$sf.Alignment = 'Center'
$sf.LineAlignment = 'Center'
$g.DrawString('JT', $font, [System.Drawing.Brushes]::Black, $rect, $sf)

$g.Dispose()

# Save all sizes
$bmp.Save("$iconDir\icon.png", [System.Drawing.Imaging.ImageFormat]::Png)

$sizes = @(32, 64, 128, 256)
foreach ($s in $sizes) {
    $r = New-Object System.Drawing.Bitmap($bmp, $s, $s)
    $name = if ($s -eq 128) { "128x128.png" } elseif ($s -eq 128) { "128x128@2x.png" } else { "${s}x${s}.png" }
    if ($s -eq 128) {
        $r.Save("$iconDir\128x128.png", [System.Drawing.Imaging.ImageFormat]::Png)
        $r2 = New-Object System.Drawing.Bitmap($bmp, 256, 256)
        $r2.Save("$iconDir\128x128@2x.png", [System.Drawing.Imaging.ImageFormat]::Png)
        $r2.Dispose()
    } else {
        $r.Save("$iconDir\${s}x${s}.png", [System.Drawing.Imaging.ImageFormat]::Png)
    }
    $r.Dispose()
}

# Square logos for Windows
$sqSizes = @(30, 44, 71, 89, 107, 142, 150, 284, 310)
foreach ($s in $sqSizes) {
    $r = New-Object System.Drawing.Bitmap($bmp, $s, $s)
    $r.Save("$iconDir\Square${s}x${s}Logo.png", [System.Drawing.Imaging.ImageFormat]::Png)
    $r.Dispose()
}

# Store logo
$store = New-Object System.Drawing.Bitmap($bmp, 50, 50)
$store.Save("$iconDir\StoreLogo.png", [System.Drawing.Imaging.ImageFormat]::Png)
$store.Dispose()

# Logo
$logo = New-Object System.Drawing.Bitmap($bmp, 256, 256)
$logo.Save("$iconDir\logo.png", [System.Drawing.Imaging.ImageFormat]::Png)
$logo.Dispose()

# Tray icons (small versions for taskbar)
# Dark theme tray icons (light icon on dark taskbar)
foreach ($pair in @(
    @("tray_idle.png", "idle"),
    @("tray_recording.png", "rec"),
    @("tray_transcribing.png", "trans")
)) {
    $tray = New-Object System.Drawing.Bitmap(32, 32)
    $tg = [System.Drawing.Graphics]::FromImage($tray)
    $tg.SmoothingMode = 'HighQuality'
    $tg.Clear([System.Drawing.Color]::Transparent)
    $brush2 = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Point(0, 0)),
        (New-Object System.Drawing.Point(32, 32)),
        [System.Drawing.Color]::FromArgb(0, 229, 160),
        [System.Drawing.Color]::FromArgb(124, 58, 237)
    )
    if ($pair[1] -eq "rec") {
        # Red tint for recording
        $brush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 80, 80))
    } elseif ($pair[1] -eq "trans") {
        # Amber tint for transcribing
        $brush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 180, 40))
    }
    $tg.FillEllipse($brush2, 2, 2, 28, 28)
    $tf = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
    $tsf = New-Object System.Drawing.StringFormat
    $tsf.Alignment = 'Center'
    $tsf.LineAlignment = 'Center'
    $tg.DrawString('JT', $tf, [System.Drawing.Brushes]::Black, (New-Object System.Drawing.RectangleF(2, 2, 28, 28)), $tsf)
    $tg.Dispose()
    $tray.Save("$resDir\$($pair[0])", [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Host "Tray: $($pair[0])"
    
    # Dark variants for light theme taskbar
    $darkName = $pair[0] -replace '\.png', '_dark.png'
    $tray.Save("$resDir\$darkName", [System.Drawing.Imaging.ImageFormat]::Png)
    
    $tray.Dispose()
}

# Also create recording.png, transcribing.png, handy.png for Linux/colored theme
Copy-Item "$resDir\tray_recording.png" "$resDir\recording.png" -Force
Copy-Item "$resDir\tray_transcribing.png" "$resDir\transcribing.png" -Force
Copy-Item "$resDir\tray_idle.png" "$resDir\handy.png" -Force

$bmp.Dispose()
Write-Host "All icons regenerated successfully"
