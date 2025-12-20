# gatus

Install and configure Gatus on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [gatus_additional_helm_values](#gatus_additional_helm_values)
  - [gatus_annotations](#gatus_annotations)
  - [gatus_config](#gatus_config)
  - [gatus_deployment_name](#gatus_deployment_name)
  - [gatus_domain_name](#gatus_domain_name)
  - [gatus_enabled](#gatus_enabled)
  - [gatus_env](#gatus_env)
  - [gatus_env_from](#gatus_env_from)
  - [gatus_extra_init_containers](#gatus_extra_init_containers)
  - [gatus_extra_labels](#gatus_extra_labels)
  - [gatus_extra_paths](#gatus_extra_paths)
  - [gatus_extra_volume_mounts](#gatus_extra_volume_mounts)
  - [gatus_helm_chart_ref](#gatus_helm_chart_ref)
  - [gatus_helm_repo_name](#gatus_helm_repo_name)
  - [gatus_helm_repo_url](#gatus_helm_repo_url)
  - [gatus_helm_version](#gatus_helm_version)
  - [gatus_host_network](#gatus_host_network)
  - [gatus_ingress_annotations](#gatus_ingress_annotations)
  - [gatus_ingress_certmanager_cluster_issuer](#gatus_ingress_certmanager_cluster_issuer)
  - [gatus_ingress_class](#gatus_ingress_class)
  - [gatus_ingress_enabled](#gatus_ingress_enabled)
  - [gatus_ingress_path](#gatus_ingress_path)
  - [gatus_ingress_path_type](#gatus_ingress_path_type)
  - [gatus_ingress_tls_enabled](#gatus_ingress_tls_enabled)
  - [gatus_labels](#gatus_labels)
  - [gatus_namespace](#gatus_namespace)
  - [gatus_network_policy_enabled](#gatus_network_policy_enabled)
  - [gatus_network_policy_ingress_selectors](#gatus_network_policy_ingress_selectors)
  - [gatus_persistence_access_modes](#gatus_persistence_access_modes)
  - [gatus_persistence_annotations](#gatus_persistence_annotations)
  - [gatus_persistence_enabled](#gatus_persistence_enabled)
  - [gatus_persistence_existing_claim](#gatus_persistence_existing_claim)
  - [gatus_persistence_finalizers](#gatus_persistence_finalizers)
  - [gatus_persistence_mount_path](#gatus_persistence_mount_path)
  - [gatus_persistence_selector_labels](#gatus_persistence_selector_labels)
  - [gatus_persistence_size](#gatus_persistence_size)
  - [gatus_persistence_storage_class_name](#gatus_persistence_storage_class_name)
  - [gatus_persistence_sub_path](#gatus_persistence_sub_path)
  - [gatus_pod_annotations](#gatus_pod_annotations)
  - [gatus_pod_labels](#gatus_pod_labels)
  - [gatus_resources](#gatus_resources)
  - [gatus_secrets](#gatus_secrets)
  - [gatus_service_account_annotations](#gatus_service_account_annotations)
  - [gatus_service_account_auto_mount](#gatus_service_account_auto_mount)
  - [gatus_service_account_create](#gatus_service_account_create)
  - [gatus_service_account_name](#gatus_service_account_name)
  - [gatus_service_monitor_enabled](#gatus_service_monitor_enabled)
  - [gatus_service_monitor_interval](#gatus_service_monitor_interval)
  - [gatus_service_monitor_labels](#gatus_service_monitor_labels)
  - [gatus_service_monitor_namespace](#gatus_service_monitor_namespace)
  - [gatus_service_monitor_path](#gatus_service_monitor_path)
  - [gatus_service_monitor_relabelings](#gatus_service_monitor_relabelings)
  - [gatus_service_monitor_scheme](#gatus_service_monitor_scheme)
  - [gatus_service_monitor_scrape_timeout](#gatus_service_monitor_scrape_timeout)
  - [gatus_service_monitor_tls_config](#gatus_service_monitor_tls_config)
  - [gatus_sidecar_containers](#gatus_sidecar_containers)
  - [gatus_tls_certificate_secret_name](#gatus_tls_certificate_secret_name)
  - [gatus_wait_install](#gatus_wait_install)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### gatus_additional_helm_values

Additional helm values to be passed to the chart

**_Type:_** dict<br />

#### Default value

```YAML
gatus_additional_helm_values: {}
```

### gatus_annotations

Additional deployment annotations

**_Type:_** dict<br />

### gatus_config

Gatus configuration (endpoints, alerts, etc.)

**_Type:_** dict<br />

#### Default value

```YAML
gatus_config: {}
```

#### Example usage

```YAML
gatus_config:
  endpoints:
    - name: example
      url: https://example.com
      interval: 60s
      conditions:
        - "[STATUS] == 200"
```

### gatus_deployment_name

Helm chart deployment name

**_Type:_** string<br />

#### Default value

```YAML
gatus_deployment_name: gatus
```

### gatus_domain_name

Domain name for ingress

**_Type:_** string<br />

#### Default value

```YAML
gatus_domain_name: ''
```

### gatus_enabled

Should gatus helm chart be installed

**_Type:_** string<br />

#### Default value

```YAML
gatus_enabled: true
```

### gatus_env

Extra environment variables that will be passed onto deployment pods

**_Type:_** dict<br />

#### Default value

```YAML
gatus_env: {}
```

### gatus_env_from

Environment variables from secrets or configmaps

**_Type:_** list<br />

#### Default value

```YAML
gatus_env_from: []
```

### gatus_extra_init_containers

Additional init containers

**_Type:_** list<br />

#### Default value

```YAML
gatus_extra_init_containers: []
```

### gatus_extra_labels

Apply extra labels to common labels

**_Type:_** dict<br />

#### Default value

```YAML
gatus_extra_labels: {}
```

### gatus_extra_paths

Extra paths for gatus ingress

**_Type:_** list<br />

### gatus_extra_volume_mounts

Extra volume mounts

**_Type:_** list<br />

#### Default value

```YAML
gatus_extra_volume_mounts: []
```

### gatus_helm_chart_ref

#### Default value

```YAML
gatus_helm_chart_ref: '{{ gatus_helm_repo_name }}/gatus'
```

### gatus_helm_repo_name

#### Default value

```YAML
gatus_helm_repo_name: gatus
```

### gatus_helm_repo_url

#### Default value

```YAML
gatus_helm_repo_url: https://twin.github.io/helm-charts
```

### gatus_helm_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
gatus_helm_version: 1.4.4
```

### gatus_host_network

Enable host network mode

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_host_network: false
```

### gatus_ingress_annotations

Additional ingress annotations

**_Type:_** dict<br />

#### Default value

```YAML
gatus_ingress_annotations: {}
```

### gatus_ingress_certmanager_cluster_issuer

Certmanager Cluster Issuer name

**_Type:_** string<br />

#### Default value

```YAML
gatus_ingress_certmanager_cluster_issuer: ''
```

### gatus_ingress_class

Ingress class name

**_Type:_** string<br />

#### Default value

```YAML
gatus_ingress_class: ''
```

### gatus_ingress_enabled

Enable ingress

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_ingress_enabled: false
```

### gatus_ingress_path

Ingress path

**_Type:_** string<br />

#### Default value

```YAML
gatus_ingress_path: /
```

### gatus_ingress_path_type

Ingress path type

**_Type:_** string<br />

#### Default value

```YAML
gatus_ingress_path_type: Prefix
```

### gatus_ingress_tls_enabled

Enable TLS for ingress

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_ingress_tls_enabled: false
```

### gatus_labels

Additional deployment labels

**_Type:_** dict<br />

### gatus_namespace

K8s namespace to install the gatus chart

#### Default value

```YAML
gatus_namespace: gatus
```

### gatus_network_policy_enabled

Enable network policy

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_network_policy_enabled: false
```

### gatus_network_policy_ingress_selectors

Ingress selectors for network policy

**_Type:_** list<br />

#### Default value

```YAML
gatus_network_policy_ingress_selectors: []
```

### gatus_persistence_access_modes

Access modes for persistent volume

**_Type:_** list<br />

#### Default value

```YAML
gatus_persistence_access_modes:
  - ReadWriteOnce
```

### gatus_persistence_annotations

Annotations for persistent volume

**_Type:_** dict<br />

#### Default value

```YAML
gatus_persistence_annotations: {}
```

### gatus_persistence_enabled

Enable persistence using Persistent Volume Claims

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_persistence_enabled: true
```

### gatus_persistence_existing_claim

Existing claim name for persistent volume

**_Type:_** string<br />

#### Default value

```YAML
gatus_persistence_existing_claim: ''
```

### gatus_persistence_finalizers

Finalizers for persistent volume

**_Type:_** list<br />

#### Default value

```YAML
gatus_persistence_finalizers:
  - kubernetes.io/pvc-protection
```

### gatus_persistence_mount_path

Mount path for persistent volume

**_Type:_** string<br />

#### Default value

```YAML
gatus_persistence_mount_path: /data
```

### gatus_persistence_selector_labels

Selector labels for persistent volume

**_Type:_** dict<br />

#### Default value

```YAML
gatus_persistence_selector_labels: {}
```

### gatus_persistence_size

Size of persistent volume

**_Type:_** string<br />

#### Default value

```YAML
gatus_persistence_size: 200Mi
```

### gatus_persistence_storage_class_name

Storage class name for persistent volume

**_Type:_** string<br />

#### Default value

```YAML
gatus_persistence_storage_class_name: ''
```

### gatus_persistence_sub_path

Sub path for persistent volume

**_Type:_** string<br />

#### Default value

```YAML
gatus_persistence_sub_path: ''
```

### gatus_pod_annotations

Additional pod annotations

**_Type:_** dict<br />

#### Default value

```YAML
gatus_pod_annotations: {}
```

### gatus_pod_labels

Additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
gatus_pod_labels: {}
```

### gatus_resources

Resource requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
gatus_resources: {}
```

### gatus_secrets

Include secret's content in pods environment

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_secrets: false
```

### gatus_service_account_annotations

Service account annotations

**_Type:_** dict<br />

#### Default value

```YAML
gatus_service_account_annotations: {}
```

### gatus_service_account_auto_mount

Automatically mount service account API credentials

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_service_account_auto_mount: true
```

### gatus_service_account_create

Create service account

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_service_account_create: true
```

### gatus_service_account_name

Service account name (empty uses default)

**_Type:_** string<br />

### gatus_service_monitor_enabled

Create ServiceMonitor CRD for prometheus operator

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_service_monitor_enabled: false
```

### gatus_service_monitor_interval

Scrape interval for ServiceMonitor

**_Type:_** string<br />

#### Default value

```YAML
gatus_service_monitor_interval: 1m
```

### gatus_service_monitor_labels

Labels for ServiceMonitor

**_Type:_** dict<br />

#### Default value

```YAML
gatus_service_monitor_labels: {}
```

### gatus_service_monitor_namespace

Namespace for ServiceMonitor (defaults to chart namespace)

**_Type:_** string<br />

#### Default value

```YAML
gatus_service_monitor_namespace: ''
```

### gatus_service_monitor_path

Metrics path for ServiceMonitor

**_Type:_** string<br />

#### Default value

```YAML
gatus_service_monitor_path: /metrics
```

### gatus_service_monitor_relabelings

Relabelings for ServiceMonitor

**_Type:_** list<br />

#### Default value

```YAML
gatus_service_monitor_relabelings: []
```

### gatus_service_monitor_scheme

Scheme for ServiceMonitor

**_Type:_** string<br />

#### Default value

```YAML
gatus_service_monitor_scheme: http
```

### gatus_service_monitor_scrape_timeout

Scrape timeout for ServiceMonitor

**_Type:_** string<br />

#### Default value

```YAML
gatus_service_monitor_scrape_timeout: 30s
```

### gatus_service_monitor_tls_config

TLS config for ServiceMonitor

**_Type:_** dict<br />

#### Default value

```YAML
gatus_service_monitor_tls_config: {}
```

### gatus_sidecar_containers

Sidecar containers in the pod

**_Type:_** dict<br />

#### Default value

```YAML
gatus_sidecar_containers: {}
```

### gatus_tls_certificate_secret_name

Secret name for TLS certificate

**_Type:_** string<br />

#### Default value

```YAML
gatus_tls_certificate_secret_name: gatus-certificate
```

### gatus_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
gatus_wait_install: true
```

## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
