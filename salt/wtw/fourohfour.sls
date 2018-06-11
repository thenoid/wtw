{% from "lego/nginx/map.jinja" import nginx with context %}
{{ nginx.wwwdir }}/404.html:
  file.managed:
    - user:  root
    - group: root
    - mode: '0644'
    - source: salt://wtw/files/404.html
    - template: jinja
