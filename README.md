## MiniDLNA for hass.io
## Description

This addon provide a container for hass.io with MiniDLNA

## Installation

Copy the url of this addon into "Supervisor" -> "Addon Store" -> "Add New repository URL" after install it. 


## Configuration 
```yaml
media_dir: V,/media;/share
```

### Option `media_dir`

Set this to the directory you want scanned.
* if you want multiple directories, you can add ';' before each new directory
  (eg. media_dir: /media;/share)
* if you want to restrict a media_dir to specific content types, you
  can prepend the types, followed by a comma, to the directory:
  + "A" for audio  (eg. media_dir: A,/home/jmaggard/Music)
  + "V" for video  (eg. media_dir: V,/home/jmaggard/Videos)
  + "P" for images (eg. media_dir: P,/home/jmaggard/Pictures)
  + "PV" for pictures and video (eg. media_dir:PV,/home/jmaggard/digital_camera)
