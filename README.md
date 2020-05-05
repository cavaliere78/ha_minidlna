## Calibre-web for hass.io with optional Calibre server with ebook-convert
## Description

This addon provide a container for hass.io with [Calibre-web](https://github.com/janeczku/calibre-web) and [Calibre server](https://calibre-ebook.com/) so it is possible to use calibre ebook-convert into calibre-web configuration.
The Calibre-web is exposed using Ingress.
The Calibre server is exposed on port 8080.

## Installation

Copy the url of this addon into "Supervisor" -> "Addon Store" -> "Add New repository URL" after install it. 
Copy your Calibre library in share/calibre/books/

## Configuration Calibre Server
Add-on configuration:

```yaml
proxy_user_header: X-User
proxy_user: admin
start_calibre_server: true
ebook_path: /share/calibre/books/
userdb: /share/calibre/books/users.sqlite
require_user: true
```


### Option `proxy_user_header`

Header used by Ingress for Calibre-web authentication. 
Set a custom value and use it in Calibre-web configuration:
Check the box marked Allow Reverse Proxy Authentication and then fill in the text box that appears with the proxy_user_header value.

### Option `proxy_user`

User used by Infress for Calibre-web authentication. 
Set a custom user. The user must exist in the Calibre-web database.

### Option `start_calibre_server`

Start Calibre server (HOST:8080) if true

### Option `ebook_path`

Path to ebook folder used by calibre server

### Option `userdb`

Path to user DB file used by calibre server 	
Note: the easiest way to create this file is use [calibre-server](https://manual.calibre-ebook.com/generated/en/calibre-server.html) 

### Option `require_user`

Use the user DB for calibre server

## Configuration Calibre-web
Open Calibre-web page (HOST:8083) and perform below steps:
- set the path to calibre (/share/calibre/books/)
- use default admin/admin123 user passwd.
- set the path to ebook-convert (/usr/bin/ebook-convert) 
- set Allow Reverse Proxy Authentication and then fill in the text box that appears with the proxy_user_header value (X-User)
