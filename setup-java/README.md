# setup-java

> Setup Java

This action provides the following functionality for GitHub Actions users:

* Setup Java
  * Enable Gradle cache

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: skriptfabrik/github-actions/setup-java@main
```

## Inputs

| Name                | Required | Default   | Description                            |
| ------------------- | -------- | --------- | -------------------------------------- |
| `java-distribution` | `false`  | `""`      | The Java distribution to use           |
| `java-version`      | `false`  | `""`      | The Java version to use                |
| `java-version-file` | `false`  | `""`      | The file to read the Java version from |

## Outputs

| Name                | Description                           |
| ------------------- | ------------------------------------- |
| `java-distribution` | The Java distribution that was set up |
| `java-version`      | The installed Java version            |
