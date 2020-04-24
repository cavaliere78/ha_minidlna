## Calibreweb with ebook-convert and calibre-server for hass.io
## Description

This addon provide a container for hass.io with [calibre-web](https://github.com/janeczku/calibre-web) and [calibre](https://calibre-ebook.com/) so it is possible to use calibre ebook-convert into calibre-web configuration, also it provide calibre-server.
 ![Supports armv7 Architecture][armv7-shield]

## Installation

Copy the url of this addon into "Supervisor" -> "Addon Store" -> "Add New repository URL" after install it.

## Configuration Calibre-web
opend calibre-web page (HOST:8083) and pergorm below steps:
- set the path to calibre (in /backup/calibre/books/)
- use default admin/admin123 user passwd.
- set the path to ebook-convert (/usr/bin/ebook-convert) 

## Configuration Calibre Server

Add-on configuration:

```yaml
start_calibre_server: true
ebook_path: /backup/calibre/books/
certfile: fullchain.pem
keyfile: privkey.pem
require_certificate: false
userdb: /backup/calibre/books/users.sqlite
require_user: true
```

### Option `start_calibre_server`

Start the calibre server (HOST:8080) if true
	
### Option `ebook_path`

Path to ebook folder used by calibre server
	
### Option `certfile`	

SSL certificate

### Option `keyfile`	

SSL private key

### Option `require_certificate`

Use https for calibre server if true

### Option `userdb`

Path to user DB file used by calibre server 	
Note: the easiest way to create this file is use [calibre-server](https://manual.calibre-ebook.com/generated/en/calibre-server.html) 

### Option `require_user`

Use the user DB for calibre server
