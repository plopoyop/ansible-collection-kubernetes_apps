# headlamp

Install Headlamp Kubernetes dashboard

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [headlamp_additional_helm_values](#headlamp_additional_helm_values)
  - [headlamp_admin_cluster_role](#headlamp_admin_cluster_role)
  - [headlamp_admin_service_account_name](#headlamp_admin_service_account_name)
  - [headlamp_affinity](#headlamp_affinity)
  - [headlamp_base_url](#headlamp_base_url)
  - [headlamp_create_admin_token](#headlamp_create_admin_token)
  - [headlamp_deployment_name](#headlamp_deployment_name)
  - [headlamp_enable_helm](#headlamp_enable_helm)
  - [headlamp_enabled](#headlamp_enabled)
  - [headlamp_external_clusters](#headlamp_external_clusters)
  - [headlamp_helm_chart_version](#headlamp_helm_chart_version)
  - [headlamp_in_cluster](#headlamp_in_cluster)
  - [headlamp_in_cluster_context_name](#headlamp_in_cluster_context_name)
  - [headlamp_ingress_annotations](#headlamp_ingress_annotations)
  - [headlamp_ingress_class_name](#headlamp_ingress_class_name)
  - [headlamp_ingress_enabled](#headlamp_ingress_enabled)
  - [headlamp_ingress_hosts](#headlamp_ingress_hosts)
  - [headlamp_ingress_tls](#headlamp_ingress_tls)
  - [headlamp_namespace](#headlamp_namespace)
  - [headlamp_node_selector](#headlamp_node_selector)
  - [headlamp_oidc_client_id](#headlamp_oidc_client_id)
  - [headlamp_oidc_client_secret](#headlamp_oidc_client_secret)
  - [headlamp_oidc_issuer_url](#headlamp_oidc_issuer_url)
  - [headlamp_oidc_scopes](#headlamp_oidc_scopes)
  - [headlamp_replica_count](#headlamp_replica_count)
  - [headlamp_resources](#headlamp_resources)
  - [headlamp_service_port](#headlamp_service_port)
  - [headlamp_service_type](#headlamp_service_type)
  - [headlamp_tolerations](#headlamp_tolerations)
  - [headlamp_wait_install](#headlamp_wait_install)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### headlamp_additional_helm_values

Additional helm values to be passed to the chart

**_Type:_** dict<br />

#### Default value

```YAML
headlamp_additional_helm_values: {}
```

### headlamp_admin_cluster_role

ClusterRole to bind to the admin ServiceAccount

**_Type:_** string<br />

#### Default value

```YAML
headlamp_admin_cluster_role: cluster-admin
```

### headlamp_admin_service_account_name

Name of the admin ServiceAccount

**_Type:_** string<br />

#### Default value

```YAML
headlamp_admin_service_account_name: headlamp-admin
```

### headlamp_affinity

Affinity

**_Type:_** dict<br />

#### Default value

```YAML
headlamp_affinity: {}
```

### headlamp_base_url

Base URL path at which Headlamp should run

**_Type:_** string<br />

#### Default value

```YAML
headlamp_base_url: ''
```

### headlamp_create_admin_token

Create a ServiceAccount with admin token for Headlamp authentication

**_Type:_** boolean<br />

#### Default value

```YAML
headlamp_create_admin_token: true
```

### headlamp_deployment_name

Deployment name for Headlamp helm chart

**_Type:_** string<br />

#### Default value

```YAML
headlamp_deployment_name: headlamp
```

### headlamp_enable_helm

Enable Helm integration in Headlamp

**_Type:_** boolean<br />

#### Default value

```YAML
headlamp_enable_helm: false
```

### headlamp_enabled

Should Headlamp helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
headlamp_enabled: true
```

### headlamp_external_clusters

List of external clusters to add to Headlamp.
Each entry creates a Secret with the kubeconfig annotated for Headlamp.

**_Type:_** list<br />

#### Default value

```YAML
headlamp_external_clusters: []
```

#### Example usage

```YAML
  headlamp_external_clusters:
    - name: "prod"
      kubeconfig: "{{ clusters['prod'].kubeconfig }}"
```

### headlamp_helm_chart_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
headlamp_helm_chart_version: 0.41.0
```

### headlamp_in_cluster

Run Headlamp in-cluster mode

**_Type:_** boolean<br />

#### Default value

```YAML
headlamp_in_cluster: true
```

### headlamp_in_cluster_context_name

Display name for the local in-cluster context

**_Type:_** string<br />

#### Default value

```YAML
headlamp_in_cluster_context_name: main
```

### headlamp_ingress_annotations

Ingress annotations

**_Type:_** dict<br />

#### Default value

```YAML
headlamp_ingress_annotations: {}
```

### headlamp_ingress_class_name

Ingress class name

**_Type:_** string<br />

#### Default value

```YAML
headlamp_ingress_class_name: ''
```

### headlamp_ingress_enabled

Enable ingress

**_Type:_** boolean<br />

#### Default value

```YAML
headlamp_ingress_enabled: false
```

### headlamp_ingress_hosts

Ingress hosts configuration

**_Type:_** list<br />

#### Default value

```YAML
headlamp_ingress_hosts: []
```

#### Example usage

```YAML
  headlamp_ingress_hosts:
    - host: headlamp.example.com
      paths:
        - path: /
          type: ImplementationSpecific
```

### headlamp_ingress_tls

Ingress TLS configuration

**_Type:_** list<br />

#### Default value

```YAML
headlamp_ingress_tls: []
```

### headlamp_namespace

K8s namespace to install the Headlamp chart

**_Type:_** string<br />

#### Default value

```YAML
headlamp_namespace: headlamp
```

### headlamp_node_selector

Node selector

**_Type:_** dict<br />

#### Default value

```YAML
headlamp_node_selector: {}
```

### headlamp_oidc_client_id

OIDC client ID

**_Type:_** string<br />

#### Default value

```YAML
headlamp_oidc_client_id: ''
```

### headlamp_oidc_client_secret

OIDC client secret

**_Type:_** string<br />

#### Default value

```YAML
headlamp_oidc_client_secret: ''
```

### headlamp_oidc_issuer_url

OIDC issuer URL

**_Type:_** string<br />

#### Default value

```YAML
headlamp_oidc_issuer_url: ''
```

### headlamp_oidc_scopes

OIDC scopes

**_Type:_** string<br />

#### Default value

```YAML
headlamp_oidc_scopes: ''
```

### headlamp_replica_count

Number of desired pods

**_Type:_** integer<br />

#### Default value

```YAML
headlamp_replica_count: 1
```

### headlamp_resources

Resource requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
headlamp_resources: {}
```

### headlamp_service_port

Kubernetes Service port

**_Type:_** integer<br />

#### Default value

```YAML
headlamp_service_port: 80
```

### headlamp_service_type

Kubernetes Service type

**_Type:_** string<br />

#### Default value

```YAML
headlamp_service_type: ClusterIP
```

### headlamp_tolerations

Tolerations

**_Type:_** list<br />

#### Default value

```YAML
headlamp_tolerations: []
```

### headlamp_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
headlamp_wait_install: true
```

## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
