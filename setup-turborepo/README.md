# setup-turborepo

> Prepare and install everything for Turborepo

This action provides the following functionality for GitHub Actions users:

* Setup PNPM, Node.js and the Turborepo remote cache server
  * Specify the PNPM version in a [`packageManager`](https://nodejs.org/api/corepack.html) field in the `package.json`
  * Enable PNPM cache
  * Enable Turborepo remote cache when a bucket is passed
* Install dependencies with PNPM

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

| Name                  | Required | Default | Description                               |
| --------------------- | -------- | ------- | ----------------------------------------- |
| `node-registry-url`   | `false`  | ``      | The Node.js registry URL to use           |
| `node-version-file`   | `false`  | ``      | The file to read the Node.js version from |
| `turbo-s3-endpoint`   | `false`  | ``      | S3 endpoint for Turbo cache server        |
| `turbo-s3-region`     | `false`  | ``      | S3 region for Turbo cache server          |
| `turbo-s3-bucket`     | `false`  | ``      | S3 bucket name for Turbo cache server     |
| `turbo-s3-access-key` | `false`  | ``      | S3 access key for Turbo cache server      |
| `turbo-s3-secret-key` | `false`  | ``      | S3 secret key for Turbo cache server      |
