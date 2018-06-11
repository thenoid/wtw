{% from "lego/nginx/map.jinja" import nginx with context %}
{% if nginx.supported -%}
include:
  - lego/nginx
  - .backend
  - .frontend
  - .nuke_default
{% endif -%}
