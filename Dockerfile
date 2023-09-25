# Select which vm to run on
FROM ubuntu:20.04

# Fix timezone hang on build
ENV TZ=America/Denver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Configure pre-installed packages
RUN apt update && apt install -y \
	clang \
	build-essential \
	git \
	cmake \
	libsfml-dev \
	libreadline-dev \
	vim \
	neovim \
	nano \
	emacs \
	gdb

# Create the projects directory
RUN mkdir /root/projects

# Make sure the dev container doesn't exit
CMD tail -f /dev/null
