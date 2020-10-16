Docker image for Hombrew on Amazon Linux 2

Most developers end up using opinionated system package managers (yum, apt-get, etc.)

Homebrew is so far the only package manager that's compatible on both MacOS and Linux.
Since Windows have recently added the ability to run Linux in Windows, then all 3 operating systems are able to use a single package manager : Homebrew.

The purpose of this project is to be able to use this flexible package manager inside of an AmazonLinux image so that CI/CD systems and production servers on AWS can use the same practices as developers on their local machines.

# Getting started

To use the image locally:
`docker pull nuagestudio/amazonlinuxbrew`

Then:
`docker run -it --rm nuagestudio/amazonlinuxbrew`

The entry point of the image is `bash`, so to make sure `brew` works you can simply:
`brew install wget`

# Contributing

If you want to work on the project, you firstly need to install some dependencies.
They are listed in the [Brewfile](./Brewfile), which can simply be installed on MacOS:
`brew bundle`

The build system is based on [Taskfile](https://taskfile.dev), which you need to install
in order to run the build command:

```bash
task build
```

If you don't want to work with the taskfile, you can simply `docker build` the Dockerfile directly.

## Updating the image

The Homebrew package manager gets regularly updated, therefore in order to have an up-to-date Docker image we're using a trick by inserting a `TIMESTAMP` into the [Dockerfile](./Dockerfile).

The CI is based on Github Actions, and is configured to run on the schedule : this way we keep most of the build in cache but simply update the Homebrew repository regularly.

## Working on Github Actions

If you work on the CI, you should start by having a look at [build.yml](./.github/workflows/build.yml)

In order to avoid making a commit for every small change in the build file, you can use the [act](https://github.com/nektos/act) CLI at the root of the project.

By default, `act` doesn't have the `docker` CLI in its docker image, so we've built one specifically for that [here](https://hub.docker.com/r/nuagestudio/github-actions)

If you have Taskfile installed:
`task ci`

Otherwise:
`act --platform ubuntu-latest=nuagestudio/github-actions:alpine`