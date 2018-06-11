{% from "lego/nginx/map.jinja" import nginx with context %}
{{ nginx.configdir }}/sites-available/backend:
  file.managed:
    - user:  root
    - group: root
    - mode: '0644'
    - source: salt://wtw/files/backend
    - template: jinja
    - defaults:
        _wwwdir: {{ nginx.wwwdir }}
    - watch_in:
      - service: nginx-service

{{ nginx.configdir }}/sites-enabled/backend:
  file.symlink:
    - target: {{ nginx.configdir }}/sites-available/backend
    - require:
      - file: {{ nginx.configdir }}/sites-available/backend
    - watch_in:
      - service: nginx-service
