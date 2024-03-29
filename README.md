## pp-git-hooks

We use `pre-commit` to use the hooks in this projects

### Install pre-commit

Using `pip`:

```bash
pip install pre-commit
```

Using `homebrew`:

```bash
brew install pre-commit
```

## Usage

In you project create a file called `.pre-commit-config.yaml`

```yaml
repos:
- repo: https://github.com/alessio-perugini/pp-git-hooks
  rev: main
  hooks:
    - id: go-imports
    args:
      - "--docker-image"
      - "prontopro/golang:1.19.0-2-dev"
      - "--local=github.com/ProntoPro"
    - id: go-lint
      args: [-c=.golangci.yml]
    - id: php-cbf
```

Then run the `pre-commit install` to set up the git hook scripts.
If you want to run the script inside a docker container add the args:

```bash
    args:
      - "--docker-image"
      - "prontopro/golang:1.19.0-2-dev"
```

## Update hooks

Sometimes we may add or modify some hook scripts. Every time we commit a change
in this repository, our users, who wants to receive the latest version, have to
run:
```bash
pre-commit autoupdate
```
in the project which `pre-commit` is in use

## Available hooks

See `.pre-commit-hooks.yaml` file in this repo
