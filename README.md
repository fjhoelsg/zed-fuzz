# Fuzz Type Checker for Z

zed-fuzz-docker is a simple Docker image that includes LaTeX and Fuzz. Please refer to [Spivey's repository](https://bitbucket.org/Spivey/fuzz) for more information about the fuzz type checker.

## Usage

Typically you would want to mount your working directory as a volume and run an interactive shell.

```sh
docker run -itv "$(pwd):/opt/src" fjhoelsg/zed-fuzz:latest bash
```

After moving to the directory that contains your LaTeX source files, you should run the fuzz type checker and the LaTeX compiler.

```sh
cd /opt/src
fuzz main.tex
pdflatex main.tex
```
