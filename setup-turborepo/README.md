# setup-turborepo

> Setup PNPM, Node.js and the Turborepo remote cache server

This action provides the following functionality for GitHub Actions users:

* Prepare everything for Turborepo
  * Specify the PNPM version in a [`packageManager`](https://nodejs.org/api/corepack.html) field in the `package.json` or
    as `pnpm-version` input
  * Enable PNPM cache
  * Enable Turborepo remote cache when a bucket is passed
* Install dependencies with PNPM
* Export environment variables for Turborepo

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: skriptfabrik/github-actions/setup-turborepo@main
```

## Inputs

| Name                  | Required | Default                    | Description                                    |
| --------------------- | -------- | -------------------------- | ---------------------------------------------- |
| `node-registry-url`   | `false`  | `""`                       | The Node.js registry URL to use                |
| `node-version`        | `false`  | `""`                       | The Node.js version to use                     |
| `node-version-file`   | `false`  | `""`                       | The file to read the Node.js version from      |
| `pnpm-install-args`   | `false`  | `--frozen-lockfile`        | Additional arguments to pass to `pnpm install` |
| `pnpm-version`        | `false`  | `""`                       | The version of PNPM to use                     |
| `turbo-s3-endpoint`   | `false`  | `""`                       | S3 endpoint for Turbo cache server             |
| `turbo-s3-region`     | `false`  | `""`                       | S3 region for Turbo cache server               |
| `turbo-s3-bucket`     | `false`  | `""`                       | S3 bucket name for Turbo cache server          |
| `turbo-s3-access-key` | `false`  | `""`                       | S3 access key for Turbo cache server           |
| `turbo-s3-secret-key` | `false`  | `""`                       | S3 secret key for Turbo cache server           |
| `turbo-team`          | `false`  | `${{ github.repository }}` | The Turbo team to use for caching              |
| `turbo-token`         | `false`  | `""`                       | The value will be checked by the cache server  |

## Outputs

| Name            | Description                   |
| --------------- | ----------------------------- |
| `node-version`  | The installed Node.js version |
| `pnpm-version`  | The installed PNPM version    |
| `turbo-version` | The installed Turbo version   |

## Environment exports

| Name                       | Description                                                        |
| -------------------------- | ------------------------------------------------------------------ |
| `TURBO_API`                | The URL of the Turbo cache server                                  |
| `TURBO_SCM_BASE`           | The bashe sha when the action is used in a `pull_request` workflow |
| `TURBO_TEAM`               | See `turbo-team` input                                             |
| `TURBO_TELEMETRY_DISABLED` | Telemetry is disabled for CI usage                                 |
| `TURBO_TOKEN`              | See `turbo-token` input                                            |
