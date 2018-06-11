{% from "lego/nginx/map.jinja" import nginx with context %}
include:
  - .fourohfour
{{ nginx.configdir }}/sites-available/frontend:
  file.managed:
    - user:  root
    - group: root
    - mode: '0644'
    - source: salt://wtw/files/frontend
    - template: jinja
    - defaults:
        _wwwdir: {{ nginx.wwwdir }}
    - watch_in:
      - service: nginx-service

{{ nginx.configdir }}/sites-enabled/frontend:
  file.symlink:
    - target: {{ nginx.configdir }}/sites-available/frontend
    - require:
      - file: {{ nginx.configdir }}/sites-available/frontend
    - watch_in:
      - service: nginx-service
