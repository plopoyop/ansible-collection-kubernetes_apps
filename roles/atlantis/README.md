# atlantis

Install and configure Atlantis on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [atlantis_additional_helm_values](#atlantis_additional_helm_values)
  - [atlantis_allow_draft_prs](#atlantis_allow_draft_prs)
  - [atlantis_allow_fork_prs](#atlantis_allow_fork_prs)
  - [atlantis_bitbucket_enabled](#atlantis_bitbucket_enabled)
  - [atlantis_bitbucket_token](#atlantis_bitbucket_token)
  - [atlantis_bitbucket_user](#atlantis_bitbucket_user)
  - [atlantis_data_directory](#atlantis_data_directory)
  - [atlantis_data_storage](#atlantis_data_storage)
  - [atlantis_default_tf_distribution](#atlantis_default_tf_distribution)
  - [atlantis_default_tf_version](#atlantis_default_tf_version)
  - [atlantis_deployment_name](#atlantis_deployment_name)
  - [atlantis_disable_apply](#atlantis_disable_apply)
  - [atlantis_disable_apply_all](#atlantis_disable_apply_all)
  - [atlantis_disable_repo_locking](#atlantis_disable_repo_locking)
  - [atlantis_enable_diff_markdown_format](#atlantis_enable_diff_markdown_format)
  - [atlantis_enabled](#atlantis_enabled)
  - [atlantis_environment](#atlantis_environment)
  - [atlantis_environment_secrets](#atlantis_environment_secrets)
  - [atlantis_extra_args](#atlantis_extra_args)
  - [atlantis_extra_manifests](#atlantis_extra_manifests)
  - [atlantis_extra_volume_mounts](#atlantis_extra_volume_mounts)
  - [atlantis_extra_volumes](#atlantis_extra_volumes)
  - [atlantis_gitea_base_url](#atlantis_gitea_base_url)
  - [atlantis_gitea_enabled](#atlantis_gitea_enabled)
  - [atlantis_gitea_secret](#atlantis_gitea_secret)
  - [atlantis_gitea_token](#atlantis_gitea_token)
  - [atlantis_gitea_user](#atlantis_gitea_user)
  - [atlantis_github_app_enabled](#atlantis_github_app_enabled)
  - [atlantis_github_app_id](#atlantis_github_app_id)
  - [atlantis_github_app_installation_id](#atlantis_github_app_installation_id)
  - [atlantis_github_app_key](#atlantis_github_app_key)
  - [atlantis_github_app_secret](#atlantis_github_app_secret)
  - [atlantis_github_app_slug](#atlantis_github_app_slug)
  - [atlantis_github_enabled](#atlantis_github_enabled)
  - [atlantis_github_hostname](#atlantis_github_hostname)
  - [atlantis_github_secret](#atlantis_github_secret)
  - [atlantis_github_token](#atlantis_github_token)
  - [atlantis_github_user](#atlantis_github_user)
  - [atlantis_gitlab_enabled](#atlantis_gitlab_enabled)
  - [atlantis_gitlab_hostname](#atlantis_gitlab_hostname)
  - [atlantis_gitlab_secret](#atlantis_gitlab_secret)
  - [atlantis_gitlab_token](#atlantis_gitlab_token)
  - [atlantis_gitlab_user](#atlantis_gitlab_user)
  - [atlantis_helm_chart_ref](#atlantis_helm_chart_ref)
  - [atlantis_helm_repo_name](#atlantis_helm_repo_name)
  - [atlantis_helm_repo_url](#atlantis_helm_repo_url)
  - [atlantis_helm_version](#atlantis_helm_version)
  - [atlantis_hide_prev_plan_comments](#atlantis_hide_prev_plan_comments)
  - [atlantis_ingress_annotations](#atlantis_ingress_annotations)
  - [atlantis_ingress_certmanager_cluster_issuer](#atlantis_ingress_certmanager_cluster_issuer)
  - [atlantis_ingress_class](#atlantis_ingress_class)
  - [atlantis_ingress_enabled](#atlantis_ingress_enabled)
  - [atlantis_ingress_host](#atlantis_ingress_host)
  - [atlantis_ingress_path](#atlantis_ingress_path)
  - [atlantis_ingress_path_type](#atlantis_ingress_path_type)
  - [atlantis_ingress_tls_enabled](#atlantis_ingress_tls_enabled)
  - [atlantis_ingress_tls_secret_name](#atlantis_ingress_tls_secret_name)
  - [atlantis_init_containers](#atlantis_init_containers)
  - [atlantis_log_level](#atlantis_log_level)
  - [atlantis_namespace](#atlantis_namespace)
  - [atlantis_org_allowlist](#atlantis_org_allowlist)
  - [atlantis_replica_count](#atlantis_replica_count)
  - [atlantis_repo_config](#atlantis_repo_config)
  - [atlantis_resources](#atlantis_resources)
  - [atlantis_service_port](#atlantis_service_port)
  - [atlantis_service_target_port](#atlantis_service_target_port)
  - [atlantis_service_type](#atlantis_service_type)
  - [atlantis_url](#atlantis_url)
  - [atlantis_vcs_secret_name](#atlantis_vcs_secret_name)
  - [atlantis_volume_claim_enabled](#atlantis_volume_claim_enabled)
  - [atlantis_wait_install](#atlantis_wait_install)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### atlantis_additional_helm_values

Additional helm values to be passed to the chart

**_Type:_** dict<br />

#### Default value

```YAML
atlantis_additional_helm_values: {}
```

#### Example usage

```YAML
  atlantis_additional_helm_values:
    basicAuth:
      username: admin
      password: s3cr3t
```

### atlantis_allow_draft_prs

Allow Atlantis to run on draft pull requests

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_allow_draft_prs: false
```

### atlantis_allow_fork_prs

Allow Atlantis to run on fork pull requests

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_allow_fork_prs: false
```

### atlantis_bitbucket_enabled

Enable Bitbucket as VCS provider

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_bitbucket_enabled: false
```

### atlantis_bitbucket_token

Bitbucket Cloud app password for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_bitbucket_token: ''
```

### atlantis_bitbucket_user

Bitbucket Cloud username for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_bitbucket_user: ''
```

### atlantis_data_directory

Mount path for Atlantis data directory

**_Type:_** string<br />

#### Default value

```YAML
atlantis_data_directory: /atlantis-data
```

### atlantis_data_storage

Size of data storage PVC

**_Type:_** string<br />

#### Default value

```YAML
atlantis_data_storage: 5Gi
```

### atlantis_default_tf_distribution

Default Terraform distribution. Options: terraform, opentofu

**_Type:_** string<br />

#### Default value

```YAML
atlantis_default_tf_distribution: ''
```

### atlantis_default_tf_version

Default Terraform version to use

**_Type:_** string<br />

#### Default value

```YAML
atlantis_default_tf_version: ''
```

### atlantis_deployment_name

Helm chart deployment name

**_Type:_** string<br />

#### Default value

```YAML
atlantis_deployment_name: atlantis
```

### atlantis_disable_apply

Disable terraform apply execution

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_disable_apply: false
```

### atlantis_disable_apply_all

Disable atlantis apply without flags

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_disable_apply_all: false
```

### atlantis_disable_repo_locking

Disable repo/project locking

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_disable_repo_locking: false
```

### atlantis_enable_diff_markdown_format

Enable color-coded diff markdown formatting

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_enable_diff_markdown_format: false
```

### atlantis_enabled

Should atlantis helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_enabled: true
```

### atlantis_environment

Extra environment variables as key-value pairs

**_Type:_** dict<br />

#### Default value

```YAML
atlantis_environment: {}
```

### atlantis_environment_secrets

Environment variables sourced from Kubernetes secrets

**_Type:_** list<br />

#### Default value

```YAML
atlantis_environment_secrets: []
```

#### Example usage

```YAML
  atlantis_environment_secrets:
    - name: MY_SECRET
      secretKeyRef:
        name: my-secret
        key: secret-key
```

### atlantis_extra_args

Additional arguments passed to the Atlantis server

**_Type:_** list<br />

#### Default value

```YAML
atlantis_extra_args: []
```

### atlantis_extra_manifests

Extra Kubernetes manifests to deploy alongside Atlantis

**_Type:_** list<br />

#### Default value

```YAML
atlantis_extra_manifests: []
```

### atlantis_extra_volume_mounts

Extra volume mounts

**_Type:_** list<br />

#### Default value

```YAML
atlantis_extra_volume_mounts: []
```

### atlantis_extra_volumes

Extra volumes to mount

**_Type:_** list<br />

#### Default value

```YAML
atlantis_extra_volumes: []
```

### atlantis_gitea_base_url

Gitea base URL

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitea_base_url: ''
```

### atlantis_gitea_enabled

Enable Gitea as VCS provider

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_gitea_enabled: false
```

### atlantis_gitea_secret

Gitea webhook secret for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitea_secret: ''
```

### atlantis_gitea_token

Gitea token for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitea_token: ''
```

### atlantis_gitea_user

Gitea username for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitea_user: ''
```

### atlantis_github_app_enabled

Use GitHub App instead of personal access token

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_github_app_enabled: false
```

### atlantis_github_app_id

GitHub App ID

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_app_id: ''
```

### atlantis_github_app_installation_id

GitHub App installation ID

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_app_installation_id: ''
```

### atlantis_github_app_key

GitHub App private key (PEM format)

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_app_key: ''
```

### atlantis_github_app_secret

GitHub App webhook secret

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_app_secret: ''
```

### atlantis_github_app_slug

GitHub App slug

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_app_slug: ''
```

### atlantis_github_enabled

Enable GitHub as VCS provider

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_github_enabled: false
```

### atlantis_github_hostname

GitHub Enterprise hostname (leave empty for github.com)

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_hostname: ''
```

### atlantis_github_secret

GitHub webhook secret for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_secret: ''
```

### atlantis_github_token

GitHub token for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_token: ''
```

### atlantis_github_user

GitHub username for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_github_user: ''
```

### atlantis_gitlab_enabled

Enable GitLab as VCS provider

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_gitlab_enabled: false
```

### atlantis_gitlab_hostname

GitLab hostname for self-hosted instances

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitlab_hostname: ''
```

### atlantis_gitlab_secret

GitLab webhook secret for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitlab_secret: ''
```

### atlantis_gitlab_token

GitLab token for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitlab_token: ''
```

### atlantis_gitlab_user

GitLab username for Atlantis

**_Type:_** string<br />

#### Default value

```YAML
atlantis_gitlab_user: ''
```

### atlantis_helm_chart_ref

#### Default value

```YAML
atlantis_helm_chart_ref: '{{ atlantis_helm_repo_name }}/atlantis'
```

### atlantis_helm_repo_name

#### Default value

```YAML
atlantis_helm_repo_name: runatlantis
```

### atlantis_helm_repo_url

#### Default value

```YAML
atlantis_helm_repo_url: https://runatlantis.github.io/helm-charts
```

### atlantis_helm_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
atlantis_helm_version: 5.28.0
```

### atlantis_hide_prev_plan_comments

Hide previous plan comments on updated PRs

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_hide_prev_plan_comments: false
```

### atlantis_ingress_annotations

Additional ingress annotations

**_Type:_** dict<br />

#### Default value

```YAML
atlantis_ingress_annotations: {}
```

### atlantis_ingress_certmanager_cluster_issuer

Cert-manager ClusterIssuer name

**_Type:_** string<br />

#### Default value

```YAML
atlantis_ingress_certmanager_cluster_issuer: ''
```

### atlantis_ingress_class

Ingress class name

**_Type:_** string<br />

#### Default value

```YAML
atlantis_ingress_class: ''
```

### atlantis_ingress_enabled

Enable ingress

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_ingress_enabled: false
```

### atlantis_ingress_host

Hostname for ingress

**_Type:_** string<br />

#### Default value

```YAML
atlantis_ingress_host: ''
```

### atlantis_ingress_path

Ingress path

**_Type:_** string<br />

#### Default value

```YAML
atlantis_ingress_path: /
```

### atlantis_ingress_path_type

Ingress path type

**_Type:_** string<br />

#### Default value

```YAML
atlantis_ingress_path_type: ImplementationSpecific
```

### atlantis_ingress_tls_enabled

Enable TLS for ingress

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_ingress_tls_enabled: false
```

### atlantis_ingress_tls_secret_name

Secret name for TLS certificate

**_Type:_** string<br />

#### Default value

```YAML
atlantis_ingress_tls_secret_name: atlantis-tls
```

### atlantis_init_containers

Init containers to run before Atlantis

**_Type:_** list<br />

#### Default value

```YAML
atlantis_init_containers: []
```

### atlantis_log_level

Log level for Atlantis. Options: debug, info, warn, error

**_Type:_** string<br />

#### Default value

```YAML
atlantis_log_level: info
```

### atlantis_namespace

K8s namespace to install the atlantis chart

**_Type:_** string<br />

#### Default value

```YAML
atlantis_namespace: atlantis
```

### atlantis_org_allowlist

Allowlist of repositories Atlantis can operate on.

**_Type:_** string<br />

#### Default value

```YAML
atlantis_org_allowlist: ''
```

#### Example usage

```YAML
  atlantis_org_allowlist: "github.com/myorg/*"
```

### atlantis_replica_count

Number of Atlantis replicas

**_Type:_** integer<br />

#### Default value

```YAML
atlantis_replica_count: 1
```

### atlantis_repo_config

Server-side repository configuration

**_Type:_** dict<br />

#### Default value

```YAML
atlantis_repo_config: {}
```

#### Example usage

```YAML
  atlantis_repo_config:
    repos:
      - id: "/.*/
        allowed_overrides:
          - workflow
        apply_requirements:
          - approved
```

### atlantis_resources

Resource requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
atlantis_resources: {}
```

#### Example usage

```YAML
  atlantis_resources:
    requests:
      memory: 256Mi
      cpu: 100m
    limits:
      memory: 512Mi
      cpu: 200m
```

### atlantis_service_port

Service port

**_Type:_** integer<br />

#### Default value

```YAML
atlantis_service_port: 80
```

### atlantis_service_target_port

Target port on the container

**_Type:_** integer<br />

#### Default value

```YAML
atlantis_service_target_port: 4141
```

### atlantis_service_type

Kubernetes Service type. Options: ClusterIP, NodePort, LoadBalancer

**_Type:_** string<br />

#### Default value

```YAML
atlantis_service_type: NodePort
```

### atlantis_url

External URL of the Atlantis server (used for webhook callbacks).
Required when using ingress.

**_Type:_** string<br />

#### Default value

```YAML
atlantis_url: ''
```

#### Example usage

```YAML
  atlantis_url: "https://atlantis.example.com"
```

### atlantis_vcs_secret_name

Name of an existing Kubernetes secret containing VCS credentials.
When set, the chart uses this secret instead of creating one from variables.

**_Type:_** string<br />

#### Default value

```YAML
atlantis_vcs_secret_name: ''
```

### atlantis_volume_claim_enabled

Enable PersistentVolumeClaim for Atlantis data

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_volume_claim_enabled: true
```

### atlantis_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
atlantis_wait_install: true
```

## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
