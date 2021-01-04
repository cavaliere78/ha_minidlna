## MiniDLNA for hass.io
## Description

This addon provide a container for hass.io with MiniDLNA

## Installation

Copy the url of this addon into "Supervisor" -> "Addon Store" -> "Add New repository URL" after install it. 


## Configuration 
```yaml
media_dir: V,/media;/share
options: -d
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

  
### Option `options`
Usage:
                [-d] [-v] [-f config_file] [-p port]
                [-i network_interface] [-u uid_to_run_as]
                [-t notify_interval] [-P pid_filename]
                [-s serial] [-m model_number]
                [-w url] [-r] [-R] [-L] [-S] [-V] [-h]

Notes:
        Notify interval is in seconds. Default is 895 seconds.
        Default pid file is /var/run/minidlna/minidlna.pid.
        With -d minidlna will run in debug mode (not daemonize).
        -w sets the presentation url. Default is http address on port 80
        -v enables verbose output
        -h displays this text
        -r forces a rescan
        -R forces a rebuild
        -L do not create playlists
        -S changes behaviour for systemd
        -V print the version number