# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Terraform utility module for Azure (`azurerm` provider) that aims to provide region mapping utilities similar to those in the [terraform-aws-utils](https://github.com/cloudposse/terraform-aws-utils) module.

## Coding Standards

### Commit Messages

Always use conventional commits when making changes to this repository. The commit message should be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Common types include:
- feat: A new feature
- fix: A bug fix
- docs: Documentation only changes
- style: Changes that do not affect the meaning of the code
- refactor: Code change that neither fixes a bug nor adds a feature
- test: Adding or modifying tests
- chore: Changes to the build process or auxiliary tools

### Editor Configuration

Always follow the rules defined in the `.editorconfig` file. This ensures consistent coding styles across different editors and IDEs.

### File Formatting

Always adhere to the settings defined in `.gitattributes` for proper file handling, especially line endings and binary files.

## Testing

Use only official Terraform testing functionality to test this module. Run tests from the root directory:

```bash
# Initialize Terraform
terraform init

# Run Terraform tests
terraform test

# Validate Terraform configuration
terraform validate
```

Since this is a utility module that doesn't require applying resources, testing should focus on validating outputs from the plan phase. This can be accomplished using assertions in test files to verify expected output values.