# Linuxbrew on Amazon Linux 2 for Python

In order to install any version of Python it's best to use `pyenv` along with a `.python-version` file containing the Python version you want to use (ex: `3.8.2`)

For package management in Python, it's best to use Poetry for 2 reasons:

- Dependency locking (it generates a `Poetry.lock` file)
- Performance (slightly above Pipenv at the moment)

This project aims to implement those two features on top of the existing AmazonLinuxBrew defined at the root of the repository.

# Build

```bash
docker build -t linuxbrew-amazonlinux:python -f ./python/Dockerfile .
```
