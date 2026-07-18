# warpgate

Install and configure Warpgate on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [warpgate_additional_config](#warpgate_additional_config)
  - [warpgate_config_env_vars](#warpgate_config_env_vars)
  - [warpgate_data_pvc_enabled](#warpgate_data_pvc_enabled)
  - [warpgate_data_pvc_size](#warpgate_data_pvc_size)
  - [warpgate_data_pvc_storage_class](#warpgate_data_pvc_storage_class)
  - [warpgate_database_url](#warpgate_database_url)
  - [warpgate_deployment_name](#warpgate_deployment_name)
  - [warpgate_enabled](#warpgate_enabled)
  - [warpgate_external_http_host](#warpgate_external_http_host)
  - [warpgate_external_http_port](#warpgate_external_http_port)
  - [warpgate_external_kubernetes_host](#warpgate_external_kubernetes_host)
  - [warpgate_external_kubernetes_port](#warpgate_external_kubernetes_port)
  - [warpgate_external_mysql_host](#warpgate_external_mysql_host)
  - [warpgate_external_mysql_port](#warpgate_external_mysql_port)
  - [warpgate_external_postgres_host](#warpgate_external_postgres_host)
  - [warpgate_external_postgres_port](#warpgate_external_postgres_port)
  - [warpgate_external_ssh_host](#warpgate_external_ssh_host)
  - [warpgate_external_ssh_port](#warpgate_external_ssh_port)
  - [warpgate_extra_manifests](#warpgate_extra_manifests)
  - [warpgate_force_upgrade](#warpgate_force_upgrade)
  - [warpgate_helm_chart_version](#warpgate_helm_chart_version)
  - [warpgate_ingress_annotations](#warpgate_ingress_annotations)
  - [warpgate_ingress_class_name](#warpgate_ingress_class_name)
  - [warpgate_ingress_enabled](#warpgate_ingress_enabled)
  - [warpgate_ingress_hostname](#warpgate_ingress_hostname)
  - [warpgate_ingress_tls_enabled](#warpgate_ingress_tls_enabled)
  - [warpgate_ingress_tls_secret_name](#warpgate_ingress_tls_secret_name)
  - [warpgate_namespace](#warpgate_namespace)
  - [warpgate_recordings_enabled](#warpgate_recordings_enabled)
  - [warpgate_resources](#warpgate_resources)
  - [warpgate_service_annotations](#warpgate_service_annotations)
  - [warpgate_service_port_http](#warpgate_service_port_http)
  - [warpgate_service_port_kubernetes](#warpgate_service_port_kubernetes)
  - [warpgate_service_port_mysql](#warpgate_service_port_mysql)
  - [warpgate_service_port_pgsql](#warpgate_service_port_pgsql)
  - [warpgate_service_port_ssh](#warpgate_service_port_ssh)
  - [warpgate_service_type](#warpgate_service_type)
  - [warpgate_setup_credentials_secret](#warpgate_setup_credentials_secret)
  - [warpgate_setup_enabled](#warpgate_setup_enabled)
  - [warpgate_setup_type](#warpgate_setup_type)
  - [warpgate_sso_providers](#warpgate_sso_providers)
  - [warpgate_wait_install](#warpgate_wait_install)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### warpgate_additional_config

Additional configuration to merge with the helm values.
This allows to add any configuration not explicitly exposed by this role.

**_Type:_** dict<br />

#### Default value

```YAML
warpgate_additional_config: {}
```

### warpgate_config_env_vars

Environment variables to substitute in Warpgate config (config_env_var_replace).
Keys are env var names, values are "secret-name/key" references.

**_Type:_** dict<br />

#### Default value

```YAML
warpgate_config_env_vars: {}
```

### warpgate_data_pvc_enabled

Enable persistent storage for Warpgate data

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_data_pvc_enabled: true
```

### warpgate_data_pvc_size

Size of the persistent volume for Warpgate data

**_Type:_** string<br />

#### Default value

```YAML
warpgate_data_pvc_size: 10Gi
```

### warpgate_data_pvc_storage_class

Storage class for the persistent volume

**_Type:_** string<br />

#### Default value

```YAML
warpgate_data_pvc_storage_class:
```

### warpgate_database_url

External database URL (PostgreSQL). Leave empty to use built-in SQLite.
Use $ENV_VAR syntax with warpgate_config_env_vars for secret substitution.

**_Type:_** string<br />

#### Default value

```YAML
warpgate_database_url: ''
```

### warpgate_deployment_name

Deployment name for Warpgate helm chart

**_Type:_** string<br />

#### Default value

```YAML
warpgate_deployment_name: warpgate
```

### warpgate_enabled

Should Warpgate helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_enabled: true
```

### warpgate_external_http_host

External HTTP hostname shown in the Warpgate UI.

**_Type:_** string<br />

#### Default value

```YAML
warpgate_external_http_host: ''
```

### warpgate_external_http_port

External HTTP port shown in the Warpgate UI. 0 = unset.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_external_http_port: 0
```

### warpgate_external_kubernetes_host

External Kubernetes hostname shown in the Warpgate UI.

**_Type:_** string<br />

#### Default value

```YAML
warpgate_external_kubernetes_host: ''
```

### warpgate_external_kubernetes_port

External Kubernetes port shown in the Warpgate UI. 0 = unset.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_external_kubernetes_port: 0
```

### warpgate_external_mysql_host

External MySQL hostname shown in the Warpgate UI.

**_Type:_** string<br />

#### Default value

```YAML
warpgate_external_mysql_host: ''
```

### warpgate_external_mysql_port

External MySQL port shown in the Warpgate UI. 0 = unset.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_external_mysql_port: 0
```

### warpgate_external_postgres_host

External PostgreSQL hostname shown in the Warpgate UI.

**_Type:_** string<br />

#### Default value

```YAML
warpgate_external_postgres_host: ''
```

### warpgate_external_postgres_port

External PostgreSQL port shown in the Warpgate UI. 0 = unset.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_external_postgres_port: 0
```

### warpgate_external_ssh_host

External SSH hostname shown in the Warpgate UI connection strings.
Leave empty to fall back to the global external host.

**_Type:_** string<br />

#### Default value

```YAML
warpgate_external_ssh_host: ''
```

### warpgate_external_ssh_port

External SSH port shown in the Warpgate UI connection strings. 0 = unset.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_external_ssh_port: 0
```

### warpgate_extra_manifests

Extra Kubernetes manifests to apply in the Warpgate namespace
(e.g. additional Secrets, ConfigMaps, ExternalSecrets).

**_Type:_** list<br />

#### Default value

```YAML
warpgate_extra_manifests: []
```

### warpgate_force_upgrade

Delete the immutable Warpgate setup Job before running `helm upgrade`.

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_force_upgrade: false
```

### warpgate_helm_chart_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
warpgate_helm_chart_version: 0.0.6
```

### warpgate_ingress_annotations

Annotations for Warpgate ingress

**_Type:_** dict<br />

#### Default value

```YAML
warpgate_ingress_annotations: {}
```

### warpgate_ingress_class_name

Ingress class name for Warpgate ingress

**_Type:_** string<br />

#### Default value

```YAML
warpgate_ingress_class_name:
```

### warpgate_ingress_enabled

Enable ingress for Warpgate HTTP interface

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_ingress_enabled: false
```

### warpgate_ingress_hostname

Hostname for Warpgate ingress

**_Type:_** string<br />

#### Default value

```YAML
warpgate_ingress_hostname:
```

### warpgate_ingress_tls_enabled

Enable TLS for Warpgate ingress

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_ingress_tls_enabled: false
```

### warpgate_ingress_tls_secret_name

Secret name for Warpgate TLS certificate

**_Type:_** string<br />

#### Default value

```YAML
warpgate_ingress_tls_secret_name:
```

### warpgate_namespace

K8s namespace to install the Warpgate chart

**_Type:_** string<br />

#### Default value

```YAML
warpgate_namespace: warpgate
```

### warpgate_recordings_enabled

Enable Warpgate session recording. Disabling avoids known protocol-parser
issues on some Kubernetes WebSocket subprotocols (e.g. `base64.binary.k8s.io`
used by Headlamp) at the cost of losing audit trails.

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_recordings_enabled: true
```

### warpgate_resources

Resource requests and limits for Warpgate pod

**_Type:_** dict<br />

#### Default value

```YAML
warpgate_resources: {}
```

### warpgate_service_annotations

Annotations for Warpgate Kubernetes service

**_Type:_** dict<br />

#### Default value

```YAML
warpgate_service_annotations: {}
```

### warpgate_service_port_http

Service port for HTTP protocol. Set to 0 to disable.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_service_port_http: 8888
```

### warpgate_service_port_kubernetes

Service port for Kubernetes proxy protocol. Set to 0 to disable.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_service_port_kubernetes: 8443
```

### warpgate_service_port_mysql

Service port for MySQL protocol. Set to 0 to disable.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_service_port_mysql: 33306
```

### warpgate_service_port_pgsql

Service port for PostgreSQL protocol. Set to 0 to disable.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_service_port_pgsql: 55432
```

### warpgate_service_port_ssh

Service port for SSH protocol. Set to 0 to disable.

**_Type:_** integer<br />

#### Default value

```YAML
warpgate_service_port_ssh: 2222
```

### warpgate_service_type

Kubernetes service type for Warpgate

**_Type:_** string<br />

#### Default value

```YAML
warpgate_service_type: ClusterIP
```

### warpgate_setup_credentials_secret

Name of the secret containing setup credentials (WARPGATE_ADMIN_PASSWORD)

**_Type:_** string<br />

#### Default value

```YAML
warpgate_setup_credentials_secret: ''
```

### warpgate_setup_enabled

Enable automatic setup (creates initial admin user)

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_setup_enabled: true
```

### warpgate_setup_type

Setup type: "job" or "podinit"

**_Type:_** string<br />

#### Default value

```YAML
warpgate_setup_type: job
```

### warpgate_sso_providers

SSO providers configuration for Warpgate.
Each item should have: name, label, provider (type, client_id, client_secret, tenant/issuer_url)

**_Type:_** list<br />

#### Default value

```YAML
warpgate_sso_providers: []
```

### warpgate_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
warpgate_wait_install: false
```

## Discovered Tags

**_helm_chart_**

**_install_**

**_manifest_**

**_namespace_**

**_uninstall_**

**_warpgate_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
