# ChronoSoft Brand Kit Generator v2 (Precision Vector & 4x Supersampled Raster)
$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

$baseDir = if ($PSScriptRoot) { (Resolve-Path "$PSScriptRoot\..").Path } else { "C:\DEV\chronosoft-branding" }
$dirs = @(
    "$baseDir\svg",
    "$baseDir\png",
    "$baseDir\jpg",
    "$baseDir\ico",
    "$baseDir\avatar",
    "$baseDir\thermal-ticket",
    "$baseDir\compat"
)
foreach ($d in $dirs) {
    if (-not (Test-Path $d)) { New-Item -ItemType Directory -Path $d -Force | Out-Null }
}

# ==============================================================================
# 1. EXACT GEOMETRIC DEFINITION OF THE CHRONOSOFT 'CS' MONOGRAM (817 x 656 space)
# ==============================================================================
$p1SvgPath = "M 511 447 L 388 447 " +
             "C 368 502, 328 534, 275 534 " +
             "C 185 534, 130 448, 130 328 " +
             "C 130 208, 185 125, 275 125 " +
             "C 332 125, 368 156, 375 204 " +
             "C 382 285, 420 348, 550 376 " +
             "C 658 400, 692 418, 692 464 " +
             "C 692 512, 650 541, 590 541 " +
             "C 560 541, 536 532, 519 517 " +
             "C 504 555, 480 588, 449 614 " +
             "C 490 642, 538 656, 590 656 " +
             "C 725 656, 817 576, 817 464 " +
             "C 817 340, 760 298, 650 276 " +
             "C 540 254, 520 236, 518 198 " +
             "C 508 82, 412 0, 275 0 " +
             "C 112 0, 0 138, 0 328 " +
             "C 0 518, 112 656, 275 656 " +
             "C 405 656, 495 572, 511 447 Z"

# Exact sub-path for the lower bowl of S (so the gold transition never touches C!)
$sLowerSvgPath = "M 519 517 " +
                 "C 504 555, 480 588, 449 614 " +
                 "C 490 642, 538 656, 590 656 " +
                 "C 725 656, 817 576, 817 464 " +
                 "L 692 464 " +
                 "C 692 512, 650 541, 590 541 " +
                 "C 560 541, 536 532, 519 517 Z"

# Piece 2 (Upper S cap):
$p2SvgPath = "M 454 39 " +
             "C 492 12, 538 2, 590 2 " +
             "C 708 2, 795 80, 811 193 " +
             "L 681 193 " +
             "C 668 148, 635 124, 590 124 " +
             "C 568 124, 548 129, 532 138 " +
             "C 514 98, 487 64, 454 39 Z"

function New-CSPaths {
    param(
        [float]$OffsetX = 0,
        [float]$OffsetY = 0,
        [float]$Scale = 1.0
    )
    $gp1 = [System.Drawing.Drawing2D.GraphicsPath]::new([System.Drawing.Drawing2D.FillMode]::Winding)
    $gp1.StartFigure()
    $gp1.AddLine(511, 447, 388, 447)
    $gp1.AddBezier(388, 447, 368, 502, 328, 534, 275, 534)
    $gp1.AddBezier(275, 534, 185, 534, 130, 448, 130, 328)
    $gp1.AddBezier(130, 328, 130, 208, 185, 125, 275, 125)
    $gp1.AddBezier(275, 125, 332, 125, 368, 156, 375, 204)
    $gp1.AddBezier(375, 204, 382, 285, 420, 348, 550, 376)
    $gp1.AddBezier(550, 376, 658, 400, 692, 418, 692, 464)
    $gp1.AddBezier(692, 464, 692, 512, 650, 541, 590, 541)
    $gp1.AddBezier(590, 541, 560, 541, 536, 532, 519, 517)
    $gp1.AddBezier(519, 517, 504, 555, 480, 588, 449, 614)
    $gp1.AddBezier(449, 614, 490, 642, 538, 656, 590, 656)
    $gp1.AddBezier(590, 656, 725, 656, 817, 576, 817, 464)
    $gp1.AddBezier(817, 464, 817, 340, 760, 298, 650, 276)
    $gp1.AddBezier(650, 276, 540, 254, 520, 236, 518, 198)
    $gp1.AddBezier(518, 198, 508, 82, 412, 0, 275, 0)
    $gp1.AddBezier(275, 0, 112, 0, 0, 138, 0, 328)
    $gp1.AddBezier(0, 328, 0, 518, 112, 656, 275, 656)
    $gp1.AddBezier(275, 656, 405, 656, 495, 572, 511, 447)
    $gp1.CloseFigure()

    $gpSLower = [System.Drawing.Drawing2D.GraphicsPath]::new([System.Drawing.Drawing2D.FillMode]::Winding)
    $gpSLower.StartFigure()
    $gpSLower.AddBezier(519, 517, 504, 555, 480, 588, 449, 614)
    $gpSLower.AddBezier(449, 614, 490, 642, 538, 656, 590, 656)
    $gpSLower.AddBezier(590, 656, 725, 656, 817, 576, 817, 464)
    $gpSLower.AddLine(817, 464, 692, 464)
    $gpSLower.AddBezier(692, 464, 692, 512, 650, 541, 590, 541)
    $gpSLower.AddBezier(590, 541, 560, 541, 536, 532, 519, 517)
    $gpSLower.CloseFigure()

    $gp2 = [System.Drawing.Drawing2D.GraphicsPath]::new([System.Drawing.Drawing2D.FillMode]::Winding)
    $gp2.StartFigure()
    $gp2.AddBezier(454, 39, 492, 12, 538, 2, 590, 2)
    $gp2.AddBezier(590, 2, 708, 2, 795, 80, 811, 193)
    $gp2.AddLine(811, 193, 681, 193)
    $gp2.AddBezier(681, 193, 668, 148, 635, 124, 590, 124)
    $gp2.AddBezier(590, 124, 568, 124, 548, 129, 532, 138)
    $gp2.AddBezier(514, 98, 487, 64, 454, 39, 454, 39)
    $gp2.CloseFigure()

    # Wait: fix last AddBezier on gp2 so control points are in exact order (532,138 -> 514,98 -> 487,64 -> 454,39)
    $gp2.Dispose()
    $gp2 = [System.Drawing.Drawing2D.GraphicsPath]::new([System.Drawing.Drawing2D.FillMode]::Winding)
    $gp2.StartFigure()
    $gp2.AddBezier(454, 39, 492, 12, 538, 2, 590, 2)
    $gp2.AddBezier(590, 2, 708, 2, 795, 80, 811, 193)
    $gp2.AddLine(811, 193, 681, 193)
    $gp2.AddBezier(681, 193, 668, 148, 635, 124, 590, 124)
    $gp2.AddBezier(590, 124, 568, 124, 548, 129, 532, 138)
    $gp2.AddBezier(532, 138, 514, 98, 487, 64, 454, 39)
    $gp2.CloseFigure()

    $matrix = [System.Drawing.Drawing2D.Matrix]::new()
    $matrix.Rotate(90)
    $matrix.Translate(656, 0, [System.Drawing.Drawing2D.MatrixOrder]::Append)
    $matrix.Scale($Scale, $Scale, [System.Drawing.Drawing2D.MatrixOrder]::Append)
    $matrix.Translate($OffsetX, $OffsetY, [System.Drawing.Drawing2D.MatrixOrder]::Append)
    $gp1.Transform($matrix)
    $gpSLower.Transform($matrix)
    $gp2.Transform($matrix)
    $matrix.Dispose()

    return @{ P1 = $gp1; SLower = $gpSLower; P2 = $gp2 }
}

function Draw-CSMonogram {
    param(
        [System.Drawing.Graphics]$g,
        [float]$OffsetX,
        [float]$OffsetY,
        [float]$Scale,
        [string]$Mode = "color"
    )
    $paths = New-CSPaths -OffsetX $OffsetX -OffsetY $OffsetY -Scale $Scale
    $gp1 = $paths.P1
    $gpSLower = $paths.SLower
    $gp2 = $paths.P2

    if ($Mode -eq "mono-dark") {
        $b = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255, 15, 23, 42))
        $g.FillPath($b, $gp1)
        $g.FillPath($b, $gp2)
        $b.Dispose()
    }
    elseif ($Mode -eq "mono-white") {
        $b = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255, 255, 255, 255))
        $g.FillPath($b, $gp1)
        $g.FillPath($b, $gp2)
        $b.Dispose()
    }
    elseif ($Mode -eq "mono-black") {
        $b = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255, 0, 0, 0))
        $g.FillPath($b, $gp1)
        $g.FillPath($b, $gp2)
        $b.Dispose()
    }
    elseif ($Mode -eq "white-gold") {
        $b1 = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255, 248, 250, 252))
        $ptA = [System.Drawing.PointF]::new($OffsetX + 656 * $Scale, $OffsetY + 450 * $Scale)
        $ptB = [System.Drawing.PointF]::new($OffsetX + 456 * $Scale, $OffsetY + 820 * $Scale)
        $b2 = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
            $ptA, $ptB,
            [System.Drawing.Color]::FromArgb(255, 246, 218, 168),
            [System.Drawing.Color]::FromArgb(255, 217, 155, 78)
        )
        $g.FillPath($b1, $gp1)
        $g.FillPath($b2, $gp2)
        $b1.Dispose(); $b2.Dispose()
    }
    else {
        # 1) Main C-S Ribbon in ChronoSoft Sky Cyan -> Primary Blue -> Deep Ocean Blue
        $ptStart = [System.Drawing.PointF]::new($OffsetX + 616 * $Scale, $OffsetY)
        $ptEnd   = [System.Drawing.PointF]::new($OffsetX + 36 * $Scale, $OffsetY + 817 * $Scale)
        $grad1 = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
            $ptStart, $ptEnd,
            [System.Drawing.Color]::FromArgb(255, 56, 189, 248),  # #38BDF8
            [System.Drawing.Color]::FromArgb(255, 3, 105, 161)    # #0369A1
        )
        $cb1 = [System.Drawing.Drawing2D.ColorBlend]::new(3)
        $cb1.Colors = @(
            [System.Drawing.Color]::FromArgb(255, 56, 189, 248),  # #38BDF8
            [System.Drawing.Color]::FromArgb(255, 2, 132, 199),   # #0284C7
            [System.Drawing.Color]::FromArgb(255, 3, 105, 161)    # #0369A1
        )
        $cb1.Positions = @(0.0, 0.55, 1.0)
        $grad1.InterpolationColors = $cb1
        $g.FillPath($grad1, $gp1)
        $grad1.Dispose()

        # 2) Lower S tail directional gold transition (strictly inside $gpSLower, reaching alpha=0 well before y=464!)
        $ptGoldA = [System.Drawing.PointF]::new($OffsetX + 26 * $Scale, $OffsetY + 430 * $Scale)
        $ptGoldB = [System.Drawing.PointF]::new($OffsetX + 206 * $Scale, $OffsetY + 830 * $Scale)
        $gradGoldLower = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
            $ptGoldA, $ptGoldB,
            [System.Drawing.Color]::FromArgb(255, 242, 204, 140),
            [System.Drawing.Color]::FromArgb(0, 2, 132, 199)
        )
        $gradGoldLower.WrapMode = [System.Drawing.Drawing2D.WrapMode]::TileFlipXY
        $cbGold = [System.Drawing.Drawing2D.ColorBlend]::new(5)
        $cbGold.Colors = @(
            [System.Drawing.Color]::FromArgb(255, 242, 204, 140),
            [System.Drawing.Color]::FromArgb(245, 232, 186, 115),
            [System.Drawing.Color]::FromArgb(140, 175, 168, 135),
            [System.Drawing.Color]::FromArgb(0, 2, 132, 199),
            [System.Drawing.Color]::FromArgb(0, 2, 132, 199)
        )
        $cbGold.Positions = @(0.0, 0.22, 0.44, 0.65, 1.0)
        $gradGoldLower.InterpolationColors = $cbGold
        $g.FillPath($gradGoldLower, $gpSLower)
        $gradGoldLower.Dispose()

        # 3) Upper S Arch Cap in matching Champagne Gold -> Warm Amber Gradient
        $pt2Start = [System.Drawing.PointF]::new($OffsetX + 656 * $Scale, $OffsetY + 450 * $Scale)
        $pt2End   = [System.Drawing.PointF]::new($OffsetX + 461 * $Scale, $OffsetY + 815 * $Scale)
        $grad2 = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
            $pt2Start, $pt2End,
            [System.Drawing.Color]::FromArgb(255, 246, 218, 168),
            [System.Drawing.Color]::FromArgb(255, 212, 148, 72)
        )
        $cb2 = [System.Drawing.Drawing2D.ColorBlend]::new(3)
        $cb2.Colors = @(
            [System.Drawing.Color]::FromArgb(255, 246, 218, 168), # #F6DAA8
            [System.Drawing.Color]::FromArgb(255, 234, 186, 112), # #EABA70
            [System.Drawing.Color]::FromArgb(255, 212, 148, 72)   # #D49448
        )
        $cb2.Positions = @(0.0, 0.55, 1.0)
        $grad2.InterpolationColors = $cb2
        $g.FillPath($grad2, $gp2)
        $grad2.Dispose()
    }

    $gp1.Dispose()
    $gpSLower.Dispose()
    $gp2.Dispose()
}

# Helper to draw "ChronoSoft" with 100% native kerning even in bicolor mode!
function Draw-ChronoSoftText {
    param(
        [System.Drawing.Graphics]$g,
        [float]$CenterX,
        [float]$TopY,
        [float]$EmSize,
        [string]$TextMode = "dark", # "dark", "white", "black", "bicolor-dark", "bicolor-white"
        [bool]$AlignLeft = $false
    )
    $ff = [System.Drawing.FontFamily]::new("Segoe UI")
    $style = [int][System.Drawing.FontStyle]::Bold
    $sf = [System.Drawing.StringFormat]::new([System.Drawing.StringFormat]::GenericTypographic)

    # Create full path for "ChronoSoft" (single string = 100% native kerning)
    $tpFull = [System.Drawing.Drawing2D.GraphicsPath]::new()
    $tpFull.AddString("ChronoSoft", $ff, $style, $EmSize, [System.Drawing.PointF]::new(0, 0), $sf)
    $bounds = $tpFull.GetBounds()

    # Also measure "Chrono" alone to know the exact X split between 'o' and 'S'
    $tpChrono = [System.Drawing.Drawing2D.GraphicsPath]::new()
    $tpChrono.AddString("Chrono", $ff, $style, $EmSize, [System.Drawing.PointF]::new(0, 0), $sf)
    $bChrono = $tpChrono.GetBounds()
    $splitLocalX = $bChrono.X + $bChrono.Width + ($EmSize * 0.012)
    $tpChrono.Dispose()

    $tx = if ($AlignLeft) { $CenterX - $bounds.X } else { $CenterX - ($bounds.Width / 2.0) - $bounds.X }
    $ty = $TopY - $bounds.Y
    $m = [System.Drawing.Drawing2D.Matrix]::new()
    $m.Translate($tx, $ty)
    $tpFull.Transform($m)
    $m.Dispose()

    $splitX = $splitLocalX + $tx

    if ($TextMode -in @("dark", "white", "black")) {
        $color = switch ($TextMode) {
            "dark"  { [System.Drawing.Color]::FromArgb(255, 15, 23, 42) }    # #0F172A
            "white" { [System.Drawing.Color]::FromArgb(255, 248, 250, 252) } # #F8FAFC
            "black" { [System.Drawing.Color]::FromArgb(255, 0, 0, 0) }
        }
        $b = [System.Drawing.SolidBrush]::new($color)
        $g.FillPath($b, $tpFull)
        $b.Dispose()
    }
    else {
        $c1 = if ($TextMode -eq "bicolor-dark") { [System.Drawing.Color]::FromArgb(255, 15, 23, 42) } else { [System.Drawing.Color]::FromArgb(255, 248, 250, 252) }
        $c2 = if ($TextMode -eq "bicolor-dark") { [System.Drawing.Color]::FromArgb(255, 2, 132, 199) } else { [System.Drawing.Color]::FromArgb(255, 56, 189, 248) }

        $br1 = [System.Drawing.SolidBrush]::new($c1)
        $br2 = [System.Drawing.SolidBrush]::new($c2)

        $oldClip = $g.Clip
        $g.SetClip([System.Drawing.RectangleF]::new(-1000, -1000, $splitX + 1000, 10000))
        $g.FillPath($br1, $tpFull)
        $g.SetClip([System.Drawing.RectangleF]::new($splitX, -1000, 20000, 10000))
        $g.FillPath($br2, $tpFull)
        $g.Clip = $oldClip

        $br1.Dispose(); $br2.Dispose()
    }

    $tpFull.Dispose()
    $sf.Dispose()
    $ff.Dispose()
}

function Render-Supersampled {
    param(
        [int]$Width,
        [int]$Height,
        [int]$SS = 3,
        [scriptblock]$DrawAction
    )
    $bigW = $Width * $SS
    $bigH = $Height * $SS
    $bigBmp = [System.Drawing.Bitmap]::new($bigW, $bigH, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($bigBmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

    & $DrawAction $g $SS

    $g.Dispose()

    $outBmp = [System.Drawing.Bitmap]::new($Width, $Height, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $gOut = [System.Drawing.Graphics]::FromImage($outBmp)
    $gOut.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $gOut.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $gOut.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $gOut.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $gOut.DrawImage($bigBmp, 0, 0, $Width, $Height)
    $gOut.Dispose()
    $bigBmp.Dispose()
    return $outBmp
}

function Save-JpgHighQuality {
    param(
        [System.Drawing.Bitmap]$TransparentBmp,
        [System.Drawing.Color]$BgColor,
        [string]$OutPath
    )
    $jpgBmp = [System.Drawing.Bitmap]::new($TransparentBmp.Width, $TransparentBmp.Height, [System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
    $g = [System.Drawing.Graphics]::FromImage($jpgBmp)
    $g.Clear($BgColor)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($TransparentBmp, 0, 0, $TransparentBmp.Width, $TransparentBmp.Height)
    $g.Dispose()

    $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
    $ep = [System.Drawing.Imaging.EncoderParameters]::new(1)
    $ep.Param[0] = [System.Drawing.Imaging.EncoderParameter]::new([System.Drawing.Imaging.Encoder]::Quality, [long]98)
    $jpgBmp.Save($OutPath, $codec, $ep)
    $ep.Dispose()
    $jpgBmp.Dispose()
}

# ==============================================================================
# 2. GENERATE PURE VECTOR SVG FILES
# ==============================================================================
$svgDefs = @"
  <defs>
    <linearGradient id="cs-blue-grad" x1="0%" y1="5%" x2="95%" y2="95%">
      <stop offset="0%" stop-color="#38BDF8" />
      <stop offset="55%" stop-color="#0284C7" />
      <stop offset="100%" stop-color="#0369A1" />
    </linearGradient>
    <linearGradient id="cs-bottom-gold" x1="0%" y1="90%" x2="90%" y2="0%">
      <stop offset="0%" stop-color="#F2CC8C" stop-opacity="1" />
      <stop offset="22%" stop-color="#E8BA73" stop-opacity="0.95" />
      <stop offset="44%" stop-color="#AFA887" stop-opacity="0.55" />
      <stop offset="65%" stop-color="#0284C7" stop-opacity="0" />
      <stop offset="100%" stop-color="#0284C7" stop-opacity="0" />
    </linearGradient>
    <linearGradient id="cs-top-gold" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#F6DAA8" />
      <stop offset="55%" stop-color="#EABA70" />
      <stop offset="100%" stop-color="#D49448" />
    </linearGradient>
    <linearGradient id="bg-dark-grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#111C35" />
      <stop offset="50%" stop-color="#0B1222" />
      <stop offset="100%" stop-color="#060913" />
    </linearGradient>
  </defs>
"@

$svgIconColor = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="-40 -40 736 897" width="840" height="1024">
$svgDefs
  <g transform="translate(656, 0) rotate(90)">
    <path d="$p1SvgPath" fill="url(#cs-blue-grad)" />
    <path d="$sLowerSvgPath" fill="url(#cs-bottom-gold)" />
    <path d="$p2SvgPath" fill="url(#cs-top-gold)" />
  </g>
</svg>
"@
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-icon-color.svg", $svgIconColor, [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText("$baseDir\svg\favicon.svg", $svgIconColor, [System.Text.Encoding]::UTF8)

$svgIconMonoDark = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="-40 -40 736 897" width="840" height="1024">
  <g transform="translate(656, 0) rotate(90)">
    <path d="$p1SvgPath" fill="#0F172A" />
    <path d="$p2SvgPath" fill="#0F172A" />
  </g>
</svg>
"@
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-icon-mono-dark.svg", $svgIconMonoDark, [System.Text.Encoding]::UTF8)

$svgIconMonoWhite = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="-40 -40 736 897" width="840" height="1024">
  <g transform="translate(656, 0) rotate(90)">
    <path d="$p1SvgPath" fill="#FFFFFF" />
    <path d="$p2SvgPath" fill="#FFFFFF" />
  </g>
</svg>
"@
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-icon-mono-white.svg", $svgIconMonoWhite, [System.Text.Encoding]::UTF8)

function Get-StackedSvg {
    param([string]$TextColor, [string]$SoftColor = "")
    $softSpan = if ($SoftColor) { "<tspan fill=`"$SoftColor`">Soft</tspan>" } else { "Soft" }
    return @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2263 1321" width="2263" height="1321">
$svgDefs
  <g transform="translate(836, 95) scale(0.90) translate(656, 0) rotate(90)">
    <path d="$p1SvgPath" fill="url(#cs-blue-grad)" />
    <path d="$sLowerSvgPath" fill="url(#cs-bottom-gold)" />
    <path d="$p2SvgPath" fill="url(#cs-top-gold)" />
  </g>
  <text x="1131.5" y="1192" text-anchor="middle" font-family="'Segoe UI', 'Inter', -apple-system, BlinkMacSystemFont, Roboto, sans-serif" font-weight="700" font-size="385" letter-spacing="-4" fill="$TextColor">Chrono$softSpan</text>
</svg>
"@
}
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-stacked-light.svg", (Get-StackedSvg -TextColor "#0F172A"), [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-stacked-dark.svg", (Get-StackedSvg -TextColor "#F8FAFC"), [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-stacked-bicolor-light.svg", (Get-StackedSvg -TextColor "#0F172A" -SoftColor "#0284C7"), [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-stacked-bicolor-dark.svg", (Get-StackedSvg -TextColor "#F8FAFC" -SoftColor "#38BDF8"), [System.Text.Encoding]::UTF8)

function Get-HorizontalSvg {
    param([string]$TextColor, [string]$SoftColor = "")
    $softSpan = if ($SoftColor) { "<tspan fill=`"$SoftColor`">Soft</tspan>" } else { "Soft" }
    return @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2400 680" width="2400" height="680">
$svgDefs
  <g transform="translate(140, 87) scale(0.62) translate(656, 0) rotate(90)">
    <path d="$p1SvgPath" fill="url(#cs-blue-grad)" />
    <path d="$sLowerSvgPath" fill="url(#cs-bottom-gold)" />
    <path d="$p2SvgPath" fill="url(#cs-top-gold)" />
  </g>
  <text x="655" y="458" font-family="'Segoe UI', 'Inter', -apple-system, BlinkMacSystemFont, Roboto, sans-serif" font-weight="700" font-size="292" letter-spacing="-3" fill="$TextColor">Chrono$softSpan</text>
</svg>
"@
}
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-horizontal-light.svg", (Get-HorizontalSvg -TextColor "#0F172A"), [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-horizontal-dark.svg", (Get-HorizontalSvg -TextColor "#F8FAFC"), [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-horizontal-bicolor-light.svg", (Get-HorizontalSvg -TextColor "#0F172A" -SoftColor "#0284C7"), [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-horizontal-bicolor-dark.svg", (Get-HorizontalSvg -TextColor "#F8FAFC" -SoftColor "#38BDF8"), [System.Text.Encoding]::UTF8)

$svgAvatarDark = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" width="1024" height="1024">
$svgDefs
  <rect width="1024" height="1024" rx="224" fill="url(#bg-dark-grad)" />
  <g transform="translate(223, 152) scale(0.88) translate(656, 0) rotate(90)">
    <path d="$p1SvgPath" fill="url(#cs-blue-grad)" />
    <path d="$sLowerSvgPath" fill="url(#cs-bottom-gold)" />
    <path d="$p2SvgPath" fill="url(#cs-top-gold)" />
  </g>
</svg>
"@
[System.IO.File]::WriteAllText("$baseDir\svg\chronosoft-avatar-dark.svg", $svgAvatarDark, [System.Text.Encoding]::UTF8)

# ==============================================================================
# 3. GENERATE SUPERSAMPLED PNG & HIGH-QUALITY JPG FILES
# ==============================================================================
$bgWhite = [System.Drawing.Color]::FromArgb(255, 255, 255, 255)
$bgDark  = [System.Drawing.Color]::FromArgb(255, 9, 13, 22)

# --- 3A. CORTO / ISOTIPO (1024x840) ---
foreach ($mode in @("color", "mono-dark", "mono-white", "mono-black")) {
    $bmp = Render-Supersampled -Width 1024 -Height 840 -SS 3 -DrawAction {
        param($g, $ss)
        Draw-CSMonogram -g $g -OffsetX (197.1 * $ss) -OffsetY (27.8 * $ss) -Scale (0.96 * $ss) -Mode $mode
    }
    $bmp.Save("$baseDir\png\chronosoft-corto-$mode.png", [System.Drawing.Imaging.ImageFormat]::Png)
    if ($mode -eq "color") {
        Save-JpgHighQuality -TransparentBmp $bmp -BgColor $bgWhite -OutPath "$baseDir\jpg\chronosoft-corto-light.jpg"
        Save-JpgHighQuality -TransparentBmp $bmp -BgColor $bgDark  -OutPath "$baseDir\jpg\chronosoft-corto-dark.jpg"
    }
    $bmp.Dispose()
}

# --- 3B. APILADO / VERTICAL (2263x1321 - Exact replacement for BLACK_LOGO & WHITE_LOGO) ---
foreach ($v in @(
    @{ Name = "vertical-light";         TextMode = "dark";          Bg = $bgWhite; Compat = @("BLACK_LOGO.png") },
    @{ Name = "vertical-dark";          TextMode = "white";         Bg = $bgDark;  Compat = @("WHITE_LOGO.png", "DARK_LOGO.png") },
    @{ Name = "vertical-bicolor-light"; TextMode = "bicolor-dark";  Bg = $bgWhite; Compat = @() },
    @{ Name = "vertical-bicolor-dark";  TextMode = "bicolor-white"; Bg = $bgDark;  Compat = @() }
)) {
    $bmpV = Render-Supersampled -Width 2263 -Height 1321 -SS 2 -DrawAction {
        param($g, $ss)
        Draw-CSMonogram -g $g -OffsetX (836 * $ss) -OffsetY (95 * $ss) -Scale (0.90 * $ss) -Mode "color"
        Draw-ChronoSoftText -g $g -CenterX (1131.5 * $ss) -TopY (908 * $ss) -EmSize (355 * $ss) -TextMode $v.TextMode
    }
    $bmpV.Save("$baseDir\png\chronosoft-$($v.Name).png", [System.Drawing.Imaging.ImageFormat]::Png)
    foreach ($cName in $v.Compat) {
        $bmpV.Save("$baseDir\compat\$cName", [System.Drawing.Imaging.ImageFormat]::Png)
    }
    Save-JpgHighQuality -TransparentBmp $bmpV -BgColor $v.Bg -OutPath "$baseDir\jpg\chronosoft-$($v.Name).jpg"
    $bmpV.Dispose()
}

# --- 3C. LARGO / HORIZONTAL (2400x680 - Generous margins, native kerning!) ---
foreach ($v in @(
    @{ Name = "largo-light";         TextMode = "dark";          Monogram = "color";      Bg = $bgWhite },
    @{ Name = "largo-dark";          TextMode = "white";         Monogram = "color";      Bg = $bgDark  },
    @{ Name = "largo-bicolor-light"; TextMode = "bicolor-dark";  Monogram = "color";      Bg = $bgWhite },
    @{ Name = "largo-bicolor-dark";  TextMode = "bicolor-white"; Monogram = "color";      Bg = $bgDark  },
    @{ Name = "largo-mono-dark";     TextMode = "dark";          Monogram = "mono-dark";  Bg = $bgWhite },
    @{ Name = "largo-mono-white";    TextMode = "white";         Monogram = "mono-white"; Bg = $bgDark  }
)) {
    $bmpH = Render-Supersampled -Width 2400 -Height 680 -SS 2 -DrawAction {
        param($g, $ss)
        Draw-CSMonogram -g $g -OffsetX (140 * $ss) -OffsetY (87 * $ss) -Scale (0.62 * $ss) -Mode $v.Monogram
        Draw-ChronoSoftText -g $g -CenterX (645 * $ss) -TopY (215 * $ss) -EmSize (282 * $ss) -TextMode $v.TextMode -AlignLeft $true
    }
    $bmpH.Save("$baseDir\png\chronosoft-$($v.Name).png", [System.Drawing.Imaging.ImageFormat]::Png)
    Save-JpgHighQuality -TransparentBmp $bmpH -BgColor $v.Bg -OutPath "$baseDir\jpg\chronosoft-$($v.Name).jpg"
    $bmpH.Dispose()
}

# --- 3D. AVATARES (Square, Rounded App Icon, Circle - Smooth Band-Free Gradients) ---
function New-RoundedRectPath {
    param([float]$x, [float]$y, [float]$w, [float]$h, [float]$r)
    $d = $r * 2
    $gp = [System.Drawing.Drawing2D.GraphicsPath]::new()
    $gp.AddArc($x, $y, $d, $d, 180, 90)
    $gp.AddArc($x + $w - $d, $y, $d, $d, 270, 90)
    $gp.AddArc($x + $w - $d, $y + $h - $d, $d, $d, 0, 90)
    $gp.AddArc($x, $y + $h - $d, $d, $d, 90, 90)
    $gp.CloseFigure()
    return $gp
}

foreach ($theme in @("dark", "light", "gradient")) {
    foreach ($shape in @("square", "rounded", "circle")) {
        $bmpAv = Render-Supersampled -Width 1024 -Height 1024 -SS 3 -DrawAction {
            param($g, $ss)
            $size = 1024 * $ss
            $clipPath = [System.Drawing.Drawing2D.GraphicsPath]::new()
            if ($shape -eq "square") {
                $clipPath.AddRectangle([System.Drawing.RectangleF]::new(0, 0, $size, $size))
            } elseif ($shape -eq "rounded") {
                $clipPath.Dispose()
                $clipPath = New-RoundedRectPath -x 0 -y 0 -w $size -h $size -r (224 * $ss)
            } else {
                $clipPath.AddEllipse(0, 0, $size, $size)
            }

            $oldClip = $g.Clip
            $g.SetClip($clipPath)

            if ($theme -eq "dark") {
                $bgGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
                    [System.Drawing.PointF]::new(0, 0),
                    [System.Drawing.PointF]::new($size, $size),
                    [System.Drawing.Color]::FromArgb(255, 19, 31, 58), # #131F3A
                    [System.Drawing.Color]::FromArgb(255, 7, 11, 20)   # #070B14
                )
                $cbBg = [System.Drawing.Drawing2D.ColorBlend]::new(3)
                $cbBg.Colors = @(
                    [System.Drawing.Color]::FromArgb(255, 19, 31, 58),
                    [System.Drawing.Color]::FromArgb(255, 12, 19, 36),
                    [System.Drawing.Color]::FromArgb(255, 7, 11, 20)
                )
                $cbBg.Positions = @(0.0, 0.5, 1.0)
                $bgGrad.InterpolationColors = $cbBg
                $g.FillPath($bgGrad, $clipPath)
                $bgGrad.Dispose()

                Draw-CSMonogram -g $g -OffsetX (223 * $ss) -OffsetY (152 * $ss) -Scale (0.88 * $ss) -Mode "color"
            }
            elseif ($theme -eq "light") {
                $bgGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
                    [System.Drawing.PointF]::new(0, 0),
                    [System.Drawing.PointF]::new($size, $size),
                    [System.Drawing.Color]::FromArgb(255, 255, 255, 255),
                    [System.Drawing.Color]::FromArgb(255, 241, 245, 249)
                )
                $g.FillPath($bgGrad, $clipPath)
                $bgGrad.Dispose()
                Draw-CSMonogram -g $g -OffsetX (223 * $ss) -OffsetY (152 * $ss) -Scale (0.88 * $ss) -Mode "color"
            }
            else {
                $bgGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
                    [System.Drawing.PointF]::new(0, 0),
                    [System.Drawing.PointF]::new($size, $size),
                    [System.Drawing.Color]::FromArgb(255, 2, 132, 199),
                    [System.Drawing.Color]::FromArgb(255, 15, 23, 42)
                )
                $g.FillPath($bgGrad, $clipPath)
                $bgGrad.Dispose()
                Draw-CSMonogram -g $g -OffsetX (223 * $ss) -OffsetY (152 * $ss) -Scale (0.88 * $ss) -Mode "white-gold"
            }

            $g.Clip = $oldClip
            $clipPath.Dispose()
        }
        $bmpAv.Save("$baseDir\avatar\chronosoft-avatar-$theme-$shape-1024.png", [System.Drawing.Imaging.ImageFormat]::Png)
        if ($shape -eq "square") {
            $bgJpg = if ($theme -eq "light") { $bgWhite } else { $bgDark }
            Save-JpgHighQuality -TransparentBmp $bmpAv -BgColor $bgJpg -OutPath "$baseDir\avatar\chronosoft-avatar-$theme-1024.jpg"
            Save-JpgHighQuality -TransparentBmp $bmpAv -BgColor $bgJpg -OutPath "$baseDir\jpg\chronosoft-avatar-$theme.jpg"
        }
        $bmp512 = [System.Drawing.Bitmap]::new(512, 512, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
        $g512 = [System.Drawing.Graphics]::FromImage($bmp512)
        $g512.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $g512.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $g512.DrawImage($bmpAv, 0, 0, 512, 512)
        $g512.Dispose()
        $bmp512.Save("$baseDir\avatar\chronosoft-avatar-$theme-$shape-512.png", [System.Drawing.Imaging.ImageFormat]::Png)
        $bmp512.Dispose()
        $bmpAv.Dispose()
    }
}

# --- 3E. SOCIAL BANNER / COVER (1920x1080 HD) ---
foreach ($bTheme in @("dark", "light")) {
    $bmpBan = Render-Supersampled -Width 1920 -Height 1080 -SS 2 -DrawAction {
        param($g, $ss)
        $w = 1920 * $ss; $h = 1080 * $ss
        if ($bTheme -eq "dark") {
            $bgGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
                [System.Drawing.PointF]::new(0, 0),
                [System.Drawing.PointF]::new($w, $h),
                [System.Drawing.Color]::FromArgb(255, 17, 27, 48),
                [System.Drawing.Color]::FromArgb(255, 7, 11, 20)
            )
            $g.FillRectangle($bgGrad, 0, 0, $w, $h)
            $bgGrad.Dispose()
            Draw-CSMonogram -g $g -OffsetX (730 * $ss) -OffsetY (110 * $ss) -Scale (0.70 * $ss) -Mode "color"
            Draw-ChronoSoftText -g $g -CenterX (960 * $ss) -TopY (730 * $ss) -EmSize (210 * $ss) -TextMode "bicolor-white"
        } else {
            $bgGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
                [System.Drawing.PointF]::new(0, 0),
                [System.Drawing.PointF]::new($w, $h),
                [System.Drawing.Color]::FromArgb(255, 255, 255, 255),
                [System.Drawing.Color]::FromArgb(255, 241, 245, 249)
            )
            $g.FillRectangle($bgGrad, 0, 0, $w, $h)
            $bgGrad.Dispose()
            Draw-CSMonogram -g $g -OffsetX (730 * $ss) -OffsetY (110 * $ss) -Scale (0.70 * $ss) -Mode "color"
            Draw-ChronoSoftText -g $g -CenterX (960 * $ss) -TopY (730 * $ss) -EmSize (210 * $ss) -TextMode "bicolor-dark"
        }
    }
    $bmpBan.Save("$baseDir\png\chronosoft-banner-$bTheme-1920x1080.png", [System.Drawing.Imaging.ImageFormat]::Png)
    Save-JpgHighQuality -TransparentBmp $bmpBan -BgColor $bgWhite -OutPath "$baseDir\jpg\chronosoft-banner-$bTheme-1920x1080.jpg"
    $bmpBan.Dispose()
}

# --- 3F. THERMAL TICKET LOGOS (ESC/POS 58mm & 80mm) ---
$bmpTicketStacked = Render-Supersampled -Width 400 -Height 227 -SS 4 -DrawAction {
    param($g, $ss)
    Draw-CSMonogram -g $g -OffsetX (146 * $ss) -OffsetY (8 * $ss) -Scale (0.165 * $ss) -Mode "mono-black"
    Draw-ChronoSoftText -g $g -CenterX (200 * $ss) -TopY (152 * $ss) -EmSize (65 * $ss) -TextMode "black"
}
$bmpTicketStacked.Save("$baseDir\thermal-ticket\chronosoft-ticket-logo.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmpTicketStacked.Save("$baseDir\compat\chronosoft-ticket-logo.png", [System.Drawing.Imaging.ImageFormat]::Png)
Save-JpgHighQuality -TransparentBmp $bmpTicketStacked -BgColor $bgWhite -OutPath "$baseDir\thermal-ticket\chronosoft-ticket-logo.jpg"
$bmpTicketStacked.Dispose()

$bmpTicketHoriz = Render-Supersampled -Width 384 -Height 110 -SS 4 -DrawAction {
    param($g, $ss)
    Draw-CSMonogram -g $g -OffsetX (20 * $ss) -OffsetY (12 * $ss) -Scale (0.105 * $ss) -Mode "mono-black"
    Draw-ChronoSoftText -g $g -CenterX (105 * $ss) -TopY (32 * $ss) -EmSize (43.5 * $ss) -TextMode "black" -AlignLeft $true
}
$bmpTicketHoriz.Save("$baseDir\thermal-ticket\chronosoft-ticket-horizontal.png", [System.Drawing.Imaging.ImageFormat]::Png)
Save-JpgHighQuality -TransparentBmp $bmpTicketHoriz -BgColor $bgWhite -OutPath "$baseDir\thermal-ticket\chronosoft-ticket-horizontal.jpg"
$bmpTicketHoriz.Dispose()

# ==============================================================================
# 4. GENERATE MULTI-RESOLUTION .ICO FILES (16, 32, 48, 64, 128, 256 px)
# ==============================================================================
function Save-MultiSizeIco {
    param(
        [System.Drawing.Bitmap]$SourceBmp256,
        [string]$OutIcoPath
    )
    $sizes = @(16, 32, 48, 64, 128, 256)
    $pngChunks = @()
    foreach ($sz in $sizes) {
        $b = [System.Drawing.Bitmap]::new($sz, $sz, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
        $g = [System.Drawing.Graphics]::FromImage($b)
        $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        $g.DrawImage($SourceBmp256, 0, 0, $sz, $sz)
        $g.Dispose()

        $ms = [System.IO.MemoryStream]::new()
        $b.Save($ms, [System.Drawing.Imaging.ImageFormat]::Png)
        $pngChunks += ,($ms.ToArray())
        $ms.Dispose()
        $b.Dispose()
    }

    $fs = [System.IO.File]::Open($OutIcoPath, [System.IO.FileMode]::Create)
    $bw = [System.IO.BinaryWriter]::new($fs)
    $bw.Write([uint16]0)
    $bw.Write([uint16]1)
    $bw.Write([uint16]$sizes.Count)

    $offset = 6 + (16 * $sizes.Count)
    for ($i = 0; $i -lt $sizes.Count; $i++) {
        $sz = $sizes[$i]
        $bytes = $pngChunks[$i]
        $wByte = if ($sz -eq 256) { [byte]0 } else { [byte]$sz }
        $hByte = if ($sz -eq 256) { [byte]0 } else { [byte]$sz }
        $bw.Write($wByte)
        $bw.Write($hByte)
        $bw.Write([byte]0)
        $bw.Write([byte]0)
        $bw.Write([uint16]1)
        $bw.Write([uint16]32)
        $bw.Write([uint32]$bytes.Length)
        $bw.Write([uint32]$offset)
        $offset += $bytes.Length
    }
    for ($i = 0; $i -lt $sizes.Count; $i++) {
        $bw.Write($pngChunks[$i])
    }
    $bw.Flush()
    $bw.Close()
    $fs.Close()
}

$bmpFavTrans = Render-Supersampled -Width 256 -Height 256 -SS 4 -DrawAction {
    param($g, $ss)
    $sc = (256.0 * 0.92) / 817.0
    $ox = (256.0 - (656.0 * $sc)) / 2.0
    $oy = (256.0 - (817.0 * $sc)) / 2.0
    Draw-CSMonogram -g $g -OffsetX ($ox * $ss) -OffsetY ($oy * $ss) -Scale ($sc * $ss) -Mode "color"
}
Save-MultiSizeIco -SourceBmp256 $bmpFavTrans -OutIcoPath "$baseDir\ico\favicon.ico"
Save-MultiSizeIco -SourceBmp256 $bmpFavTrans -OutIcoPath "$baseDir\compat\favicon.ico"
foreach ($fSz in @(16, 32, 48, 64, 180, 192, 512)) {
    $fb = Render-Supersampled -Width $fSz -Height $fSz -SS 3 -DrawAction {
        param($g, $ss)
        $sc = ($fSz * 0.92) / 817.0
        $ox = ($fSz - (656.0 * $sc)) / 2.0
        $oy = ($fSz - (817.0 * $sc)) / 2.0
        Draw-CSMonogram -g $g -OffsetX ($ox * $ss) -OffsetY ($oy * $ss) -Scale ($sc * $ss) -Mode "color"
    }
    $name = switch ($fSz) {
        180 { "apple-touch-icon.png" }
        192 { "android-chrome-192x192.png" }
        512 { "android-chrome-512x512.png" }
        default { "favicon-${fSz}x${fSz}.png" }
    }
    $fb.Save("$baseDir\ico\$name", [System.Drawing.Imaging.ImageFormat]::Png)
    $fb.Dispose()
}
$bmpFavTrans.Dispose()

$bmpFavDarkBadge = [System.Drawing.Bitmap]::new("$baseDir\avatar\chronosoft-avatar-dark-rounded-512.png")
$bmpFavDark256 = [System.Drawing.Bitmap]::new(256, 256, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$gD = [System.Drawing.Graphics]::FromImage($bmpFavDark256)
$gD.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$gD.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$gD.DrawImage($bmpFavDarkBadge, 0, 0, 256, 256)
$gD.Dispose()
Save-MultiSizeIco -SourceBmp256 $bmpFavDark256 -OutIcoPath "$baseDir\ico\chronosoft-badge-dark.ico"
$bmpFavDark256.Dispose(); $bmpFavDarkBadge.Dispose()

$bmpFavLightBadge = [System.Drawing.Bitmap]::new("$baseDir\avatar\chronosoft-avatar-light-rounded-512.png")
$bmpFavLight256 = [System.Drawing.Bitmap]::new(256, 256, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$gL = [System.Drawing.Graphics]::FromImage($bmpFavLight256)
$gL.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$gL.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$gL.DrawImage($bmpFavLightBadge, 0, 0, 256, 256)
$gL.Dispose()
Save-MultiSizeIco -SourceBmp256 $bmpFavLight256 -OutIcoPath "$baseDir\ico\chronosoft-badge-light.ico"
$bmpFavLight256.Dispose(); $bmpFavLightBadge.Dispose()

Write-Output "Brand Kit v2 generated successfully!"
