#list of commands given from https://github.com/containers/podman/issues/2542#issuecomment-522932449
sudo touch /etc/sub{u,g}id
sudo usermod --add-subuids 10000-75535 $(whoami)
sudo usermod --add-subgids 10000-75535 $(whoami)
# use migrate instead of removing the pid files
podman system migrate #given from https://github.com/containers/podman/issues/2542#issuecomment-523324467