FROM boot2docker/boot2docker
RUN apt-get update && apt-get -y install btrfs-tools python python-setuptools wget

# Install TCZ base stuff
ENV ADDITIONAL_TCZ_DEPS python python-setuptools

RUN for dep in $ADDITIONAL_TCZ_DEPS; do \
  echo "Download $TCL_REPO_BASE/tcz/$dep.tcz" &&\
  curl -L -o /tmp/$dep.tcz $TCL_REPO_BASE/tcz/$dep.tcz &&\
  unsquashfs -f -d $ROOTFS /tmp/$dep.tcz &&\
  rm -f /tmp/$dep.tcz ;\
done

RUN PYTHONPATH=/rootfs/usr/local/lib/python2.7/site-packages easy_install --always-copy --install-dir /rootfs/usr/local/lib/python2.7/site-packages docker-compose

RUN /make_iso.sh
CMD ["cat", "boot2docker.iso"]
