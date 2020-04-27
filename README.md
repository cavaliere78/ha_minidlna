## Calibre server for hass.io with optional Calibre-web with ebook-convert
## Description

This addon provide a container for hass.io with [Calibre server](https://calibre-ebook.com/) and [calibre-web](https://github.com/janeczku/calibre-web) so it is possible to use calibre ebook-convert into calibre-web configuration.
The Calibre server is exposed using Ingress.
The Calibre-web is exposed on port 8083.
## Installation

Copy the url of this addon into "Supervisor" -> "Addon Store" -> "Add New repository URL" after install it.

## Configuration Calibre Server

Add-on configuration:

```yaml
ebook_path: /backup/calibre/books/
userdb: /backup/calibre/books/users.sqlite
require_user: true
start_calibre_web: true
```

### Option `ebook_path`

Path to ebook folder used by calibre server

### Option `userdb`

Path to user DB file used by calibre server 	
Note: the easiest way to create this file is use [calibre-server](https://manual.calibre-ebook.com/generated/en/calibre-server.html) 

### Option `require_user`

Use the user DB for calibre server

### Option `start_calibre_web`

Start Calibre_web (HOST:8083) if true


## Configuration Calibre-web
Opend calibre-web page (HOST:8083) and pergorm below steps:
- set the path to calibre (in /backup/calibre/books/)
- use default admin/admin123 user passwd.
- set the path to ebook-convert (/usr/bin/ebook-convert) 
