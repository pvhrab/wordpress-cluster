# Wordpress Web cluster

Installs and configures

## Requirements

    1) 16.04 Ubuntu Xenial Host server with base packages
    2) Pre-installed - git
         apt install git

## Download application

    git clone git://github.com/pvhrab/wordpress-cluster

## Configure application

   playbook.yml please configure domain, login and password for access to Wordpress in section Nginx and Wordpress
   
        nginx_vhosts:
          - listen: "80"
            server_name: "yourdomain.com"

        wordpress_installs:
            url: http://yourdomain.com
            title: wordpress
            admin_name: admin
            admin_email: root@localhost.localdomain
            admin_password: 'password'


## Starting application

    chmod +x bootstrap.sh
    ./bootstrap.sh

## License

MIT / BSD

## Author Information

This role was created in 2017 by [Pavel Grabinsky]
