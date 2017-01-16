irssi-otr-docker
================

*confirmed still working as of January 2017 as a simple one line install, be patient the build step takes approximately 7 minutes on a well-equipped machine due to the compiling and monkey-patching of irssi to work with otr libs.*

docker file to create a fresh ubuntu 16 irssi (pronounced EARSEE) with otr built in
_don't forget to set your nick during the build step using the --build-arg command_

To Run It
---------

``$ docker pull ubuntu:xenial``   
``$ sudo docker build --build-arg IRSSIUSER=yournick -t irssi_otr_ubuntu .``

To Launch
---------

``$ docker run -ti irssi_otr_ubuntu``

Enjoy.

