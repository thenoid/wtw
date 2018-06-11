{% from "lego/nginx/map.jinja" import nginx with context %}
{{ nginx.configdir }}/sites-available/default:
  file.absent:
    - watch_in:
      - service: nginx-service

{{ nginx.configdir }}/sites-enabled/default:
  file.absent:
    - watch_in:
      - service: nginx-service
