# mailcrab

Install and configure Mailcrab on Kubernetes using the official Helm chart

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [mailcrab_affinity](#mailcrab_affinity)
  - [mailcrab_autoscaling](#mailcrab_autoscaling)
  - [mailcrab_basic_auth_secret_name](#mailcrab_basic_auth_secret_name)
  - [mailcrab_chart_path](#mailcrab_chart_path)
  - [mailcrab_deployment_name](#mailcrab_deployment_name)
  - [mailcrab_enabled](#mailcrab_enabled)
  - [mailcrab_github_repo](#mailcrab_github_repo)
  - [mailcrab_github_url](#mailcrab_github_url)
  - [mailcrab_github_version](#mailcrab_github_version)
  - [mailcrab_http_port](#mailcrab_http_port)
  - [mailcrab_image_pull_policy](#mailcrab_image_pull_policy)
  - [mailcrab_image_repository](#mailcrab_image_repository)
  - [mailcrab_ingress_annotations](#mailcrab_ingress_annotations)
  - [mailcrab_ingress_class](#mailcrab_ingress_class)
  - [mailcrab_ingress_enabled](#mailcrab_ingress_enabled)
  - [mailcrab_ingress_host](#mailcrab_ingress_host)
  - [mailcrab_ingress_tls_enabled](#mailcrab_ingress_tls_enabled)
  - [mailcrab_ingress_tls_secret_name](#mailcrab_ingress_tls_secret_name)
  - [mailcrab_namespace](#mailcrab_namespace)
  - [mailcrab_node_selector](#mailcrab_node_selector)
  - [mailcrab_password](#mailcrab_password)
  - [mailcrab_replica_count](#mailcrab_replica_count)
  - [mailcrab_resources](#mailcrab_resources)
  - [mailcrab_secret_name](#mailcrab_secret_name)
  - [mailcrab_service_type](#mailcrab_service_type)
  - [mailcrab_smtp_port](#mailcrab_smtp_port)
  - [mailcrab_tolerations](#mailcrab_tolerations)
  - [mailcrab_username](#mailcrab_username)
  - [mailcrab_wait_install](#mailcrab_wait_install)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### mailcrab_affinity

Affinity rules for the deployment

**_Type:_** dict<br />

#### Default value

```YAML
mailcrab_affinity: {}
```

### mailcrab_autoscaling

Enable autoscaling for the deployment

**_Type:_** boolean<br />

#### Default value

```YAML
mailcrab_autoscaling:
  enabled: false
```

#### Example usage

```YAML
mailcrab_autoscaling:
  enabled: true
  minReplicas: 1
  maxReplicas: 100
  targetCPUUtilizationPercentage: 80
```

### mailcrab_basic_auth_secret_name

#### Default value

```YAML
mailcrab_basic_auth_secret_name: mailcrab-basic-auth-secret
```

### mailcrab_chart_path

#### Default value

```YAML
mailcrab_chart_path: charts/mailcrab
```

### mailcrab_deployment_name

Helm release name

**_Type:_** string<br />

#### Default value

```YAML
mailcrab_deployment_name: mailcrab
```

### mailcrab_enabled

Should mailcrab helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
mailcrab_enabled: true
```

### mailcrab_github_repo

#### Default value

```YAML
mailcrab_github_repo: tweedegolf/mailcrab
```

### mailcrab_github_url

#### Default value

```YAML
mailcrab_github_url: https://github.com/{{ mailcrab_github_repo }}
```

### mailcrab_github_version

GitHub release version/tag to download (e.g., "v1.0.0" or "latest")

**_Type:_** string<br />

#### Default value

```YAML
mailcrab_github_version: v1.6.2
```

### mailcrab_http_port

HTTP/UI port exposed by Mailcrab

**_Type:_** int<br />

#### Default value

```YAML
mailcrab_http_port: 1080
```

### mailcrab_image_pull_policy

Docker image pull policy to use in the chart

**_Type:_** string<br />

#### Default value

```YAML
mailcrab_image_pull_policy: IfNotPresent
```

### mailcrab_image_repository

Docker image name to use in the chart

**_Type:_** string<br />

#### Default value

```YAML
mailcrab_image_repository: docker.io/marlonb/mailcrab
```

### mailcrab_ingress_annotations

Ingress annotations

**_Type:_** dict<br />

#### Default value

```YAML
mailcrab_ingress_annotations: {}
```

#### Example usage

```YAML
mailcrab_ingress_annotations:
  kubernetes.io/ingress.class: "{{ mailcrab_ingress_class }}"
  kubernetes.io/tls-acme: "{{ mailcrab_ingress_tls_enabled }}"
```

### mailcrab_ingress_class

Ingress class name

**_Type:_** string<br />

### mailcrab_ingress_enabled

Enable ingress for the HTTP interface

**_Type:_** boolean<br />

#### Default value

```YAML
mailcrab_ingress_enabled: false
```

### mailcrab_ingress_host

Hostname exposed through the ingress

**_Type:_** string<br />

### mailcrab_ingress_tls_enabled

Enable TLS for Mailcrab ingress

**_Type:_** boolean<br />

#### Default value

```YAML
mailcrab_ingress_tls_enabled: false
```

### mailcrab_ingress_tls_secret_name

TLS secret used by the ingress when TLS is enabled

**_Type:_** string<br />

### mailcrab_namespace

K8s namespace to install the mailcrab chart

**_Type:_** string<br />

#### Default value

```YAML
mailcrab_namespace: mailcrab
```

### mailcrab_node_selector

Node selector for the deployment

**_Type:_** dict<br />

#### Default value

```YAML
mailcrab_node_selector: {}
```

### mailcrab_password

Password for basic auth

**_Type:_** string<br />

### mailcrab_replica_count

Number of replicas to run

**_Type:_** int<br />

#### Default value

```YAML
mailcrab_replica_count: 1
```

### mailcrab_resources

Resource requests/limits for the main pod

**_Type:_** dict<br />

#### Default value

```YAML
mailcrab_resources: {}
```

#### Example usage

```YAML
mailcrab_resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 200m
    memory: 256Mi
```

### mailcrab_secret_name

Name of the secret for basic auth

**_Type:_** string<br />

### mailcrab_service_type

Service type exposed by the chart

**_Type:_** string<br />

#### Default value

```YAML
mailcrab_service_type: ClusterIP
```

### mailcrab_smtp_port

SMTP port exposed by Mailcrab

**_Type:_** int<br />

#### Default value

```YAML
mailcrab_smtp_port: 1025
```

### mailcrab_tolerations

Tolerations for the deployment

**_Type:_** list<br />

#### Default value

```YAML
mailcrab_tolerations: []
```

### mailcrab_username

Username for basic auth

**_Type:_** string<br />

### mailcrab_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
mailcrab_wait_install: true
```

## Dependencies

None.

## License

MPL2

## Author

Clément Hubert
