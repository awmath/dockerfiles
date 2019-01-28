FROM nginx:alpine

RUN cd /usr/share/nginx && \
      wget -O - https://github.com/keeweb/keeweb/archive/gh-pages.tar.gz | tar xz && \
      rm keeweb-gh-pages/CNAME && mv keeweb-gh-pages/* html/ && \
      wget -O - https://github.com/keeweb/keeweb-plugins/archive/master.tar.gz | tar xz && \
      mv keeweb-plugins-master/docs html/plugins && \
      rm html/plugins/CNAME && rm -rf keeweb-plugins-master
