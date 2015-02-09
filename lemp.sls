---
 # add the nginx repository to yum repo
 {% if grains['OS'] == 'Redhat'%}
    pkgrepo.managed:
      - humanname: nginx
      - baseurl: baseurl=http://nginx.org/packages/OS/OSRELEASE/$basearch/
      - gpgcheck: 0
      - enabled: 1

      {%endif%}
      # install nginx
    nginx:
    pkg:
      {%if grains['Os'] == 'Redhat'%}

      - name: nginx
      {%elif grains['OS'] == "Ubuntu"%}
      - name: nginx
      {%endif%}
  # install maridb
   mariadb:
     {%if grains['OS'] == "Ubuntu"%}
     /etc/apt/sources.list.d/mariadb.list:
         file:
           - append:
             - text:
               -  deb http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main
               -  deb-src http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main

         {%endif%}
     pkg:
       {%if grains['Os'] == 'Redhat'%}
       - name: mariadb-server
       {%elif grains['OS'] == "Ubuntu"%}
       - name: nginx
       {%endif%}
    # install php

    php:
      pkg:
        {%if grains['Os'] == 'Redhat'%}
        - name: epel-release
        - name: php-fpm
        - name: php
        - name: php-mysql

        {%elif grains['OS'] == "Ubuntu"%}
        - name: php5-fpm
        - name: php5-mysql
        {%endif%}
