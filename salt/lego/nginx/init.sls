{% from "lego/nginx/map.jinja" import nginx with context %}
{% if nginx.supported -%}
include:
  - .install
  - .service
{% endif -%}
