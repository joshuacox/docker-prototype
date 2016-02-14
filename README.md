# docker-prototype

### What is this?

A generic prototype Dockerfile folder with a few useful utilities

Run `make runmysqltemp` to initialize a fresh mysql along with your container

Then run `make grab` to grab both /var/www/html and /var/lib/mysql into a local datadir

Finally you can run `make prod` and have persistent data with the above

### Usage

make a new repo

then cd into your new repo and call the `mknewProto.sh` full paths are probably best e.g.

```
/mnt/mygitrepo/docker-prototype/mknewProto.sh
```

I also happen to use relative paths all the time and it works fine

```
../docker-prototype/mknewProto.sh
```

this will interactively copy the prototype files necessary into your repo
it will politely ask before overwriting anything
at which point you can say 'n' if you'd like to keep your prior work if any
