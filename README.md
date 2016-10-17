# docker-password-store

Run [Password Store](https://www.passwordstore.org/) in a Docker container.
Great if you use Windows in addition to Linux or macOS and want to get access to
your passwords on all your machines.

On Windows, you could also use [Pass4Win](https://github.com/mbos/Pass4Win), 
but I like using the command line as much as possible.

## Usage

Run the container and map your `.gnupg` and `.password-store` directories into the `root` directory in the container:

```sh
docker run -it --rm \
-v $HOME/.password-store:/root/.password-store \
-v $HOME/.gnupg:/root/.gnupg \
 mapitman/password-store /bin/bash
```
