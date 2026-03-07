# clamav

Install and configure ClamAV on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [clamav_additional_helm_values](#clamav_additional_helm_values)
  - [clamav_clamd_config](#clamav_clamd_config)
  - [clamav_deployment_name](#clamav_deployment_name)
  - [clamav_enabled](#clamav_enabled)
  - [clamav_extra_args](#clamav_extra_args)
  - [clamav_extra_env_vars](#clamav_extra_env_vars)
  - [clamav_freshclam_config](#clamav_freshclam_config)
  - [clamav_helm_chart_ref](#clamav_helm_chart_ref)
  - [clamav_helm_repo_name](#clamav_helm_repo_name)
  - [clamav_helm_repo_url](#clamav_helm_repo_url)
  - [clamav_helm_version](#clamav_helm_version)
  - [clamav_hpa_cpu](#clamav_hpa_cpu)
  - [clamav_hpa_enabled](#clamav_hpa_enabled)
  - [clamav_hpa_max_replicas](#clamav_hpa_max_replicas)
  - [clamav_ingress_annotations](#clamav_ingress_annotations)
  - [clamav_ingress_class](#clamav_ingress_class)
  - [clamav_ingress_enabled](#clamav_ingress_enabled)
  - [clamav_ingress_hosts](#clamav_ingress_hosts)
  - [clamav_ingress_tls](#clamav_ingress_tls)
  - [clamav_kind](#clamav_kind)
  - [clamav_metrics_enabled](#clamav_metrics_enabled)
  - [clamav_metrics_service_monitor_enabled](#clamav_metrics_service_monitor_enabled)
  - [clamav_namespace](#clamav_namespace)
  - [clamav_persistence_access_modes](#clamav_persistence_access_modes)
  - [clamav_persistence_enabled](#clamav_persistence_enabled)
  - [clamav_persistence_size](#clamav_persistence_size)
  - [clamav_pod_security_context](#clamav_pod_security_context)
  - [clamav_priority_class](#clamav_priority_class)
  - [clamav_replica_count](#clamav_replica_count)
  - [clamav_resources](#clamav_resources)
  - [clamav_security_context](#clamav_security_context)
  - [clamav_service_port](#clamav_service_port)
  - [clamav_service_type](#clamav_service_type)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### clamav_additional_helm_values

Additional helm values to be passed to the chart.
Use this to configure any chart option not exposed as a dedicated variable.
ref: https://github.com/wiremind/wiremind-helm-charts/blob/main/charts/clamav/values.yaml

**_Type:_** dict<br />

#### Default value

```YAML
clamav_additional_helm_values: {}
```

### clamav_clamd_config

ClamD configuration dict (overrides default clamd.conf)
ref: https://linux.die.net/man/5/clamd.conf

**_Type:_** dict<br />

#### Default value

```YAML
clamav_clamd_config:
  DatabaseDirectory: /data
  TemporaryDirectory: /tmp
  LogTime: yes
  PidFile: /tmp/clamd.pid
  LocalSocket: /tmp/clamd.sock
  TCPSocket: 3310
  Foreground: yes
  DetectPUA: yes
  ExcludePUA:
    - NetTool
    - PWTool
  HeuristicAlerts: yes
  Bytecode: yes
  ScanPE: yes
  DisableCertCheck: yes
  ScanELF: yes
  AlertBrokenExecutables: yes
  ScanOLE2: yes
  ScanPDF: yes
  ScanSWF: yes
  ScanMail: yes
  PhishingSignatures: yes
  PhishingScanURLs: yes
  ScanHTML: yes
  ScanArchive: yes
  MaxScanSize: 150M
  MaxFileSize: 30M
  MaxRecursion: 10
  MaxFiles: 15000
  MaxEmbeddedPE: 10M
  MaxHTMLNormalize: 10M
  MaxHTMLNoTags: 2M
  MaxScriptNormalize: 5M
  MaxZipTypeRcg: 1M
  MaxPartitions: 128
  MaxIconsPE: 200
  PCREMatchLimit: 10000
  PCRERecMatchLimit: 10000
```

### clamav_deployment_name

Helm chart deployment name

**_Type:_** string<br />

#### Default value

```YAML
clamav_deployment_name: clamav
```

### clamav_enabled

Should ClamAV helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
clamav_enabled: true
```

### clamav_extra_args

Extra arguments for ClamAV container

**_Type:_** list<br />

#### Default value

```YAML
clamav_extra_args: []
```

### clamav_extra_env_vars

Extra environment variables for ClamAV container

**_Type:_** list<br />

#### Default value

```YAML
clamav_extra_env_vars: []
```

### clamav_freshclam_config

FreshClam configuration dict (overrides default freshclam.conf)
ref: https://linux.die.net/man/5/freshclam.conf

**_Type:_** dict<br />

#### Default value

```YAML
clamav_freshclam_config:
  DatabaseDirectory: /data
  LogTime: yes
  PidFile: /tmp/freshclam.pid
  DatabaseOwner: '2000'
  DatabaseMirror: database.clamav.net
  ScriptedUpdates: yes
  NotifyClamd: /etc/clamav/clamd.conf
  Bytecode: yes
```

### clamav_helm_chart_ref

#### Default value

```YAML
clamav_helm_chart_ref: '{{ clamav_helm_repo_name }}/clamav'
```

### clamav_helm_repo_name

#### Default value

```YAML
clamav_helm_repo_name: wiremind
```

### clamav_helm_repo_url

#### Default value

```YAML
clamav_helm_repo_url: https://wiremind.github.io/wiremind-helm-charts
```

### clamav_helm_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
clamav_helm_version: 3.7.1
```

### clamav_hpa_cpu

Target CPU utilization percentage for HPA

**_Type:_** int<br />

#### Default value

```YAML
clamav_hpa_cpu: 80
```

### clamav_hpa_enabled

Enable Horizontal Pod Autoscaler

**_Type:_** boolean<br />

#### Default value

```YAML
clamav_hpa_enabled: true
```

### clamav_hpa_max_replicas

Maximum replicas for HPA

**_Type:_** int<br />

#### Default value

```YAML
clamav_hpa_max_replicas: 5
```

### clamav_ingress_annotations

Ingress annotations

**_Type:_** dict<br />

#### Default value

```YAML
clamav_ingress_annotations: {}
```

### clamav_ingress_class

Ingress class name

**_Type:_** string<br />

#### Default value

```YAML
clamav_ingress_class: ''
```

### clamav_ingress_enabled

Enable ingress for ClamAV

**_Type:_** boolean<br />

#### Default value

```YAML
clamav_ingress_enabled: false
```

### clamav_ingress_hosts

Ingress hosts

**_Type:_** list<br />

#### Default value

```YAML
clamav_ingress_hosts:
  - chart-example.local
```

### clamav_ingress_tls

Ingress TLS configuration

**_Type:_** list<br />

#### Default value

```YAML
clamav_ingress_tls: []
```

### clamav_kind

Workload kind for ClamAV (StatefulSet or Deployment)

**_Type:_** string<br />

#### Default value

```YAML
clamav_kind: StatefulSet
```

### clamav_metrics_enabled

Enable ClamAV metrics exporter sidecar

**_Type:_** boolean<br />

#### Default value

```YAML
clamav_metrics_enabled: false
```

### clamav_metrics_service_monitor_enabled

Enable ServiceMonitor for Prometheus

**_Type:_** boolean<br />

#### Default value

```YAML
clamav_metrics_service_monitor_enabled: false
```

### clamav_namespace

K8s namespace to install the clamav chart

**_Type:_** string<br />

#### Default value

```YAML
clamav_namespace: clamav
```

### clamav_persistence_access_modes

Persistent volume access modes

**_Type:_** list<br />

#### Default value

```YAML
clamav_persistence_access_modes:
  - ReadWriteOnce
```

### clamav_persistence_enabled

Enable persistence for ClamAV data directory

**_Type:_** boolean<br />

#### Default value

```YAML
clamav_persistence_enabled: false
```

### clamav_persistence_size

Persistent volume size

**_Type:_** string<br />

#### Default value

```YAML
clamav_persistence_size: 100Mi
```

### clamav_pod_security_context

Pod security context for ClamAV

**_Type:_** dict<br />

#### Default value

```YAML
clamav_pod_security_context:
  runAsNonRoot: true
  runAsUser: 100
  runAsGroup: 101
  fsGroup: 101
```

### clamav_priority_class

PriorityClass for ClamAV pods

**_Type:_** string<br />

#### Default value

```YAML
clamav_priority_class: ''
```

### clamav_replica_count

Number of ClamAV replicas

**_Type:_** int<br />

#### Default value

```YAML
clamav_replica_count: 1
```

### clamav_resources

Resource requests and limits for ClamAV

**_Type:_** dict<br />

#### Default value

```YAML
clamav_resources: {}
```

#### Example usage

```YAML
 clamav_resources:
   limits:
     cpu: 1000m
     memory: 2Gi
   requests:
     cpu: 300m
     memory: 1Gi
```

### clamav_security_context

Container security context for ClamAV

**_Type:_** dict<br />

#### Default value

```YAML
clamav_security_context:
  allowPrivilegeEscalation: false
  runAsNonRoot: true
  privileged: false
  capabilities:
    drop:
      - ALL
```

### clamav_service_port

Service port for ClamAV

**_Type:_** int<br />

#### Default value

```YAML
clamav_service_port: 3310
```

### clamav_service_type

Service type for ClamAV

**_Type:_** string<br />

#### Default value

```YAML
clamav_service_type: ClusterIP
```

## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
