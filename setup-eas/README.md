# setup-eas

> Setup EAS

This action provides the following functionality for GitHub Actions users:

* Prepare everything for EAS
  * Use PNPM as packager
  * Ensure working directory is initialized with project ID
  * Configure the project to support EAS build/update
  * Pull environment variables from EAS

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: skriptfabrik/github-actions/setup-eas
        with:
          eas-project-id: 099147fa-dda0-40a1-8f62-b2bc4e6e5bdd
          expo-token: "***"
```

## Inputs

| Name                | Required | Default  | Description                             |
| ------------------- | -------- | -------- | --------------------------------------- |
| `eas-project-id`    | `true`   | `""`     | EAS project ID                          |
| `eas-version`       | `false`  | `latest` | EAS version to use                      |
| `eas-version-file`  | `false`  | `""`     | The file to read the EAS version from   |
| `environment`       | `false`  | `""`     | Name of the environment                 |
| `expo-token`        | `true`   | `""`     | Token of your Expo account              |
| `platform`          | `false`  | `""`     | Platform to configure (all/android/ios) |
| `working-directory` | `false`  | `""`     | Working directory for the commands      |

## Outputs

| Name          | Description               |
| ------------- | ------------------------- |
| `eas-version` | The installed EAS version |

## Environment exports

| Name                    | Description                                           |
| ----------------------- | ----------------------------------------------------- |
| `EAS_WORKING_DIRECTORY` | The file path to the pulled EAS environment variables |
