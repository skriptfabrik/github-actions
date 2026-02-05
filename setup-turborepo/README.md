# setup-turborepo

> Prepare and install everything for Turborepo

This action provides the following functionality for GitHub Actions users:

* Setup PNPM, Node.js and the Turborepo remote cache server
  * Specify the PNPM version in a [`packageManager`](https://nodejs.org/api/corepack.html) field in the `package.json` or
    as `pnpm-version` input
  * Enable PNPM cache
  * Enable Turborepo remote cache when a bucket is passed
* Install dependencies with PNPM
* Export environment variables for Turborepo
  * `TURBO_API`: The URL of the Turbo cache server
  * `TURBO_SCM_BASE`: The bashe sha when the action is used in a `pull_request` workflow
  * `TURBO_TEAM`: see `turbo-team` input
  * `TURBO_TELEMETRY_DISABLED`: Telemetry is disabled for CI usage
  * `TURBO_TOKEN`: see `turbo-token` input

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

| Name                  | Required | Default                    | Description                                   |
| --------------------- | -------- | -------------------------- | --------------------------------------------- |
| `node-registry-url`   | `false`  | ``                         | The Node.js registry URL to use               |
| `node-version`        | `false`  | ``                         | The Node.js version to use                    |
| `node-version-file`   | `false`  | ``                         | The file to read the Node.js version from     |
| `pnpm-version`        | `false`  | ``                         | The version of PNPM to use                    |
| `turbo-s3-endpoint`   | `false`  | ``                         | S3 endpoint for Turbo cache server            |
| `turbo-s3-region`     | `false`  | ``                         | S3 region for Turbo cache server              |
| `turbo-s3-bucket`     | `false`  | ``                         | S3 bucket name for Turbo cache server         |
| `turbo-s3-access-key` | `false`  | ``                         | S3 access key for Turbo cache server          |
| `turbo-s3-secret-key` | `false`  | ``                         | S3 secret key for Turbo cache server          |
| `turbo-team`          | `false`  | `${{ github.repository }}` | The Turbo team to use for caching             |
| `turbo-token`         | `false`  | ``                         | The value will be checked by the cache server |
