# Developer Environment

## About

It is very important that the development environment is standardized to ensure the best compatibility between developers. This allows for a higher standard of code quality over all. If you are having any trouble working through this guide, please reach out to me via the project channel on the discord server. **Please read the entire guide to ensure everything goes smoothly. If there are any problems reach out via the project channel on discord.**

## Setup

### Create local project directory

- Windows: Skip this step, it is done automatically for you in a later step.
- MacOS and Linux: Make a folder `/home/<username>/Keyboard-Firmware`

### Install Docker

- Windows: [windows-install](https://docs.docker.com/desktop/install/windows-install/)
- MacOS: [mac-install](https://docs.docker.com/desktop/install/mac-install/)
- Linux: [linux-install](https://docs.docker.com/engine/install/)
	- **Important**: Do *not* install docker desktop on Linux, rather use your specific distribution's instructions (found on the sidebar to the left)
	- **Remember**: Follow the post install steps for Linux: [linux-postinstall](https://docs.docker.com/engine/install/linux-postinstall/)

### Verify Install

- Windows: Open `cmd`, also known as Command Prompt
- MacOS: Open terminal
- Linux: You already know where to go ;)

In the terminal type the following:
```
$ docker run hello-world
```

If everything is working, it should return the following:
```
Hello from Docker.
This message shows that your installation appears to be working correctly.
...
```

### Install Development Container

Build the Docker image:
```
$ docker build -t kf-dev .
```

Bind to file system:

*On Windows*:
```
$ cd %HomePath%
$ docker run -d --name kf-dev-env --mount type=bind,source="%cd%/Keyboard-Firmware",target=/root/projects kf-dev
```

*On MacOS and Linux*:
```
$ mkdir $HOME/Keyboard-Firmware
$ docker run -d --name kf-dev-env --mount type=bind,source=$HOME/Keyboard-Firmware,target=/root/projects kf-dev
```

**Note**: You will likely not need to run `docker run` again for this project. If you are having trouble with docker, reach out via the project channel on discord.

### Interacting with the Container

#### Using the Command Line

Starting the Container:
```
$ docker start kf-dev-env
```

Entering the Container:
```
$ docker exec -it kf-dev-env bash
```

Stopping the Container:
```
$ docker stop kf-dev-env
```

#### Using VSCode

To use VSCode with this project, follow [this guide](https://code.visualstudio.com/docs/devcontainers/containers) on how to setup VSCode for docker.

### Container Layout

If you have not used docker before, do not worry. It might seem like a complex system, but with time it will become easier. All projects in the container should be cloned in `/root/projects` other than that, you can treat it as a standard Linux machine. 

### Cloning the Repositories

Once in the container's shell, make sure that your current working directory is `/root/projects`, this is the folder all projects are located in. Once you are there you can clone each repo in the [organization](https://github.com/csm-acm-keyboard-firmware-project) like you would with any other project. If you are new to git, reach out via the project channel on discord.

## Code Expectations

### Style Guidelines

For this project, it is very important that all code is uniform in style. This increases code readability and makes the next generation of maintainers have an easier time integrating into the project. For simplicity's sake, we will follow the [Linux kernel coding style](https://www.kernel.org/doc/html/v5.8/process/coding-style.html). If you have any questions about this, reach out via the project channel on discord.

### Data Loss Prevention

#### Always exit the container

To ensure that none of your code becomes corrupted by an abrupt shutdown, make sure to stop your container when you are done using it. This can be achieved with `docker stop kf-dev-env` or if you are using VSCode, in the docker tab, press "Stop". **Make sure to wait for the container to fully stop before continuing**

#### Make sure to use GIT

If you do not know how to use git or are unsure of a specific nuance, reach out via the project channel on discord. Git is a very powerful tool that can damage your work or the work of others if not used properly. **Do not run a git command if you cannot explain in detail what it does and why you need to use it**

#### Do not delete the docker container

If you feel like docker is broken, unless you know what you are doing, reach out via the project channel on discord. Anything not synced to git will not be saved.

#### Do not delete Keyboard-Firmware folder

Similar to above, this will cause a large problem. Docker syncs all data to this folder, deleting it is likely worse than deleting the docker container.
