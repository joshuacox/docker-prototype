# docker-prototype
A generic prototype Dockerfile folder with a few useful utilities

Run `make runmysqltemp` to initialize a fresh mysql along with your container

Then run `make grab` to grab both /var/www/html and /var/lib/mysql into a local datadir

Finally you can run `make prod` and have persistent data with the above
