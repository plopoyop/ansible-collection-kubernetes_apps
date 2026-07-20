# external_secrets

Install and configure External Secrets Operator on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [external_secrets_additional_config](#external_secrets_additional_config)
  - [external_secrets_cert_controller_resources](#external_secrets_cert_controller_resources)
  - [external_secrets_cluster_external_secrets](#external_secrets_cluster_external_secrets)
  - [external_secrets_cluster_secret_stores](#external_secrets_cluster_secret_stores)
  - [external_secrets_crd_force_upgrade](#external_secrets_crd_force_upgrade)
  - [external_secrets_crd_version](#external_secrets_crd_version)
  - [external_secrets_deployment_name](#external_secrets_deployment_name)
  - [external_secrets_enabled](#external_secrets_enabled)
  - [external_secrets_external_secrets](#external_secrets_external_secrets)
  - [external_secrets_helm_chart_version](#external_secrets_helm_chart_version)
  - [external_secrets_install_crds](#external_secrets_install_crds)
  - [external_secrets_namespace](#external_secrets_namespace)
  - [external_secrets_push_secrets](#external_secrets_push_secrets)
  - [external_secrets_replica_count](#external_secrets_replica_count)
  - [external_secrets_resources](#external_secrets_resources)
  - [external_secrets_secret_stores](#external_secrets_secret_stores)
  - [external_secrets_service_account_annotations](#external_secrets_service_account_annotations)
  - [external_secrets_upgrade_crd](#external_secrets_upgrade_crd)
  - [external_secrets_wait_install](#external_secrets_wait_install)
  - [external_secrets_webhook_resources](#external_secrets_webhook_resources)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### external_secrets_additional_config

Additional configuration to merge with the helm values.
This allows to add any configuration not explicitly exposed by this role.

**_Type:_** dict<br />

#### Default value

```YAML
external_secrets_additional_config: {}
```

### external_secrets_cert_controller_resources

Resources requests and limits for the External Secrets Operator cert controller

**_Type:_** dict<br />

#### Default value

```YAML
external_secrets_cert_controller_resources: {}
```

### external_secrets_cluster_external_secrets

List of cluster-wide ClusterExternalSecret resources to create
https://external-secrets.io/latest/api/clusterexternalsecret/

**_Type:_** list<br />

#### Default value

```YAML
external_secrets_cluster_external_secrets: []
```

### external_secrets_cluster_secret_stores

List of cluster-wide ClusterSecretStore resources to create
https://external-secrets.io/latest/api/clustersecretstore/

**_Type:_** list<br />

#### Default value

```YAML
external_secrets_cluster_secret_stores: []
```

### external_secrets_crd_force_upgrade

Force CRDs upgrade, even if the helm release is not in a "deployed" state

**_Type:_** boolean<br />

#### Default value

```YAML
external_secrets_crd_force_upgrade: false
```

### external_secrets_crd_version

Git ref (tag or branch) of the upstream CRDs bundle to apply

**_Type:_** string<br />

#### Default value

```YAML
external_secrets_crd_version: v2.8.0
```

### external_secrets_deployment_name

Deployment name for External Secrets Operator helm chart

**_Type:_** string<br />

#### Default value

```YAML
external_secrets_deployment_name: external-secrets
```

### external_secrets_enabled

Should External Secrets Operator helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
external_secrets_enabled: true
```

### external_secrets_external_secrets

List of namespaced ExternalSecret resources to create
https://external-secrets.io/latest/api/externalsecret/

**_Type:_** list<br />

#### Default value

```YAML
external_secrets_external_secrets: []
```

#### Example usage

```YAML
external_secrets_external_secrets:
  - name: "database-credentials"
    namespace: "my-app"
    spec:
      refreshInterval: "1h"
      secretStoreRef:
        name: "vault-backend"
        kind: "SecretStore"
      target:
        name: "database-credentials"
      data:
        - secretKey: "password"
          remoteRef:
            key: "database/config"
            property: "password"
```

### external_secrets_helm_chart_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
external_secrets_helm_chart_version: 2.8.0
```

### external_secrets_install_crds

Let the helm chart install and manage the External Secrets Operator CRDs

**_Type:_** boolean<br />

#### Default value

```YAML
external_secrets_install_crds: true
```

### external_secrets_namespace

K8s namespace to install the External Secrets Operator chart

**_Type:_** string<br />

#### Default value

```YAML
external_secrets_namespace: external-secrets
```

### external_secrets_push_secrets

List of namespaced PushSecret resources to create
https://external-secrets.io/latest/api/pushsecret/

**_Type:_** list<br />

#### Default value

```YAML
external_secrets_push_secrets: []
```

### external_secrets_replica_count

Number of External Secrets Operator controller replicas

**_Type:_** integer<br />

#### Default value

```YAML
external_secrets_replica_count: 1
```

### external_secrets_resources

Resources requests and limits for the External Secrets Operator controller

**_Type:_** dict<br />

#### Default value

```YAML
external_secrets_resources: {}
```

### external_secrets_secret_stores

List of namespaced SecretStore resources to create
https://external-secrets.io/latest/api/secretstore/

**_Type:_** list<br />

#### Default value

```YAML
external_secrets_secret_stores: []
```

#### Example usage

```YAML
external_secrets_secret_stores:
  - name: "vault-backend"
    namespace: "my-app"
    spec:
      provider:
        vault:
          server: "https://vault.example.com"
          path: "secret"
          version: "v2"
          auth:
            tokenSecretRef:
              name: "vault-token"
              key: "token"
```

### external_secrets_service_account_annotations

Annotations to add to the External Secrets Operator service account
(e.g. to bind a cloud IAM role for IRSA / Workload Identity)

**_Type:_** dict<br />

#### Default value

```YAML
external_secrets_service_account_annotations: {}
```

### external_secrets_upgrade_crd

Upgrade the CRDs from the pinned upstream bundle manifest before the helm
upgrade. Useful when helm does not update the CRDs on chart upgrade.

**_Type:_** boolean<br />

#### Default value

```YAML
external_secrets_upgrade_crd: false
```

### external_secrets_wait_install

Wait for the helm release resources to be ready before completing the install

**_Type:_** boolean<br />

#### Default value

```YAML
external_secrets_wait_install: true
```

### external_secrets_webhook_resources

Resources requests and limits for the External Secrets Operator webhook

**_Type:_** dict<br />

#### Default value

```YAML
external_secrets_webhook_resources: {}
```

## Discovered Tags

**_crds_**

**_external_secrets_**

**_helm_chart_**

**_helm_repository_**

**_install_**

**_manifest_**

**_namespace_**

**_uninstall_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
