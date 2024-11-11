# Rsync Deploy Action

![GitHub Action](https://img.shields.io/badge/action-rsync-blue.svg)

This GitHub Action allows you to deploy files using `rsync` over SSH with detailed statistics, backup options, and customizable parameters. It is designed to simplify the deployment process while providing flexibility and control.

## Features

- **SSH Deployment**: Securely deploy files to a remote server using SSH.
- **Backup Options**: Automatically back up existing files on the remote server.
- **Exclude Patterns**: Specify files or directories to exclude from the deployment.
- **Custom Rsync Parameters**: Add additional parameters to the `rsync` command.
- **Detailed Statistics**: Get a summary of the deployment process, including file transfers and sizes.
- **Debug Mode**: Enable detailed logging for troubleshooting.
- **Dry Run**: Perform a trial run without making any changes.

## Inputs

| Input                | Description                                           | Required | Default         |
|----------------------|-------------------------------------------------------|----------|------------------|
| `host`               | SSH host                                             | Yes      |                  |
| `username`           | SSH username                                         | Yes      |                  |
| `key`                | SSH private key                                     | Yes      |                  |
| `port`               | SSH port                                            | No       | `22`             |
| `source_path`        | Source path                                         | No       | `.`              |
| `target_path`        | Target path on remote host                          | Yes      |                  |
| `exclude_list`       | List of files/directories to exclude (comma-separated) | No       | `.git/`          |
| `rsync_parameters`    | Additional rsync parameters                          | No       |                  |
| `delete_option`      | Delete extraneous files from destination dirs       | No       | `false`          |
| `backup_path`        | Backup directory path on remote host                | No       |                  |
| `dry_run`            | Perform a trial run with no changes made            | No       | `false`          |
| `print_summary`      | Print deployment summary                             | No       | `true`           |
| `print_statistics`   | Print deployment statistics                          | No       | `true`           |
| `print_rsync_logs`   | Print rsync logs during execution                   | No       | `true`           |
| `debug`              | Enable debug mode                                   | No       | `false`          |

## Example Usage

```yaml
name: Deploy to Server

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Deploy with Rsync
        uses: imajeetyadav/rsync-deployer@2.0.0
        with:
          host: ${{ secrets.HOST }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.SSH_KEY }}
          source_path: ./dist  # Deploy the dist directory
          target_path: /var/www/html
          exclude_list: '.git/,.github/,node_modules/'
          backup_path: /var/backups/www
          delete_option: true
          print_summary: true
          print_statistics: true
          debug: false
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Acknowledgments

- [rsync](https://rsync.samba.org/) - The tool used for file synchronization.
- [GitHub Actions](https://docs.github.com/en/actions) - The framework for creating CI/CD workflows.
