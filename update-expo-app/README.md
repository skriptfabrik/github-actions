# update-expo-app

> Update an Expo app using EAS

This action provides the following functionality for GitHub Actions users:

* Update Expo app using EAS

## Requirements

This action is based on the [`setup-eas`](../setup-eas/README.md) action.
This must be executed before this action.

## Usage

```yaml
jobs:
  update:
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
      - uses: skriptfabrik/github-actions/update-expo-app@main
```

## Inputs

| Name                | Required | Default   | Description                              |
| ------------------- | -------- | --------- | ---------------------------------------- |
| `working-directory` | `false`  | `""`      | Working directory for the update command |

## Outputs

| Name              | Description                        |
| ----------------- | ---------------------------------- |
| `project-id`      | EAS project ID                     |
| `project-slug`    | EAS project slug                   |
| `project-scheme`  | EAS project scheme                 |
| `android-id`      | Android update ID                  |
| `ios-id`          | iOS update ID                      |
| `group-id`        | Update group ID                    |
| `runtime-version` | Runtime version                    |
| `qr-url:`         | URL to QR code to load this update |
| `url`             | URL to platform-independent update |
