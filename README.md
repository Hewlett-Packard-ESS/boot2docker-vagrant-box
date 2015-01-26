# hp-ess/boot2docker
This is a fork of [Vagrant Up Boot2Docker](https://github.com/mitchellh/boot2docker-vagrant-box)

The purpose of this fork is to embed python and docker-compose into the base boot2docker image.

I know some purists will argue that we should just run docker-compose in another container, but I disagree.  Fig is an important part of our development environment orchestration - therefore I really don't see any issue with it being included in the "base", and saves an additional download of a container on restart/reboot of the boot2docker image (as it runs in ram).

You could leverage this example for embedding whatever you want into the basic boot2docker image.

## Use
I only really care about virtualbox, as i'm aiming this at a development environment.  Subsequently `make` will build the Dockerfile, which is based on the base boot2docker image.  It will install python and docker-compose into the rootfs and then create a boot2docker.iso.  From there, you can run `make virtualbox` which will create the boot2docker_virtualbox.box image, which can be imported into virtualbox with `make install`.

## Even easier use
As I'm a kind person who aims to make your life easier, this image is naturally available on Vagrant Cloud.  Subsequently - just use the example `Vagrantfile` in this repository to get you going.

## Caveats
As this image is aimed at Hewlett-Packard ESS folks, we use uid 1250 and gid 1250 for manipulation of data in all our docker containers (until such a time they implement uid/gid => host mapping).

Therefore be aware that if you mount in any voumes, the data will be written with those ids.
