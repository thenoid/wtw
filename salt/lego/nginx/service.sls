{% from "lego/nginx/map.jinja" import nginx with context %}

include:
{#  - nginx.config #}
  - .install

nginx-service:
  service.running:
    - name: {{ nginx.service }}
    - enable: True
    - watch:
      - pkg: nginx-pkg
{#      - file: {{ nginx.config }} #}
