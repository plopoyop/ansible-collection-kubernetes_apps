# oauth2_proxy

Install and configure OAuth2 Proxy on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [oauth2_proxy_additional_helm_values](#oauth2_proxy_additional_helm_values)
  - [oauth2_proxy_affinity](#oauth2_proxy_affinity)
  - [oauth2_proxy_autoscaling_enabled](#oauth2_proxy_autoscaling_enabled)
  - [oauth2_proxy_autoscaling_max_replicas](#oauth2_proxy_autoscaling_max_replicas)
  - [oauth2_proxy_autoscaling_min_replicas](#oauth2_proxy_autoscaling_min_replicas)
  - [oauth2_proxy_client_id](#oauth2_proxy_client_id)
  - [oauth2_proxy_client_secret](#oauth2_proxy_client_secret)
  - [oauth2_proxy_config_file](#oauth2_proxy_config_file)
  - [oauth2_proxy_cookie_name](#oauth2_proxy_cookie_name)
  - [oauth2_proxy_cookie_secret](#oauth2_proxy_cookie_secret)
  - [oauth2_proxy_deployment_name](#oauth2_proxy_deployment_name)
  - [oauth2_proxy_email_domains](#oauth2_proxy_email_domains)
  - [oauth2_proxy_enabled](#oauth2_proxy_enabled)
  - [oauth2_proxy_existing_secret](#oauth2_proxy_existing_secret)
  - [oauth2_proxy_extra_args](#oauth2_proxy_extra_args)
  - [oauth2_proxy_extra_env](#oauth2_proxy_extra_env)
  - [oauth2_proxy_helm_chart_version](#oauth2_proxy_helm_chart_version)
  - [oauth2_proxy_image_tag](#oauth2_proxy_image_tag)
  - [oauth2_proxy_ingress_annotations](#oauth2_proxy_ingress_annotations)
  - [oauth2_proxy_ingress_class_name](#oauth2_proxy_ingress_class_name)
  - [oauth2_proxy_ingress_enabled](#oauth2_proxy_ingress_enabled)
  - [oauth2_proxy_ingress_hostname](#oauth2_proxy_ingress_hostname)
  - [oauth2_proxy_ingress_path](#oauth2_proxy_ingress_path)
  - [oauth2_proxy_ingress_path_type](#oauth2_proxy_ingress_path_type)
  - [oauth2_proxy_ingress_tls_enabled](#oauth2_proxy_ingress_tls_enabled)
  - [oauth2_proxy_ingress_tls_secret_name](#oauth2_proxy_ingress_tls_secret_name)
  - [oauth2_proxy_metrics_enabled](#oauth2_proxy_metrics_enabled)
  - [oauth2_proxy_namespace](#oauth2_proxy_namespace)
  - [oauth2_proxy_node_selector](#oauth2_proxy_node_selector)
  - [oauth2_proxy_pod_annotations](#oauth2_proxy_pod_annotations)
  - [oauth2_proxy_pod_labels](#oauth2_proxy_pod_labels)
  - [oauth2_proxy_redis_ha_enabled](#oauth2_proxy_redis_ha_enabled)
  - [oauth2_proxy_replica_count](#oauth2_proxy_replica_count)
  - [oauth2_proxy_resources](#oauth2_proxy_resources)
  - [oauth2_proxy_service_monitor_enabled](#oauth2_proxy_service_monitor_enabled)
  - [oauth2_proxy_service_port](#oauth2_proxy_service_port)
  - [oauth2_proxy_service_type](#oauth2_proxy_service_type)
  - [oauth2_proxy_session_storage_type](#oauth2_proxy_session_storage_type)
  - [oauth2_proxy_tolerations](#oauth2_proxy_tolerations)
  - [oauth2_proxy_upstreams](#oauth2_proxy_upstreams)
  - [oauth2_proxy_wait_install](#oauth2_proxy_wait_install)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### oauth2_proxy_additional_helm_values

Additional helm values merged on top of the rendered chart values

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_additional_helm_values: {}
```

### oauth2_proxy_affinity

Affinity rules for OAuth2 Proxy pods

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_affinity: {}
```

### oauth2_proxy_autoscaling_enabled

Enable Horizontal Pod Autoscaler for OAuth2 Proxy

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_autoscaling_enabled: false
```

### oauth2_proxy_autoscaling_max_replicas

Maximum replicas when autoscaling is enabled

**_Type:_** int<br />

#### Default value

```YAML
oauth2_proxy_autoscaling_max_replicas: 10
```

### oauth2_proxy_autoscaling_min_replicas

Minimum replicas when autoscaling is enabled

**_Type:_** int<br />

#### Default value

```YAML
oauth2_proxy_autoscaling_min_replicas: 1
```

### oauth2_proxy_client_id

OAuth provider client ID

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_client_id: ''
```

### oauth2_proxy_client_secret

OAuth provider client secret

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_client_secret: ''
```

### oauth2_proxy_config_file

Raw oauth2_proxy.cfg content rendered into the chart configFile value

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_config_file: ''
```

#### Example usage

```YAML
oauth2_proxy_config_file: |
  provider = "oidc"
  oidc_issuer_url = "https://auth.example.com"
```

### oauth2_proxy_cookie_name

Cookie name (empty uses the chart default)

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_cookie_name: ''
```

### oauth2_proxy_cookie_secret

Cookie secret used to encrypt session cookies (16, 24 or 32 bytes base64-encoded)

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_cookie_secret: ''
```

### oauth2_proxy_deployment_name

OAuth2 Proxy helm release name

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_deployment_name: oauth2-proxy
```

### oauth2_proxy_email_domains

Email domains allowed to authenticate (use ["*"] for any domain)

**_Type:_** list<br />

#### Default value

```YAML
oauth2_proxy_email_domains:
  - '*'
```

### oauth2_proxy_enabled

Install OAuth2 Proxy chart

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_enabled: true
```

### oauth2_proxy_existing_secret

Existing secret holding client-id, client-secret and cookie-secret keys

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_existing_secret: ''
```

### oauth2_proxy_extra_args

Extra command-line flags passed to oauth2-proxy

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_extra_args: {}
```

#### Example usage

```YAML
oauth2_proxy_extra_args:
  provider: "oidc"
  oidc-issuer-url: "https://auth.example.com"
```

### oauth2_proxy_extra_env

Additional environment variables passed to the OAuth2 Proxy container

**_Type:_** list<br />

#### Default value

```YAML
oauth2_proxy_extra_env: []
```

### oauth2_proxy_helm_chart_version

OAuth2 Proxy helm chart version

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_helm_chart_version: 10.4.3
```

### oauth2_proxy_image_tag

Override the OAuth2 Proxy image tag (empty uses the chart default)

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_image_tag: ''
```

### oauth2_proxy_ingress_annotations

Annotations applied to the OAuth2 Proxy ingress

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_ingress_annotations: {}
```

### oauth2_proxy_ingress_class_name

Ingress class name for OAuth2 Proxy

**_Type:_** string<br />

### oauth2_proxy_ingress_enabled

Enable ingress for OAuth2 Proxy

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_ingress_enabled: false
```

### oauth2_proxy_ingress_hostname

Hostname for the OAuth2 Proxy ingress

**_Type:_** string<br />

### oauth2_proxy_ingress_path

Path for the OAuth2 Proxy ingress

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_ingress_path: /oauth2
```

### oauth2_proxy_ingress_path_type

Path type for the OAuth2 Proxy ingress

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_ingress_path_type: Prefix
```

### oauth2_proxy_ingress_tls_enabled

Enable TLS for the OAuth2 Proxy ingress

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_ingress_tls_enabled: false
```

### oauth2_proxy_ingress_tls_secret_name

Secret name for the OAuth2 Proxy TLS certificate

**_Type:_** string<br />

### oauth2_proxy_metrics_enabled

Expose the OAuth2 Proxy /metrics endpoint

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_metrics_enabled: true
```

### oauth2_proxy_namespace

K8s namespace to install OAuth2 Proxy chart

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_namespace: oauth2-proxy
```

### oauth2_proxy_node_selector

Node selector for OAuth2 Proxy pods

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_node_selector: {}
```

### oauth2_proxy_pod_annotations

Annotations applied to the OAuth2 Proxy pods

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_pod_annotations: {}
```

### oauth2_proxy_pod_labels

Labels applied to the OAuth2 Proxy pods

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_pod_labels: {}
```

### oauth2_proxy_redis_ha_enabled

Deploy the bundled redis-ha subchart for session storage

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_redis_ha_enabled: false
```

### oauth2_proxy_replica_count

Number of OAuth2 Proxy replicas

**_Type:_** int<br />

#### Default value

```YAML
oauth2_proxy_replica_count: 1
```

### oauth2_proxy_resources

Resource requests and limits for OAuth2 Proxy

**_Type:_** dict<br />

#### Default value

```YAML
oauth2_proxy_resources: {}
```

#### Example usage

```YAML
oauth2_proxy_resources:
  requests:
    cpu: "50m"
    memory: "64Mi"
  limits:
    cpu: "200m"
    memory: "256Mi"
```

### oauth2_proxy_service_monitor_enabled

Create a Prometheus-operator ServiceMonitor for OAuth2 Proxy

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_service_monitor_enabled: false
```

### oauth2_proxy_service_port

Service port for OAuth2 Proxy

**_Type:_** int<br />

#### Default value

```YAML
oauth2_proxy_service_port: 80
```

### oauth2_proxy_service_type

Service type for OAuth2 Proxy

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_service_type: ClusterIP
```

### oauth2_proxy_session_storage_type

Session storage backend: cookie or redis

**_Type:_** string<br />

#### Default value

```YAML
oauth2_proxy_session_storage_type: cookie
```

### oauth2_proxy_tolerations

Tolerations for OAuth2 Proxy pods

**_Type:_** list<br />

#### Default value

```YAML
oauth2_proxy_tolerations: []
```

### oauth2_proxy_upstreams

Upstreams forwarded to after authentication

**_Type:_** list<br />

#### Default value

```YAML
oauth2_proxy_upstreams:
  - file:///dev/null
```

### oauth2_proxy_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
oauth2_proxy_wait_install: true
```

## Discovered Tags

**_helm_chart_**

**_helm_repository_**

**_install_**

**_namespace_**

**_oauth2_proxy_**

**_uninstall_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
