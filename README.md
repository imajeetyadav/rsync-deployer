# Rsync-deployer
This action facilitates code deployment using Rsync, providing a seamless method to transfer files between hosts securely. It offers flexibility in specifying the source and target directories, along with optional features like backups, exclusion lists, and dry runs. With support for custom Rsync parameters, users can tailor the deployment process to suit their specific requirements.

# Inputs

| Name               | Default Value | Description                                            |
| ------------------ | ------------- | ------------------------------------------------------ |
| `KEY`              |   required    | Private key part of an SSH key pair                    |
| `HOST`             |   required    | Remote host                                            |
| `USERNAME`         |   required    | Remote username                                        |
| `PORT`             | "22"          | Remote port                                            |
| `SOURCE_PATH`      | ""            | Source directory, path relative to `$GITHUB_WORKSPACE` |
| `TARGET_PATH`      |   required    | Target directory                                       |
| `BACKUP_PATH`      | ""            | Backup directory (Optional)                            |
| `RSYNC_PARAMETERS` | ""            | Arguments to pass to rsync apart from -azh             |
| `DELETE_OPTION`    | "false"       | Delete extraneous files                                |
| `EXCLUDE_LIST`     | ".git/"       | Paths to exclude separated by `,`, ie: `.git/`         |
| `DRY_RUN`          | "false"       | Run a trial without making any changes                 |

# Usage

```yaml
name: Deploy Code

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
      - name: Rsync Deployer
        uses: imajeetyadav/rsync-deployer@1.0.0
        with:
          HOST: ${{ secrets.HOST }}
          USERNAME: ${{ secrets.USERNAME }}
          KEY: ${{ secrets.KEY }}
          SOURCE_PATH: "."
          TARGET_PATH: "/home/ubuntu/test/"
          BACKUP_PATH: "/home/ubuntu/test-backup/"
          PORT: 22
          RSYNC_PARAMETERS: "" 
          DELETE_OPTION: "false"
          EXCLUDE_LIST: ".git, .github"
          DRY_RUN: "false"
```
