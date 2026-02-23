# build-expo-app

> Setup Java, EAS and build an Expo app using EAS

This action provides the following functionality for GitHub Actions users:

* Setup Java and EAS
  * The Java setup will run for local builds only
* Setup app configuration
* Pull environment variables from EAS
* Build app dependencies and app itself
* Upload build artifact

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: skriptfabrik/github-actions/build-expo-app@main
        with:
          eas-project-id: 099147fa-dda0-40a1-8f62-b2bc4e6e5bdd
          expo-token: "***"
```

## Inputs

| Name                | Required | Default   | Description                                                |
| ------------------- | -------- | --------- | ---------------------------------------------------------- |
| `eas-project-id`    | `true`   | `""`      | EAS project ID                                             |
| `eas-version`       | `false`  | `latest`  | EAS version to use                                         |
| `environment`       | `false`  | `""`      | Build environment                                          |
| `expo-token`        | `true`   | `""`      | Token of your Expo account                                 |
| `java-version`      | `false`  | `""`      | The Java version to use (local builds only)                |
| `java-version-file` | `false`  | `""`      | The file to read the Java version from (local builds only) |
| `local`             | `false`  | `"false"` | Run build locally?                                         |
| `platform`          | `false`  | `all`     | Platform to build for (all/android/ios)                    |
| `profile`           | `false`  | `""`      | Name of the build profile                                  |
| `submit`            | `false`  | `"false"` | Auto submit to the store? (production profile only)        |
| `working-directory` | `false`  | `""`      | Working directory for the build command                    |

## Outputs

| Name                 | Description               |
| -------------------- | ------------------------- |
| `app-build-version`  | App build version         |
| `app-version`        | App version               |
| `artifact-digest`    | Build artifact digest     |
| `artifact-id`        | Build artifact ID         |
| `artifact-url`       | URL to the build artifact |
| `profile`            | Name of the build profile |
