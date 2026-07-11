Add-Type -AssemblyName System.Drawing
$iconDir = "C:\source\JustTalk\src-tauri\icons"

$bmp256 = [System.Drawing.Bitmap]::FromFile("$iconDir\icon.png")
$bmp256 = New-Object System.Drawing.Bitmap($bmp256, 256, 256)

$ms = New-Object System.IO.MemoryStream
$writer = New-Object System.IO.BinaryWriter($ms)

# ICO header: reserved(2) + type(2) + count(2)
$writer.Write([UInt16]0)  # reserved
$writer.Write([UInt16]1)  # type = ICO
$writer.Write([UInt16]1)  # count = 1 image

# ICO entry: w, h, colors, reserved, planes, bpp, size, offset
$writer.Write([Byte]0)    # width (0 = 256)
$writer.Write([Byte]0)    # height (0 = 256)
$writer.Write([Byte]0)    # color palette
$writer.Write([Byte]0)    # reserved
$writer.Write([UInt16]1)  # color planes
$writer.Write([UInt16]32) # bits per pixel
$pngMs = New-Object System.IO.MemoryStream
$bmp256.Save($pngMs, [System.Drawing.Imaging.ImageFormat]::Png)
$pngBytes = $pngMs.ToArray()
$pngMs.Close()
$writer.Write([UInt32]$pngBytes.Length) # size
$writer.Write([UInt32]22)               # offset (header 6 + entry 16)
$writer.Write($pngBytes)
$writer.Flush()

[System.IO.File]::WriteAllBytes("$iconDir\icon.ico", $ms.ToArray())
$ms.Close()
$bmp256.Dispose()

Write-Host "icon.ico created: $([math]::Round((Get-Item "$iconDir\icon.ico").Length/1KB,1)) KB"
