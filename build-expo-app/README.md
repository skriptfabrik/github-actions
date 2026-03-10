# build-expo-app

> Build an Expo app using EAS

This action provides the following functionality for GitHub Actions users:

* Build Expo app using EAS
* Upload build artifact

## Requirements

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
      # ... install dependencies
      - uses: skriptfabrik/github-actions/setup-eas
        with:
          eas-project-id: 099147fa-dda0-40a1-8f62-b2bc4e6e5bdd
          expo-token: "***"
      - uses: skriptfabrik/github-actions/build-expo-app@main
```

## Inputs

| Name                | Required | Default   | Description                                                |
| ------------------- | -------- | --------- | ---------------------------------------------------------- |
| `local`             | `false`  | `"false"` | Run build locally?                                         |
| `profile`           | `false`  | `""`      | Name of the build profile                                  |
| `submit`            | `false`  | `"false"` | Auto submit to the store? (production profile only)        |
| `working-directory` | `false`  | `""`      | Working directory for the build command                    |

## Outputs

| Name                | Description               |
| ------------------- | ------------------------- |
| `app-build-version` | App build version         |
| `app-version`       | App version               |
| `artifact-digest`   | Build artifact digest     |
| `artifact-id`       | Build artifact ID         |
| `artifact-url`      | URL to the build artifact |
| `profile`           | Name of the build profile |
