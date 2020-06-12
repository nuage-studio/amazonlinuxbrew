Docker image for Hombrew on Amazon Linux 2

Most developers end up using opinionated system package managers (yum, apt-get, etc.)

Homebrew is so far the only package manager that's compatible on both MacOS and Linux.
Since Windows have recently added the ability to run Linux in Windows, then all 3 operating systems are able to use a single package manager : Homebrew.

The purpose of this project is to be able to use this flexible package manager inside of an AmazonLinux image so that CI/CD systems and production servers on AWS can use the same practices as developers on their local machines.

# Building the image

To build the image locally:

```bash
docker build -t linuxbrew-amazonlinux -f ./Dockerfile .
```

# Deploying the image on DockerHub

https://hub.docker.com/repository/docker/nuagestudio/amazonlinuxbrew

To deploy the image manually:

```bash
docker push nuagestudio/amazonlinuxbrew:
```
