# deploy-expo-app

> Deploy an Expo web app using EAS

This action provides the following functionality for GitHub Actions users:

* Export app with Expo
* Upload client and server source maps to separate Sentry projects (optional)
* Deploy web app using EAS
* Upload deployment artifact

## Requirements

The `expo` package is required and should be installed via PNPM.

This action is based on the [`setup-eas`](../setup-eas/README.md) action.
This must be executed before this action.

## Sentry source maps

Source map upload is optional and only runs when a `SENTRY_AUTH_TOKEN` is found in
an `.env.local` file in the working directory. When enabled:

1. Expo exports with `--source-maps` and Sentry debug IDs are injected into the
   build output.
2. **Client/web bundle** — source maps are always uploaded to the default Sentry
   project configured in `app.json`. The action uploads from `build/client` when
   the app uses `web.output: "server"` (client/server split output), or from
   `build` otherwise (`web.output: "single"`).
3. **Server/API bundle** (e.g. Cloudflare Worker functions, present when
   `web.output: "server"` produces a `build/server` directory) — source maps are
   uploaded to a *separate, dedicated* Sentry project, so client and server errors
   are tracked independently. This project is configured via
   `EXPO_SERVER_SENTRY_PROJECT` in `.env.local` and is **required** whenever
   `build/server` exists; the action fails otherwise.

Add the following to `.env.local` in the working directory to enable this:

| Variable                     | Required                            | Description                                  |
| ----------------------------- | ------------------------------------ | --------------------------------------------- |
| `SENTRY_AUTH_TOKEN`           | No (enables the feature)             | Sentry auth token used for source map upload  |
| `EXPO_SERVER_SENTRY_PROJECT`  | Only if the app has a server bundle  | Sentry project slug for server/API source maps |

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
