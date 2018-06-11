{% from "lego/nginx/map.jinja" import nginx with context %}
nginx-pkg:
  pkg.installed:
    - name: {{ nginx.pkg }}
    - install_recommends: False
