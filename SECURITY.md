# Security Policy

## Vulnerability Reporting

We take the security of our infrastructure seriously. If you discover a security vulnerability within this project, please report it by opening an issue in the GitHub repository.

## Security Practices

This project follows the following security guidelines to ensure a secure AWS deployment:

- **Secret Management**: No secrets (passwords, AWS keys, etc.) are hardcoded in the Terraform files. All sensitive information is managed via `terraform.tfvars` or GitHub Actions Secrets.
- **Least Privilege**: Security groups are configured to follow the principle of least privilege, limiting SSH access to the necessary ports.
- **Sensitive Variables**: Variables containing passwords or keys are marked as `sensitive = true` to prevent them from being printed in the console logs during execution.
- **CI/CD Validation**: All changes are validated via GitHub Actions (`terraform validate`) before being applied to avoid misconfigurations.

## Disclaimer

This project is intended for educational purposes to fulfill the AWS Rewards requirements. Users are responsible for managing their own AWS credentials and for destroying the infrastructure once the reward is credited to avoid unexpected costs.
