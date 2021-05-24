# System Register

***Develop a register that monitors running services and processes on a computing machine.***

The project is developed in Python programming language.

### Python development

**⚙️ Computing the instance number for each process**

- For each process the method `Analyze_Process_Stack` will determine if the process has changed its number of running instances
- The process list given as argument within the method.
- The method iterates through all the processes, and it creates a tuple of the type: `process name` + `instance_change`
- The `instance_change` variable gives the difference between active instances after each monitoring cycle.
- The monitoring cycle is set by the user before the script is executed. After each `x` amount of seconds, the program searches again for all running instances of a certain process.
    - Within a new cycle, every process is saved into a separate file (with all active instances).
    - The implementation has a so called **spaced relaxation** mode, where the monitoring tool captures each instance change as it starts or stops, even in a batch of instances.

⚙️ **Running shell commands via Python**

### Using the Podman service for Docker image/container management within Linux

- With the switch to an Arch-Linux based operating system for the development process of the **System-register** app, the Dockerized app is managed by Podman, instead of using the Docker daemon itself. The [Podman](https://podman.io/) service allows anyone to pull, run and manage images/containers (even from [docker.io](https://hub.docker.com/)) without root access to the host machine, and also without using the Docker daemon.
- However, setting up the Podman service for being able to pull images requires some steps.
    - The execution of Podman commands such as `pull` require specific user access inside the containers. (the user should have proper `UID` and `GUID` mappings, belong to the so-called **user namespace**). If that is not the case, pulling an image from the docker register will fail, as some operations (like doing a checksum on the downloaded files) cannot be executed.
    - This is only happening in the **non-root** mode of operating with Podman.
    - Here is a list of different resources that explain the mode of operation for Podman in root/non-root access.
        - Solutions:

            [No subuid ranges found for user " " executing any podman command · Issue #1182 · containers/podman](https://github.com/containers/podman/issues/1182)

            [lchown error on podman pull · Issue #2542 · containers/podman](https://github.com/containers/podman/issues/2542#issuecomment-522932449)

            [lchown error on podman pull · Issue #2542 · containers/podman](https://github.com/containers/podman/issues/2542)

            [How to Install and Use Podman on Ubuntu 20.04](https://www.vultr.com/docs/how-to-install-and-use-podman-on-ubuntu-20-04#3__Working_with_OCI_Registries)

            [Why can't rootless Podman pull my image?](https://www.redhat.com/sysadmin/rootless-podman)