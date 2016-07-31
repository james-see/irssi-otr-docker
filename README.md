# irssi-otr-docker
docker file to create a fresh ubuntu 16 irssi (pronounced EARSEE) with otr built in
_don't forget to set your nick during the build step using the --build-arg command_

## To Run It

`$ docker pull ubuntu:xenial`   
`$ sudo docker build --build-arg IRSSIUSER=yournick -t irssi_otr_ubuntu .`

## To Launch

`$ docker run -ti irssi_otr_ubuntu`

Enjoy.

