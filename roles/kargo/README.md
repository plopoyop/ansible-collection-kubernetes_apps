# kargo

Install and configure Kargo on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [kargo_additional_config](#kargo_additional_config)
  - [kargo_api_admin_account_enabled](#kargo_api_admin_account_enabled)
  - [kargo_api_admin_password_hash](#kargo_api_admin_password_hash)
  - [kargo_api_admin_token_signing_key](#kargo_api_admin_token_signing_key)
  - [kargo_api_admin_token_ttl](#kargo_api_admin_token_ttl)
  - [kargo_api_enabled](#kargo_api_enabled)
  - [kargo_api_host](#kargo_api_host)
  - [kargo_api_ingress_annotations](#kargo_api_ingress_annotations)
  - [kargo_api_ingress_class_name](#kargo_api_ingress_class_name)
  - [kargo_api_ingress_enabled](#kargo_api_ingress_enabled)
  - [kargo_api_ingress_tls_enabled](#kargo_api_ingress_tls_enabled)
  - [kargo_api_ingress_tls_secret_name](#kargo_api_ingress_tls_secret_name)
  - [kargo_api_ingress_tls_self_signed_cert](#kargo_api_ingress_tls_self_signed_cert)
  - [kargo_api_log_level](#kargo_api_log_level)
  - [kargo_api_oidc_additional_scopes](#kargo_api_oidc_additional_scopes)
  - [kargo_api_oidc_cli_client_id](#kargo_api_oidc_cli_client_id)
  - [kargo_api_oidc_client_id](#kargo_api_oidc_client_id)
  - [kargo_api_oidc_enabled](#kargo_api_oidc_enabled)
  - [kargo_api_oidc_issuer_url](#kargo_api_oidc_issuer_url)
  - [kargo_api_oidc_username_claim](#kargo_api_oidc_username_claim)
  - [kargo_api_secret_name](#kargo_api_secret_name)
  - [kargo_api_service_type](#kargo_api_service_type)
  - [kargo_cluster_config](#kargo_cluster_config)
  - [kargo_cluster_promotion_tasks](#kargo_cluster_promotion_tasks)
  - [kargo_components_wait_timeout](#kargo_components_wait_timeout)
  - [kargo_controller_enabled](#kargo_controller_enabled)
  - [kargo_crds_install](#kargo_crds_install)
  - [kargo_crds_keep](#kargo_crds_keep)
  - [kargo_credentials](#kargo_credentials)
  - [kargo_deployment_name](#kargo_deployment_name)
  - [kargo_enabled](#kargo_enabled)
  - [kargo_extra_manifests](#kargo_extra_manifests)
  - [kargo_garbage_collector_enabled](#kargo_garbage_collector_enabled)
  - [kargo_helm_chart_version](#kargo_helm_chart_version)
  - [kargo_management_controller_enabled](#kargo_management_controller_enabled)
  - [kargo_namespace](#kargo_namespace)
  - [kargo_project_configs](#kargo_project_configs)
  - [kargo_projects](#kargo_projects)
  - [kargo_projects_wait_timeout](#kargo_projects_wait_timeout)
  - [kargo_promotion_tasks](#kargo_promotion_tasks)
  - [kargo_shared_resources_namespace](#kargo_shared_resources_namespace)
  - [kargo_stages](#kargo_stages)
  - [kargo_wait_install](#kargo_wait_install)
  - [kargo_warehouses](#kargo_warehouses)
  - [kargo_warehouses_default_interval](#kargo_warehouses_default_interval)
  - [kargo_webhooks_register](#kargo_webhooks_register)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### kargo_additional_config

Additional configuration recursively merged with the rendered helm values.
Use it to set any chart option not explicitly exposed by this role.

**_Type:_** dict<br />

#### Default value

```YAML
kargo_additional_config: {}
```

### kargo_api_admin_account_enabled

Whether to enable the built-in admin account

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_api_admin_account_enabled: true
```

### kargo_api_admin_password_hash

Bcrypt password hash for the admin account. Required unless
`kargo_api_secret_name` references an existing secret.

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_admin_password_hash: ''
```

### kargo_api_admin_token_signing_key

Key used to sign ID tokens (JWTs) for the admin account. Required
unless `kargo_api_secret_name` references an existing secret. Can
be generated with:
`openssl rand -base64 29 | tr -d "=+/" | cut -c1-32`.

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_admin_token_signing_key: ''
```

### kargo_api_admin_token_ttl

Validity duration of admin account ID tokens (e.g. "24h", "1h").

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_admin_token_ttl: 24h
```

### kargo_api_enabled

Whether the Kargo API server is enabled

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_api_enabled: true
```

### kargo_api_host

Domain name where the Kargo API server will be accessible. Used to
generate the Ingress, certificates and OpenID Connect callback URLs
when applicable.

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_host: localhost
```

### kargo_api_ingress_annotations

Annotations to add to the Kargo API server ingress

**_Type:_** dict<br />

#### Default value

```YAML
kargo_api_ingress_annotations: {}
```

### kargo_api_ingress_class_name

Ingress class name for the Kargo API server ingress

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_ingress_class_name:
```

### kargo_api_ingress_enabled

Enable ingress for the Kargo API server

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_api_ingress_enabled: false
```

### kargo_api_ingress_tls_enabled

Enable TLS on the Kargo API server ingress

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_api_ingress_tls_enabled: true
```

### kargo_api_ingress_tls_secret_name

Name of the cert Secret bound to the API ingress

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_ingress_tls_secret_name: kargo-api-ingress-cert
```

### kargo_api_ingress_tls_self_signed_cert

Generate a self-signed certificate via cert-manager for the API
ingress. When false, a Secret named by
`kargo_api_ingress_tls_secret_name` must already exist in the Kargo
namespace.

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_api_ingress_tls_self_signed_cert: true
```

### kargo_api_log_level

Log level for the API server. One of ERROR, INFO, DEBUG, TRACE.

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_log_level: INFO
```

### kargo_api_oidc_additional_scopes

Additional scopes to request from the OIDC provider on top of
`openid`, `profile` and `email`.

**_Type:_** list<br />

#### Default value

```YAML
kargo_api_oidc_additional_scopes:
  - groups
```

### kargo_api_oidc_cli_client_id

OIDC client ID used by the Kargo CLI when the provider requires a
distinct client for localhost callbacks.

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_oidc_cli_client_id: ''
```

### kargo_api_oidc_client_id

OIDC client ID used by the Kargo UI/CLI

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_oidc_client_id: ''
```

### kargo_api_oidc_enabled

Enable OIDC authentication on the Kargo API server

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_api_oidc_enabled: false
```

### kargo_api_oidc_issuer_url

OIDC issuer URL (ignored when Dex is enabled by the chart)

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_oidc_issuer_url: ''
```

### kargo_api_oidc_username_claim

OIDC claim to use as the username

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_oidc_username_claim: email
```

### kargo_api_secret_name

Name of an existing Secret holding the `ADMIN_ACCOUNT_PASSWORD_HASH`
and `ADMIN_ACCOUNT_TOKEN_SIGNING_KEY` values. When set, those values
will not be generated from the role variables above.

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_secret_name: ''
```

### kargo_api_service_type

Kubernetes service type for the Kargo API server

**_Type:_** string<br />

#### Default value

```YAML
kargo_api_service_type: ClusterIP
```

### kargo_cluster_config

Spec of the cluster-wide ClusterConfig (always named `cluster`).
Not created when empty.
https://docs.kargo.io/operator-guide/cluster-configuration

**_Type:_** dict<br />

#### Default value

```YAML
kargo_cluster_config: {}
```

### kargo_cluster_promotion_tasks

List of ClusterPromotionTasks, reusable by every Project.
Item keys: `name`, `steps`, optional `vars`, `labels`,
`annotations` and `state`.
Kargo expressions (`${{ ... }}`) must be tagged `!unsafe`, otherwise
Ansible tries to template them.
https://docs.kargo.io/user-guide/reference-docs/promotion-tasks

**_Type:_** list<br />

#### Default value

```YAML
kargo_cluster_promotion_tasks: []
```

### kargo_components_wait_timeout

Seconds to wait for the webhooks server and the management controller
to be available before applying Kargo resources, when
`kargo_wait_install` is false.

**_Type:_** number<br />

#### Default value

```YAML
kargo_components_wait_timeout: 300
```

### kargo_controller_enabled

Whether the Kargo controller is enabled

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_controller_enabled: true
```

### kargo_crds_install

Indicates if Custom Resource Definitions should be installed and
upgraded as part of the release. If false, CRDs are only installed
when missing.

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_crds_install: true
```

### kargo_crds_keep

Indicates if Custom Resource Definitions should be kept when a
release is uninstalled.

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_crds_keep: true
```

### kargo_credentials

List of repository credentials. Item keys: `name`, `type`
(git, helm, image or generic), `repo_url` (not used by generic
credentials), optional `repo_url_is_regex`, `project` (defaults to the shared resources
namespace), `parameters` (extra stringData such as `username`
and `password`), `labels` and `state`.
https://docs.kargo.io/user-guide/security/managing-secrets

**_Type:_** list<br />

#### Default value

```YAML
kargo_credentials: []
```

### kargo_deployment_name

Deployment name for Kargo helm chart

**_Type:_** string<br />

#### Default value

```YAML
kargo_deployment_name: kargo
```

### kargo_enabled

Should Kargo helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_enabled: true
```

### kargo_extra_manifests

Extra Kubernetes manifests to apply in the Kargo namespace, before the
helm chart is installed (e.g. the Secret referenced by
`kargo_api_secret_name`, additional ServiceAccounts). Kargo resources
depend on the chart CRDs: use the dedicated variables below instead.

**_Type:_** list<br />

#### Default value

```YAML
kargo_extra_manifests: []
```

### kargo_garbage_collector_enabled

Whether the Kargo garbage collector CronJob is enabled

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_garbage_collector_enabled: true
```

### kargo_helm_chart_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
kargo_helm_chart_version: 1.10.4
```

### kargo_management_controller_enabled

Whether the Kargo management controller is enabled

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_management_controller_enabled: true
```

### kargo_namespace

K8s namespace to install the Kargo chart

**_Type:_** string<br />

#### Default value

```YAML
kargo_namespace: kargo
```

### kargo_project_configs

List of ProjectConfigs, at most one per Project. Item keys:
`project`, optional `promotion_policies`, `webhook_receivers`,
`additional_config` (merged into spec), `labels`, `annotations`
and `state`.
https://docs.kargo.io/user-guide/how-to-guides/working-with-projects

**_Type:_** list<br />

#### Default value

```YAML
kargo_project_configs: []
```

### kargo_projects

List of Kargo Projects. Kargo creates a namespace of the same
name for each of them. Item keys: `name`, optional `labels`,
`annotations` and `state`.
https://docs.kargo.io/user-guide/how-to-guides/working-with-projects

**_Type:_** list<br />

#### Default value

```YAML
kargo_projects: []
```

### kargo_projects_wait_timeout

Seconds to wait for a Project (and its namespace) to be ready

**_Type:_** number<br />

#### Default value

```YAML
kargo_projects_wait_timeout: 120
```

### kargo_promotion_tasks

List of PromotionTasks. Item keys: `name`, `project`, `steps`,
optional `vars`, `labels`, `annotations` and `state`.
Kargo expressions (`${{ ... }}`) must be tagged `!unsafe`, otherwise
Ansible tries to template them.
https://docs.kargo.io/user-guide/reference-docs/promotion-tasks

**_Type:_** list<br />

#### Default value

```YAML
kargo_promotion_tasks: []
```

### kargo_shared_resources_namespace

Namespace holding resources shared across Projects, such as
credentials. Used as default namespace for `kargo_credentials`
entries without a `project`.

**_Type:_** string<br />

#### Default value

```YAML
kargo_shared_resources_namespace: kargo-shared-resources
```

### kargo_stages

List of Stages. Item keys: `name`, `project`,
`requested_freight`, optional `promotion_template`, `vars`,
`verification`, `shard`, `additional_config` (merged into spec),
`labels`, `annotations` and `state`.
Kargo expressions (`${{ ... }}`) must be tagged `!unsafe`, otherwise
Ansible tries to template them.
https://docs.kargo.io/user-guide/how-to-guides/working-with-stages

**_Type:_** list<br />

#### Default value

```YAML
kargo_stages: []
```

### kargo_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_wait_install: true
```

### kargo_warehouses

List of Warehouses. Item keys: `name`, `project`,
`subscriptions`, optional `interval`, `freight_creation_policy`,
`freight_creation_criteria`, `shard`, `additional_config`
(merged into spec), `labels`, `annotations` and `state`.
https://docs.kargo.io/user-guide/how-to-guides/working-with-warehouses

**_Type:_** list<br />

#### Default value

```YAML
kargo_warehouses: []
```

### kargo_warehouses_default_interval

Default polling interval of Warehouses

**_Type:_** string<br />

#### Default value

```YAML
kargo_warehouses_default_interval: 5m0s
```

### kargo_webhooks_register

Whether to register ValidatingWebhookConfiguration and
MutatingWebhookConfiguration resources.

**_Type:_** boolean<br />

#### Default value

```YAML
kargo_webhooks_register: true
```

## Discovered Tags

**_always_**

**_helm_chart_**

**_manifest_**

**_namespace_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
