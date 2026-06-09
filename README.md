# Ansible Collection - plopoyop.kubernetes_apps

## Description

This Ansible collection provides a set of roles to install and configure various applications on a Kubernetes cluster using their helm charts. The goal is to simplify and automate the deployment of these applications using Ansible.

## Contents

This collection includes multiple Ansible roles designed to install and configure application for a Kubernetes cluster. Each role is designed to be as configurable as possible while providing default settings tailored to my specific usage.

## Disclaimer

The roles provided in this collection are developed based on my usage of the apps and my specific needs. While configuration options are available to adjust their behavior, not all possible options are necessarily supported.

Before using this collection in production, ensure that the default configurations meet your needs and adjust them if necessary.

## Prerequisites

- Ansible >= 2.9
- A running Kubernetes cluster
- Administrator access to cluster nodes (if required for certain installations)

## Installation

To install this collection, use the following command:

```sh
ansible-galaxy collection install plopoyop.kubernetes_apps
```

## Usage

You can call the roles from this collection in your Ansible playbooks as follows:

```yaml
- name: Install a tool on Kubernetes
  hosts: localhost
  roles:
    - role: plopoyop.kubernetes_apps.role_name
      vars:
        config_option: value
```

## Collection content
### List of Roles and Helm Chart Versions

| Role Name       | Helm Chart Version | Role Tag         | README Link                                 |
| ---------       | ------------------ | ---------------- | ------------------------------------        |
| Argo CD | v9.5.19            | `argocd`         | [View README](roles/argocd/README.md)       |
| Atlantis | v6.5.1            | `atlantis`       | [View README](roles/atlantis/README.md)       |
| ClamAV         | v3.7.1            | `clamav`         | [View README](roles/clamav/README.md)       |
| Gatus         | v1.5.0            | `gatus`          | [View README](roles/gatus/README.md)       |
| GitLab Runner         | v0.89.1            | `gitlab_runner`  | [View README](roles/gitlab_runner/README.md)       |
| Headlamp         | v0.42.0            | `headlamp`       | [View README](roles/headlamp/README.md)       |
| Mailcrab         | v1.7.0            | `mailcrab`       | [View README](roles/mailcrab/README.md)       |
| Warpgate         | v0.0.5            | `warpgate`       | [View README](roles/warpgate/README.md)       |
| Zammad         | v16.2.3            | `zammad`         | [View README](roles/zammad/README.md)       |

### Tags

Every role in this collection ships tagged tasks so you can selectively run only what you need with `ansible-playbook --tags` or skip parts with `--skip-tags`.

Three kinds of tags are exposed:

- **Role tag** — named after the role itself (e.g. `argocd`, `atlantis`, `clamav`, `gatus`, `gitlab_runner`, `headlamp`, `mailcrab`, `warpgate`, `zammad`). Use it to scope a run to a single application.
- **Action tag** — `install` or `uninstall`. The role's `*_enabled` variable controls which one runs:
  - When `<role>_enabled: true`, the setup tasks (tagged `install`) are executed.
  - When `<role>_enabled: false`, the cleanup tasks (tagged `uninstall`) are executed.
- **Task-type tag** — applied per task to scope a run to a specific phase (e.g. only create the namespace, only refresh helm repos):

  | Tag               | Applied to                                                                                                  |
  | ----------------- | ----------------------------------------------------------------------------------------------------------- |
  | `namespace`       | Namespace creation/deletion                                                                                 |
  | `helm_repository` | Adding/removing helm repositories                                                                           |
  | `helm_chart`      | Helm chart install/upgrade/uninstall (and related `helm_info`)                                              |
  | `crds`            | CRD-specific tasks (direct manifest application or CRD-only helm charts)                                    |
  | `manifest`        | Other Kubernetes resources (ArgoCD Applications/Projects/Repositories/Clusters, custom resources, etc.)     |

  Pure helper tasks (`set_fact`, `assert`, `pause`, `uri` validations, file/archive helpers, `debug`) carry only the role + action tags so they run alongside any phase that needs them.

#### Examples

Install only Argo CD:

```sh
ansible-playbook playbook.yml --tags "argocd,install"
```

Run install actions for every role:

```sh
ansible-playbook playbook.yml --tags "install"
```

Uninstall only Headlamp (requires `headlamp_enabled: false`):

```sh
ansible-playbook playbook.yml --tags "headlamp,uninstall"
```

Run everything except Zammad:

```sh
ansible-playbook playbook.yml --skip-tags "zammad"
```

Prepare prerequisites only (create namespace + add helm repo) without installing the chart, e.g. for Atlantis:

```sh
ansible-playbook playbook.yml --tags "atlantis,namespace,helm_repository"
```

Uninstall Zammad but keep its namespace:

```sh
ansible-playbook playbook.yml --tags "zammad,uninstall" --skip-tags "namespace"
```

Refresh only the ArgoCD application/project resources without touching the helm release:

```sh
ansible-playbook playbook.yml --tags "argocd,manifest"
```

## Customization

Each role exposes variables to adjust the configuration of the installed tools. Refer to each role's documentation for available variables.

Contributions are welcome! Feel free to open issues or submit pull requests to improve the roles and add new features.

## Tools
[Devbox](https://www.jetify.com/docs/devbox) is used to make reproducible development environments
[Task](https://taskfile.dev/) as a task runner
[Renovate](https://github.com/renovatebot/renovate) to update dependencies

## License

This collection is distributed under the Mozilla Public License Version 2.0 license.
