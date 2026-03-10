# deploy-expo-app

> Deploy an Expo web app using EAS

This action provides the following functionality for GitHub Actions users:

* Export app with Expo
* Upload source maps to Sentry
* Deploy web app using EAS
* Upload deployment artifact

## Requirements

The `expo` package is required and should be installed via PNPM.

This action is based on the [`setup-eas`](../setup-eas/README.md) action.
This must be executed before this action.

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v6
      # ... install dependencies and ensure that Expo CLI is installed
      - uses: skriptfabrik/github-actions/setup-eas
        with:
          eas-project-id: 099147fa-dda0-40a1-8f62-b2bc4e6e5bdd
          expo-token: "***"
      - uses: skriptfabrik/github-actions/deploy-expo-app@main
```

## Inputs

| Name                | Required | Default | Description                              |
| ------------------- | -------- | ------- | ---------------------------------------- |
| `alias`             | `false`  | `""`    | Alias to assign to the deployment        |
| `working-directory` | `false`  | `""`    | Working directory for the deploy command |

## Outputs

| Name              | Description                 |
| ----------------- | --------------------------- |
| `artifact-digest` | Build artifact digest       |
| `artifact-id`     | Build artifact ID           |
| `artifact-url`    | URL to the build artifact   |
| `dashboard-url`   | URL to deployment dashboard |
| `identifier`      | Deployment identifier       |
| `url`             | URL to deployment           |
