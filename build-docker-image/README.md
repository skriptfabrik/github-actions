# build-docker-image

> Build and push a Docker image to GitHub Container Registry

This action provides the following functionality for GitHub Actions users:

* Build Docker image
* Push Docker image to GitHub Container Registry

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: skriptfabrik/github-actions/build-docker-image@main
```

## Inputs

| Name           | Required | Default                   | Description                    |
| -------------- | -------- | ------------------------- | ------------------------------ |
| `context`      | `false`  | `.`                       | Build context                  |
| `file`         | `false`  | `Dockerfile`              | Path to the Dockerfile         |
| `platforms`    | `false`  | `linux/amd64,linux/arm64` | Platforms to build for         |
| `push`         | `false`  | `"true"`                  | Push the image to the registry |
| `tags`         | `false`  | `type=sha`                | Tags to apply to the image     |

## Outputs

| Name                | Description                                        |
| ------------------- | -------------------------------------------------- |
| `digest`            | The digest of the built image                      |
| `image`             | The name of the built image                        |
| `additional-images` | Additional image names (if multiple tags are used) |
