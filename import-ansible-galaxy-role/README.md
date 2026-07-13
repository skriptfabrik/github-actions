# import-ansible-galaxy-role

> Import Ansible role to Ansible Galaxy

This action provides the following functionality for GitHub Actions users:

* Setup Python
* Install ansible-core
* Import an Ansible role to Ansible Galaxy

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - uses: skriptfabrik/github-actions/import-ansible-galaxy-role@main
        with:
          api-key: ${{ secrets.GALAXY_API_KEY }}
```

## Inputs

| Name                | Required | Default  | Description                                |
| --------------------|----------|----------|--------------------------------------------|
| `api-key`           | `true`   | `""`     | The Ansible Galaxy API key                 |
| `branch`            | `false`  | `"main"` | The branch to import                       |
| `working-directory` | `false`  | `"."`    | Working directory to run ansible-galaxy in |
