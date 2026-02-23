# deploy-expo-app

> Setup EAS and deploy an Expo web app to EAS

This action provides the following functionality for GitHub Actions users:

* Setup EAS
* Setup app configuration
* Pull environment variables from EAS
* Build app dependencies and deploy web app
* Upload deployment artifact

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: skriptfabrik/github-actions/deploy-expo-app@main
        with:
          eas-project-id: 099147fa-dda0-40a1-8f62-b2bc4e6e5bdd
          expo-token: "***"
```

## Inputs

| Name                | Required | Default   | Description                              |
| ------------------- | -------- | --------- | ---------------------------------------- |
| `alias`             | `false`  | `""`      | Alias to assign to the deployment        |
| `eas-project-id`    | `true`   | `""`      | EAS project ID                           |
| `eas-version`       | `false`  | `latest`  | EAS version to use                       |
| `environment`       | `false`  | `""`      | Deployment environment                   |
| `expo-token`        | `true`   | `""`      | Token of your Expo account               |
| `working-directory` | `false`  | `""`      | Working directory for the deploy command |

## Outputs

| Name                 | Description                 |
| -------------------- | --------------------------- |
| `artifact-digest`    | Build artifact digest       |
| `artifact-id`        | Build artifact ID           |
| `artifact-url`       | URL to the build artifact   |
| `dashboard-url`      | URL to deployment dashboard |
| `identifier`         | Deployment identifier       |
| `url`                | URL to deployment           |
