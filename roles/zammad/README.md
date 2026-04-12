# zammad

Install and configure Zammad application on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [zammad_additional_init_containers](#zammad_additional_init_containers)
  - [zammad_affinity](#zammad_affinity)
  - [zammad_auto_wizard_enabled](#zammad_auto_wizard_enabled)
  - [zammad_auto_wizard_locale](#zammad_auto_wizard_locale)
  - [zammad_auto_wizard_organizations](#zammad_auto_wizard_organizations)
  - [zammad_auto_wizard_settings](#zammad_auto_wizard_settings)
  - [zammad_auto_wizard_token](#zammad_auto_wizard_token)
  - [zammad_auto_wizard_users](#zammad_auto_wizard_users)
  - [zammad_common_annotations](#zammad_common_annotations)
  - [zammad_common_label](#zammad_common_label)
  - [zammad_deployment_name](#zammad_deployment_name)
  - [zammad_domain_name](#zammad_domain_name)
  - [zammad_elasticsearch_cluster_name](#zammad_elasticsearch_cluster_name)
  - [zammad_elasticsearch_coordinating_replica_count](#zammad_elasticsearch_coordinating_replica_count)
  - [zammad_elasticsearch_data_replica_count](#zammad_elasticsearch_data_replica_count)
  - [zammad_elasticsearch_enabled](#zammad_elasticsearch_enabled)
  - [zammad_elasticsearch_host](#zammad_elasticsearch_host)
  - [zammad_elasticsearch_ingest_replica_count](#zammad_elasticsearch_ingest_replica_count)
  - [zammad_elasticsearch_initialisation](#zammad_elasticsearch_initialisation)
  - [zammad_elasticsearch_master_heap_size](#zammad_elasticsearch_master_heap_size)
  - [zammad_elasticsearch_master_master_only](#zammad_elasticsearch_master_master_only)
  - [zammad_elasticsearch_master_replica_count](#zammad_elasticsearch_master_replica_count)
  - [zammad_elasticsearch_master_resources](#zammad_elasticsearch_master_resources)
  - [zammad_elasticsearch_master_resources_preset](#zammad_elasticsearch_master_resources_preset)
  - [zammad_elasticsearch_password](#zammad_elasticsearch_password)
  - [zammad_elasticsearch_port](#zammad_elasticsearch_port)
  - [zammad_elasticsearch_reindex](#zammad_elasticsearch_reindex)
  - [zammad_elasticsearch_schema](#zammad_elasticsearch_schema)
  - [zammad_elasticsearch_user](#zammad_elasticsearch_user)
  - [zammad_enabled](#zammad_enabled)
  - [zammad_external_s3_url](#zammad_external_s3_url)
  - [zammad_extra_env](#zammad_extra_env)
  - [zammad_helm_chart_ref](#zammad_helm_chart_ref)
  - [zammad_helm_repo_name](#zammad_helm_repo_name)
  - [zammad_helm_repo_url](#zammad_helm_repo_url)
  - [zammad_helm_version](#zammad_helm_version)
  - [zammad_ingress_certmanager_cluster_issuer](#zammad_ingress_certmanager_cluster_issuer)
  - [zammad_ingress_class](#zammad_ingress_class)
  - [zammad_ingress_enabled](#zammad_ingress_enabled)
  - [zammad_ingress_tls_enabled](#zammad_ingress_tls_enabled)
  - [zammad_init_containers_elasticsearch_resources](#zammad_init_containers_elasticsearch_resources)
  - [zammad_init_containers_elasticsearch_security_context](#zammad_init_containers_elasticsearch_security_context)
  - [zammad_init_containers_postgresql_resources](#zammad_init_containers_postgresql_resources)
  - [zammad_init_containers_postgresql_security_context](#zammad_init_containers_postgresql_security_context)
  - [zammad_init_containers_zammad_custom_init](#zammad_init_containers_zammad_custom_init)
  - [zammad_init_containers_zammad_resources](#zammad_init_containers_zammad_resources)
  - [zammad_init_containers_zammad_security_context](#zammad_init_containers_zammad_security_context)
  - [zammad_init_job_annotations](#zammad_init_job_annotations)
  - [zammad_init_job_pod_annotations](#zammad_init_job_pod_annotations)
  - [zammad_init_job_pod_labels](#zammad_init_job_pod_labels)
  - [zammad_init_job_pod_spec](#zammad_init_job_pod_spec)
  - [zammad_memcached_enabled](#zammad_memcached_enabled)
  - [zammad_memcached_port](#zammad_memcached_port)
  - [zammad_memcached_replica_count](#zammad_memcached_replica_count)
  - [zammad_memcached_resources](#zammad_memcached_resources)
  - [zammad_minio_auth_root_user](#zammad_minio_auth_root_user)
  - [zammad_minio_default_buckets](#zammad_minio_default_buckets)
  - [zammad_minio_disable_web_ui](#zammad_minio_disable_web_ui)
  - [zammad_minio_enabled](#zammad_minio_enabled)
  - [zammad_minio_root_password](#zammad_minio_root_password)
  - [zammad_namespace](#zammad_namespace)
  - [zammad_nginx_extra_headers](#zammad_nginx_extra_headers)
  - [zammad_nginx_knowledge_base_url](#zammad_nginx_knowledge_base_url)
  - [zammad_nginx_liveness_probe](#zammad_nginx_liveness_probe)
  - [zammad_nginx_max_client_body_size](#zammad_nginx_max_client_body_size)
  - [zammad_nginx_pod_annotations](#zammad_nginx_pod_annotations)
  - [zammad_nginx_pod_labels](#zammad_nginx_pod_labels)
  - [zammad_nginx_readiness_probe](#zammad_nginx_readiness_probe)
  - [zammad_nginx_replicas](#zammad_nginx_replicas)
  - [zammad_nginx_resources](#zammad_nginx_resources)
  - [zammad_nginx_security_context](#zammad_nginx_security_context)
  - [zammad_nginx_sidecars](#zammad_nginx_sidecars)
  - [zammad_nginx_startup_probe](#zammad_nginx_startup_probe)
  - [zammad_nginx_trusted_proxies](#zammad_nginx_trusted_proxies)
  - [zammad_nginx_websocket_extra_headers](#zammad_nginx_websocket_extra_headers)
  - [zammad_node_selector](#zammad_node_selector)
  - [zammad_pods_annotations](#zammad_pods_annotations)
  - [zammad_pods_label](#zammad_pods_label)
  - [zammad_postgresql_connection_options](#zammad_postgresql_connection_options)
  - [zammad_postgresql_database](#zammad_postgresql_database)
  - [zammad_postgresql_enabled](#zammad_postgresql_enabled)
  - [zammad_postgresql_host](#zammad_postgresql_host)
  - [zammad_postgresql_password](#zammad_postgresql_password)
  - [zammad_postgresql_port](#zammad_postgresql_port)
  - [zammad_postgresql_primary_resources](#zammad_postgresql_primary_resources)
  - [zammad_postgresql_replication_password](#zammad_postgresql_replication_password)
  - [zammad_postgresql_replication_username](#zammad_postgresql_replication_username)
  - [zammad_postgresql_username](#zammad_postgresql_username)
  - [zammad_railserver_liveness_probe](#zammad_railserver_liveness_probe)
  - [zammad_railserver_pod_annotations](#zammad_railserver_pod_annotations)
  - [zammad_railserver_pod_labels](#zammad_railserver_pod_labels)
  - [zammad_railserver_readiness_probe](#zammad_railserver_readiness_probe)
  - [zammad_railserver_replicas](#zammad_railserver_replicas)
  - [zammad_railserver_resources](#zammad_railserver_resources)
  - [zammad_railserver_security_context](#zammad_railserver_security_context)
  - [zammad_railserver_sidecars](#zammad_railserver_sidecars)
  - [zammad_railserver_startup_probe](#zammad_railserver_startup_probe)
  - [zammad_railserver_trusted_proxies](#zammad_railserver_trusted_proxies)
  - [zammad_railserver_web_concurrency](#zammad_railserver_web_concurrency)
  - [zammad_redis_architecture](#zammad_redis_architecture)
  - [zammad_redis_enabled](#zammad_redis_enabled)
  - [zammad_redis_host](#zammad_redis_host)
  - [zammad_redis_password](#zammad_redis_password)
  - [zammad_redis_port](#zammad_redis_port)
  - [zammad_redis_resources](#zammad_redis_resources)
  - [zammad_redis_sentinel_enabled](#zammad_redis_sentinel_enabled)
  - [zammad_redis_sentinel_master_name](#zammad_redis_sentinel_master_name)
  - [zammad_redis_sentinel_pass](#zammad_redis_sentinel_pass)
  - [zammad_redis_sentinel_sentinels](#zammad_redis_sentinel_sentinels)
  - [zammad_redis_sentinel_username](#zammad_redis_sentinel_username)
  - [zammad_redis_username](#zammad_redis_username)
  - [zammad_scheduler_pod_annotations](#zammad_scheduler_pod_annotations)
  - [zammad_scheduler_pod_labels](#zammad_scheduler_pod_labels)
  - [zammad_scheduler_resources](#zammad_scheduler_resources)
  - [zammad_scheduler_security_context](#zammad_scheduler_security_context)
  - [zammad_scheduler_sidecars](#zammad_scheduler_sidecars)
  - [zammad_secret_key_regex](#zammad_secret_key_regex)
  - [zammad_secrets_autowizard_secret_key](#zammad_secrets_autowizard_secret_key)
  - [zammad_secrets_autowizard_secret_name](#zammad_secrets_autowizard_secret_name)
  - [zammad_secrets_autowizard_use_existing](#zammad_secrets_autowizard_use_existing)
  - [zammad_secrets_elasticsearch_secret_key](#zammad_secrets_elasticsearch_secret_key)
  - [zammad_secrets_elasticsearch_secret_name](#zammad_secrets_elasticsearch_secret_name)
  - [zammad_secrets_elasticsearch_use_existing](#zammad_secrets_elasticsearch_use_existing)
  - [zammad_secrets_postgresql_secret_key](#zammad_secrets_postgresql_secret_key)
  - [zammad_secrets_postgresql_secret_name](#zammad_secrets_postgresql_secret_name)
  - [zammad_secrets_postgresql_use_existing](#zammad_secrets_postgresql_use_existing)
  - [zammad_secrets_redis_secret_key](#zammad_secrets_redis_secret_key)
  - [zammad_secrets_redis_secret_name](#zammad_secrets_redis_secret_name)
  - [zammad_secrets_redis_sentinel_secret_key](#zammad_secrets_redis_sentinel_secret_key)
  - [zammad_secrets_redis_sentinel_secret_name](#zammad_secrets_redis_sentinel_secret_name)
  - [zammad_secrets_redis_sentinel_use_existing](#zammad_secrets_redis_sentinel_use_existing)
  - [zammad_secrets_redis_use_existing](#zammad_secrets_redis_use_existing)
  - [zammad_security_context](#zammad_security_context)
  - [zammad_service_account_annotations](#zammad_service_account_annotations)
  - [zammad_service_account_create](#zammad_service_account_create)
  - [zammad_service_account_name](#zammad_service_account_name)
  - [zammad_storage_volume_claim_name](#zammad_storage_volume_claim_name)
  - [zammad_storage_volume_enabled](#zammad_storage_volume_enabled)
  - [zammad_tls_certificate_secret_name](#zammad_tls_certificate_secret_name)
  - [zammad_tmp_dir_volume_medium](#zammad_tmp_dir_volume_medium)
  - [zammad_tmp_dir_volume_size_limit](#zammad_tmp_dir_volume_size_limit)
  - [zammad_toloration](#zammad_toloration)
  - [zammad_wait_install](#zammad_wait_install)
  - [zammad_websocket_liveness_probe](#zammad_websocket_liveness_probe)
  - [zammad_websocket_pod_annotations](#zammad_websocket_pod_annotations)
  - [zammad_websocket_pod_labels](#zammad_websocket_pod_labels)
  - [zammad_websocket_readiness_probe](#zammad_websocket_readiness_probe)
  - [zammad_websocket_resources](#zammad_websocket_resources)
  - [zammad_websocket_security_context](#zammad_websocket_security_context)
  - [zammad_websocket_sidecars](#zammad_websocket_sidecars)
  - [zammad_websocket_startup_probe](#zammad_websocket_startup_probe)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### zammad_additional_init_containers

additional init containers

**_Type:_** dict<br />

#### Default value

```YAML
zammad_additional_init_containers: []
```

#### Example usage

```YAML
zammad_additional_init_containers:
  - name: s3-restore
    image: some-aws-s3-restore:latest
    env:
      - name: AWS_DEFAULT_REGION
        value: "eu-central-1"
      - name: AWS_ACCESS_KEY_ID
        value: "xxxxxxxxxxxx"
      - name: AWS_SECRET_ACCESS_KEY
        value: "xxxxxxxxxxxx"
      - name: SYNC_DIR
        value: "/opt/zammad"
      - name: AWS_SYNC_BUCKET
        value: "some-backup-bucket"
    volumeMounts:
      - name: help-zammad
        mountPath: /opt/zammad
```

### zammad_affinity

kubernetes affinity

**_Type:_** dict<br />

#### Default value

```YAML
zammad_affinity: {}
```

### zammad_auto_wizard_enabled

enable auto wizard

**_Type:_** bolean<br />

#### Default value

```YAML
zammad_auto_wizard_enabled: false
```

### zammad_auto_wizard_locale

zammad locale to setup

**_Type:_** string<br />

#### Default value

```YAML
zammad_auto_wizard_locale: en-us
```

### zammad_auto_wizard_organizations

zammad organization to create

**_Type:_** list<br />

#### Default value

```YAML
zammad_auto_wizard_organizations: []
```

#### Example usage

```YAML
zammad_auto_wizard_organizations:
  - name: "ZammadTest"
```

### zammad_auto_wizard_settings

zammad settings for autowizard

**_Type:_** list<br />

#### Default value

```YAML
zammad_auto_wizard_settings: []
```

#### Example usage

```YAML
zammad_auto_wizard_settings:
  - name: "product_name"
    value: "ZammadTestSystem"
  - name: "system_online_service"
    value: true
```

### zammad_auto_wizard_token

secret token for auto wizard. If used the url must look like: http://zammad/#getting_started/auto_wizard/your_token_here

**_Type:_** string<br />

### zammad_auto_wizard_users

zammad users to create

**_Type:_** list<br />

#### Default value

```YAML
zammad_auto_wizard_users: []
```

#### Example usage

```YAML
zammad_auto_wizard_users:
  - login: "email@example.org"
    firstname: "Zammad"
    lastname: "Admin"
    email: "email@example.org"
    organization: "ZammadTest"
    password: "..."
```

### zammad_common_annotations

additional annotations added to all zammad services

**_Type:_** dict<br />

#### Default value

```YAML
zammad_common_annotations: {}
```

#### Example usage

```YAML
zammad_common_annotations:
  my-annotation: "value"
```

### zammad_common_label

additional labels added to all zammad services

**_Type:_** dict<br />

#### Default value

```YAML
zammad_common_label: {}
```

#### Example usage

```YAML
zammad_common_label:
  my-label: "value"
```

### zammad_deployment_name

Helm chart deployment name

**_Type:_** string<br />

#### Default value

```YAML
zammad_deployment_name: zammad
```

### zammad_domain_name

Domain name for ingress

**_Type:_** string<br />

### zammad_elasticsearch_cluster_name

elasticsearch cluster name

**_Type:_** string<br />

#### Default value

```YAML
zammad_elasticsearch_cluster_name: zammad
```

### zammad_elasticsearch_coordinating_replica_count

replica count for elasticsearch coordinator pods

**_Type:_** int<br />

#### Default value

```YAML
zammad_elasticsearch_coordinating_replica_count: 0
```

### zammad_elasticsearch_data_replica_count

replica count for elasticsearch data pods

**_Type:_** int<br />

#### Default value

```YAML
zammad_elasticsearch_data_replica_count: 0
```

### zammad_elasticsearch_enabled

enable/disable elasticsearch chart dependency

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_elasticsearch_enabled: true
```

### zammad_elasticsearch_host

elasticsearch host : only used when zammad_elasticsearch_enabled is false

**_Type:_** booelan<br />

### zammad_elasticsearch_ingest_replica_count

replica count for elasticsearch ingest pods

**_Type:_** int<br />

#### Default value

```YAML
zammad_elasticsearch_ingest_replica_count: 0
```

### zammad_elasticsearch_initialisation

elasticsearch initialisation

**_Type:_** booelan<br />

#### Default value

```YAML
zammad_elasticsearch_initialisation: true
```

### zammad_elasticsearch_master_heap_size

heap size for elasticsearch master pods

**_Type:_** string<br />

#### Default value

```YAML
zammad_elasticsearch_master_heap_size: 512m
```

### zammad_elasticsearch_master_master_only

elasticsearch master pods is master only

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_elasticsearch_master_master_only: false
```

### zammad_elasticsearch_master_replica_count

replica count for elasticsearch master pods

**_Type:_** int<br />

#### Default value

```YAML
zammad_elasticsearch_master_replica_count: 1
```

### zammad_elasticsearch_master_resources

elasticsearch master pods resources requests and limits

**_Type:_** string<br />

#### Default value

```YAML
zammad_elasticsearch_master_resources: {}
```

#### Example usage

```YAML
zammad_elasticsearch_master_resources:
  requests:
    cpu: 50m
    memory: 512Mi
  limits:
    cpu: 100m
    memory: 1024Mi
```

### zammad_elasticsearch_master_resources_preset

elasticsearch master pods resources preset

**_Type:_** string<br />

#### Default value

```YAML
zammad_elasticsearch_master_resources_preset: medium
```

### zammad_elasticsearch_password

elasticsearch password

**_Type:_** string<br />

### zammad_elasticsearch_port

elasticsearch port

**_Type:_** int<br />

#### Default value

```YAML
zammad_elasticsearch_port: 9200
```

### zammad_elasticsearch_reindex

reindex elasticsearch

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_elasticsearch_reindex: true
```

### zammad_elasticsearch_schema

elasticsearch connection schema

**_Type:_** string<br />

#### Default value

```YAML
zammad_elasticsearch_schema: http
```

### zammad_elasticsearch_user

elasticsearch user

**_Type:_** string<br />

#### Default value

```YAML
zammad_elasticsearch_user: zammad
```

### zammad_enabled

Should zammad helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_enabled: true
```

### zammad_external_s3_url

external S3 URL for files

**_Type:_** string<br />

#### Example usage

```YAML
zammad_external_s3_url: "s3://accesskey:secretaccesskey@endpoint/bucket_name"
```

### zammad_extra_env

additional environment vars added to all zammad services

**_Type:_** list<br />

#### Default value

```YAML
zammad_extra_env: []
```

#### Example usage

```YAML
zammad_extra_env:
  - name: FOO_BAR
    value: "foobar"
```

### zammad_helm_chart_ref

#### Default value

```YAML
zammad_helm_chart_ref: '{{ zammad_helm_repo_name }}/zammad'
```

### zammad_helm_repo_name

#### Default value

```YAML
zammad_helm_repo_name: zammad
```

### zammad_helm_repo_url

#### Default value

```YAML
zammad_helm_repo_url: https://zammad.github.io/zammad-helm
```

### zammad_helm_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
zammad_helm_version: 16.0.10
```

### zammad_ingress_certmanager_cluster_issuer

Certmanager Cluster Issuer name

**_Type:_** string<br />

### zammad_ingress_class

Ingress class name

**_Type:_** string<br />

### zammad_ingress_enabled

Enable ingress

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_ingress_enabled: true
```

### zammad_ingress_tls_enabled

Enable TLS for ingress

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_ingress_tls_enabled: false
```

### zammad_init_containers_elasticsearch_resources

elasticsearch init container resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_containers_elasticsearch_resources: {}
```

#### Example usage

```YAML
zammad_init_containers_elasticsearch_resources:
  requests:
    cpu: 100m
    memory: 256Mi
  limits:
    cpu: 200m
    memory: 512Mi
```

### zammad_init_containers_elasticsearch_security_context

security context elasticsearch init container

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_containers_elasticsearch_security_context:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  privileged: false
```

### zammad_init_containers_postgresql_resources

postgresql init container resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_containers_postgresql_resources: {}
```

#### Example usage

```YAML
zammad_init_containers_zammad_custom_init: "bundle exec rails runner '…'"
```

### zammad_init_containers_postgresql_security_context

security context postgresql init container

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_containers_postgresql_security_context:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  privileged: false
```

### zammad_init_containers_zammad_custom_init

custom init for zammad

**_Type:_** string<br />

#### Default value

```YAML
zammad_init_containers_zammad_custom_init: ''
```

### zammad_init_containers_zammad_resources

zammad init container resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_containers_zammad_resources: {}
```

#### Example usage

```YAML
zammad_init_containers_zammad_resources:
  requests:
    cpu: 100m
    memory: 256Mi
  limits:
    cpu: 200m
    memory: 512Mi
```

### zammad_init_containers_zammad_security_context

security context zammad init container

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_containers_zammad_security_context:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  privileged: false
```

### zammad_init_job_annotations

init job additional annotations

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_job_annotations: {}
```

#### Example usage

```YAML
zammad_init_job_annotations:
  my-annotation: "value"
```

### zammad_init_job_pod_annotations

init job additional pod annotations

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_job_pod_annotations: {}
```

#### Example usage

```YAML
zammad_init_job_pod_annotations:
  my-annotation: "value"
```

### zammad_init_job_pod_labels

init job additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_job_pod_labels: {}
```

#### Example usage

```YAML
zammad_init_job_pod_labels:
  my-label: "value"
```

### zammad_init_job_pod_spec

websocket additional pod specs

**_Type:_** dict<br />

#### Default value

```YAML
zammad_init_job_pod_spec: {}
```

#### Example usage

```YAML
zammad_init_job_pod_spec:
  my-podspec: "value"
```

### zammad_memcached_enabled

enable/disable memcached chart dependency

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_memcached_enabled: true
```

### zammad_memcached_port

memcached port

**_Type:_** int<br />

#### Default value

```YAML
zammad_memcached_port: 11211
```

### zammad_memcached_replica_count

memcached replica count

**_Type:_** int<br />

#### Default value

```YAML
zammad_memcached_replica_count: 1
```

### zammad_memcached_resources

memcached resources requests and limits

**_Type:_** string<br />

#### Default value

```YAML
zammad_memcached_resources: {}
```

#### Example usage

```YAML
zammad_memcached_resources:
  requests:
    cpu: 50m
    memory: 64Mi
  limits:
    cpu: 100m
    memory: 128Mi
```

### zammad_minio_auth_root_user

minio root username

**_Type:_** string<br />

#### Default value

```YAML
zammad_minio_auth_root_user: zammadadmin
```

### zammad_minio_default_buckets

minio default bucket name

**_Type:_** string<br />

#### Default value

```YAML
zammad_minio_default_buckets: zammad
```

### zammad_minio_disable_web_ui

enable/disable minio web UI for debugging.

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_minio_disable_web_ui: true
```

### zammad_minio_enabled

enable/disable minio chart dependency

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_minio_enabled: false
```

### zammad_minio_root_password

minio root password

**_Type:_** string<br />

### zammad_namespace

K8s namespace to install the zammad chart

**_Type:_** string<br />

#### Default value

```YAML
zammad_namespace: zammad
```

### zammad_nginx_extra_headers

List of nginx extra headers

**_Type:_** list<br />

#### Default value

```YAML
zammad_nginx_extra_headers: []
```

#### Example usage

```YAML
zammad_nginx_extra_headers:
  - 'HeaderName "Header Value"'
```

### zammad_nginx_knowledge_base_url

Url for knowledge base

**_Type:_** string<br />

#### Default value

```YAML
zammad_nginx_knowledge_base_url: ''
```

### zammad_nginx_liveness_probe

Liveness probe for nginx

**_Type:_** dict<br />

#### Default value

```YAML
zammad_nginx_liveness_probe:
  tcpSocket:
    port: 8080
  failureThreshold: 5
  timeoutSeconds: 5
```

### zammad_nginx_max_client_body_size

Nginx max client body size

**_Type:_** string<br />

#### Default value

```YAML
zammad_nginx_max_client_body_size: 50M
```

### zammad_nginx_pod_annotations

nginx additional annotations

**_Type:_** dict<br />

#### Default value

```YAML
zammad_nginx_pod_annotations: {}
```

#### Example usage

```YAML
 zammad_nginx_pod_annotations:
   my-annotation: "value"
```

### zammad_nginx_pod_labels

nginx additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
zammad_nginx_pod_labels: {}
```

#### Example usage

```YAML
 zammad_nginx_pod_labels:
   my-label: "value"
```

### zammad_nginx_readiness_probe

Readiness probe for nginx

**_Type:_** dict<br />

#### Default value

```YAML
zammad_nginx_readiness_probe:
  httpGet:
    path: /
    port: 8080
  failureThreshold: 5
  timeoutSeconds: 5
```

### zammad_nginx_replicas

Number of nginx replicats

**_Type:_** int<br />

#### Default value

```YAML
zammad_nginx_replicas: 1
```

### zammad_nginx_resources

nginx resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_nginx_resources: {}
```

#### Example usage

```YAML
 zammad_nginx_resources:
   requests:
     cpu: 50m
     memory: 32Mi
   limits:
     cpu: 100m
     memory: 64Mi
```

### zammad_nginx_security_context

nginx security context

**_Type:_** dict<br />

#### Default value

```YAML
zammad_nginx_security_context:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  privileged: false
```

### zammad_nginx_sidecars

nginx sidecars : can be used to add additional containers / sidecars

**_Type:_** list<br />

#### Default value

```YAML
zammad_nginx_sidecars: []
```

### zammad_nginx_startup_probe

Startup probe for nginx

**_Type:_** dict<br />

#### Default value

```YAML
zammad_nginx_startup_probe:
  tcpSocket:
    port: 8080
  failureThreshold: 20
  periodSeconds: 4
```

### zammad_nginx_trusted_proxies

List of nginx trusted proxies

**_Type:_** list<br />

#### Default value

```YAML
zammad_nginx_trusted_proxies: []
```

### zammad_nginx_websocket_extra_headers

List of nginx websocket extra headers

**_Type:_** list<br />

#### Default value

```YAML
zammad_nginx_websocket_extra_headers: []
```

#### Example usage

```YAML
zammad_nginx_websocket_extra_headers:
  - 'HeaderName "Header Value"'
```

### zammad_node_selector

kubernetes node selector

**_Type:_** dict<br />

#### Default value

```YAML
zammad_node_selector: {}
```

### zammad_pods_annotations

additional annotations added pods

**_Type:_** dict<br />

#### Default value

```YAML
zammad_pods_annotations: {}
```

#### Example usage

```YAML
zammad_pods_annotations:
  my-label: "value"
```

### zammad_pods_label

additional labels added to all pods

**_Type:_** dict<br />

#### Default value

```YAML
zammad_pods_label: {}
```

#### Example usage

```YAML
zammad_pods_label:
  my-label: "value"
```

### zammad_postgresql_connection_options

postgresql additional connection options

**_Type:_** string<br />

#### Default value

```YAML
zammad_postgresql_connection_options: pool=50
```

### zammad_postgresql_database

postgresql database name

**_Type:_** string<br />

#### Default value

```YAML
zammad_postgresql_database: zammad_production
```

### zammad_postgresql_enabled

enable/disable postgresql chart dependency

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_postgresql_enabled: true
```

### zammad_postgresql_host

postgresql host : only used when zammad_postgresql_enabled is false

**_Type:_** string<br />

### zammad_postgresql_password

postgresql password

**_Type:_** string<br />

### zammad_postgresql_port

postgresql port

**_Type:_** int<br />

#### Default value

```YAML
zammad_postgresql_port: 5432
```

### zammad_postgresql_primary_resources

postgresql resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_postgresql_primary_resources: {}
```

#### Example usage

```YAML
 zammad_postgresql_primary_resources:
  requests:
    cpu: 250m
    memory: 256Mi
  limits:
    cpu: 500m
    memory: 512Mi
```

### zammad_postgresql_replication_password

postgresql replication password

**_Type:_** string<br />

### zammad_postgresql_replication_username

postgresql replication username

**_Type:_** string<br />

#### Default value

```YAML
zammad_postgresql_replication_username: repl_user
```

### zammad_postgresql_username

postgresql username

**_Type:_** string<br />

#### Default value

```YAML
zammad_postgresql_username: zammad
```

### zammad_railserver_liveness_probe

rail servers liveness probe

**_Type:_** dict<br />

#### Default value

```YAML
zammad_railserver_liveness_probe:
  tcpSocket:
    port: 3000
  failureThreshold: 5
  timeoutSeconds: 5
```

### zammad_railserver_pod_annotations

rail server additional pod annotations

**_Type:_** dict<br />

#### Default value

```YAML
zammad_railserver_pod_annotations: {}
```

#### Example usage

```YAML
zammad_railserver_pod_annotations:
  my-annotation: "value"
```

### zammad_railserver_pod_labels

rail server additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
zammad_railserver_pod_labels: {}
```

#### Example usage

```YAML
zammad_railserver_pod_labels:
  my-label: "value"
```

### zammad_railserver_readiness_probe

rail servers readiness probe

**_Type:_** dict<br />

#### Default value

```YAML
zammad_railserver_readiness_probe:
  httpGet:
    path: /
    port: 3000
  failureThreshold: 5
  timeoutSeconds: 5
```

### zammad_railserver_replicas

rail servers replicas

**_Type:_** int<br />

#### Default value

```YAML
zammad_railserver_replicas: 1
```

### zammad_railserver_resources

rail server resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_railserver_resources: {}
```

#### Example usage

```YAML
zammad_railserver_resources:
  requests:
    cpu: 100m
    memory: 512Mi
  limits:
    cpu: 200m
    memory: 1024Mi
```

### zammad_railserver_security_context

rail server security context

**_Type:_** dict<br />

#### Default value

```YAML
zammad_railserver_security_context:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  privileged: false
```

### zammad_railserver_sidecars

rail server sidecars : can be used to add additional containers / sidecars

**_Type:_** list<br />

#### Default value

```YAML
zammad_railserver_sidecars: []
```

### zammad_railserver_startup_probe

rail servers startup probe

**_Type:_** dict<br />

#### Default value

```YAML
zammad_railserver_startup_probe:
  tcpSocket:
    port: 3000
  failureThreshold: 20
  periodSeconds: 4
```

### zammad_railserver_trusted_proxies

trusted proxies for rail server

**_Type:_** list<br />

#### Default value

```YAML
zammad_railserver_trusted_proxies: "['127.0.0.1', '::1']"
```

### zammad_railserver_web_concurrency

web concurrency for rail server

**_Type:_** int<br />

#### Default value

```YAML
zammad_railserver_web_concurrency: 0
```

### zammad_redis_architecture

redis architecture

**_Type:_** string<br />

#### Default value

```YAML
zammad_redis_architecture: standalone
```

### zammad_redis_enabled

enable/disable redis chart dependency

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_redis_enabled: true
```

### zammad_redis_host

redis host : only used when zammad_redis_enabled is false

**_Type:_** string<br />

### zammad_redis_password

password for redis

**_Type:_** string<br />

### zammad_redis_port

port for redis

**_Type:_** int<br />

#### Default value

```YAML
zammad_redis_port: 6379
```

### zammad_redis_resources

redis resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_redis_resources: {}
```

#### Example usage

```YAML
zammad_redis_resources:
  limits:
    cpu: 250m
    memory: 256Mi
  requests:
    cpu: 250m
    memory: 256Mi
```

### zammad_redis_sentinel_enabled

enable redis sentinel mode

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_redis_sentinel_enabled: false
```

### zammad_redis_sentinel_master_name

sentinel master name

**_Type:_** string<br />

#### Default value

```YAML
zammad_redis_sentinel_master_name: mymaster
```

### zammad_redis_sentinel_pass

redis sentinel password

**_Type:_** string<br />

#### Default value

```YAML
zammad_redis_sentinel_pass: zammad
```

### zammad_redis_sentinel_sentinels

list of sentinel host:port addresses

**_Type:_** list<br />

#### Default value

```YAML
zammad_redis_sentinel_sentinels: []
```

#### Example usage

```YAML
zammad_redis_sentinel_sentinels:
  - "zammad-redis:26379"
```

### zammad_redis_sentinel_username

redis sentinel username (leave empty if no username is required)

**_Type:_** string<br />

#### Default value

```YAML
zammad_redis_sentinel_username: ''
```

### zammad_redis_username

redis username (leave empty if no username is required)

**_Type:_** string<br />

#### Default value

```YAML
zammad_redis_username: ''
```

### zammad_scheduler_pod_annotations

scheduler additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
zammad_scheduler_pod_annotations: {}
```

#### Example usage

```YAML
zammad_scheduler_pod_annotations:
  my-annotation: "value"
```

### zammad_scheduler_pod_labels

scheduler additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
zammad_scheduler_pod_labels: {}
```

#### Example usage

```YAML
zammad_scheduler_pod_labels:
  my-label: "value"
```

### zammad_scheduler_resources

zammad_scheduler_resources:
requests:
cpu: 100m
memory: 256Mi
limits:
cpu: 200m
memory: 512Mi

**_Type:_** dict<br />

#### Default value

```YAML
zammad_scheduler_resources: {}
```

### zammad_scheduler_security_context

**_Type:_** dict<br />

#### Default value

```YAML
zammad_scheduler_security_context:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  privileged: false
```

### zammad_scheduler_sidecars

scheduler sidecars : can be used to add additional containers / sidecars

**_Type:_** list<br />

#### Default value

```YAML
zammad_scheduler_sidecars: []
```

### zammad_secret_key_regex

#### Default value

```YAML
zammad_secret_key_regex: ^[0-9,a-z,A-Z]{1,64}$
```

### zammad_secrets_autowizard_secret_key

Secret key for autowizard

**_Type:_** string<br />

### zammad_secrets_autowizard_secret_name

Secret key name for autowizard

**_Type:_** string<br />

### zammad_secrets_autowizard_use_existing

Use existing secret for autowizard

**_Type:_** string<br />

#### Default value

```YAML
zammad_secrets_autowizard_use_existing: false
```

### zammad_secrets_elasticsearch_secret_key

Secret key name for elasticsearch

**_Type:_** string<br />

### zammad_secrets_elasticsearch_secret_name

Secret key for elasticsearch

**_Type:_** string<br />

### zammad_secrets_elasticsearch_use_existing

Use existing secret for elasticsearch

**_Type:_** string<br />

#### Default value

```YAML
zammad_secrets_elasticsearch_use_existing: false
```

### zammad_secrets_postgresql_secret_key

Secret key name for postgresql

**_Type:_** string<br />

### zammad_secrets_postgresql_secret_name

Secret key for postgresql

**_Type:_** string<br />

### zammad_secrets_postgresql_use_existing

Use existing secret for postgresql

**_Type:_** string<br />

#### Default value

```YAML
zammad_secrets_postgresql_use_existing: false
```

### zammad_secrets_redis_secret_key

Secret key name for redis

**_Type:_** string<br />

### zammad_secrets_redis_secret_name

Secret name for redis

**_Type:_** string<br />

### zammad_secrets_redis_sentinel_secret_key

Secret key name for redis sentinel

**_Type:_** string<br />

#### Default value

```YAML
zammad_secrets_redis_sentinel_secret_key: redis-sentinel-password
```

### zammad_secrets_redis_sentinel_secret_name

Secret name for redis sentinel

**_Type:_** string<br />

#### Default value

```YAML
zammad_secrets_redis_sentinel_secret_name: redis-sentinel-pass
```

### zammad_secrets_redis_sentinel_use_existing

Use existing secret for redis sentinel

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_secrets_redis_sentinel_use_existing: false
```

### zammad_secrets_redis_use_existing

Use existing secret for redis

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_secrets_redis_use_existing: false
```

### zammad_security_context

Zammad security context

**_Type:_** dict<br />

#### Default value

```YAML
zammad_security_context:
  fsGroup: 1000
  fsGroupChangePolicy: Always
  runAsUser: 1000
  runAsNonRoot: true
  runAsGroup: 1000
  seccompProfile:
    type: RuntimeDefault
```

### zammad_service_account_annotations

annotations for service account

**_Type:_** dict<br />

#### Default value

```YAML
zammad_service_account_annotations: {}
```

#### Example usage

```YAML
zammad_service_account_annotations:
  my-annotation: "value"
```

### zammad_service_account_create

create service account for zammad

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_service_account_create: true
```

### zammad_service_account_name

service account name

**_Type:_** string<br />

#### Default value

```YAML
zammad_service_account_name: ''
```

### zammad_storage_volume_claim_name

existing PVC with 'ReadWriteMany' permisssion for 'File' based storage

**_Type:_** string<br />

### zammad_storage_volume_enabled

Enable this for 'File' based storage in Zammad.

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_storage_volume_enabled: false
```

### zammad_tls_certificate_secret_name

Secret name for TLS certificate

**_Type:_** string<br />

#### Default value

```YAML
zammad_tls_certificate_secret_name: zammad-certificate
```

### zammad_tmp_dir_volume_medium

storage medium for tmp dir

**_Type:_** string<br />

#### Default value

```YAML
zammad_tmp_dir_volume_medium: Memory
```

### zammad_tmp_dir_volume_size_limit

size limit for tmp dir

**_Type:_** string<br />

#### Default value

```YAML
zammad_tmp_dir_volume_size_limit: 100Mi
```

### zammad_toloration

kubernetes toleration

**_Type:_** list<br />

#### Default value

```YAML
zammad_toloration: []
```

### zammad_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
zammad_wait_install: true
```

### zammad_websocket_liveness_probe

liveness probe for websocket

**_Type:_** dict<br />

#### Default value

```YAML
zammad_websocket_liveness_probe:
  tcpSocket:
    port: 6042
  failureThreshold: 10
  timeoutSeconds: 5
```

### zammad_websocket_pod_annotations

websocket additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
zammad_websocket_pod_annotations: {}
```

#### Example usage

```YAML
zammad_websocket_pod_annotations:
  my-annotation: "value"
```

### zammad_websocket_pod_labels

websocket additional pod labels

**_Type:_** dict<br />

#### Default value

```YAML
zammad_websocket_pod_labels: {}
```

#### Example usage

```YAML
zammad_websocket_pod_labels:
  my-label: "value"
```

### zammad_websocket_readiness_probe

readiness probe for websocket

**_Type:_** dict<br />

#### Default value

```YAML
zammad_websocket_readiness_probe:
  tcpSocket:
    port: 6042
    failureThreshold: 5
    timeoutSeconds: 5
```

### zammad_websocket_resources

websocket resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
zammad_websocket_resources: {}
```

#### Example usage

```YAML
zammad_websocket_resources:
  requests:
    cpu: 100m
    memory: 256Mi
  limits:
    cpu: 200m
    memory: 512Mi
```

### zammad_websocket_security_context

security context for websocket

**_Type:_** dict<br />

#### Default value

```YAML
zammad_websocket_security_context:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  privileged: false
```

### zammad_websocket_sidecars

scheduler websocket : can be used to add additional containers / sidecars

**_Type:_** list<br />

#### Default value

```YAML
zammad_websocket_sidecars: []
```

### zammad_websocket_startup_probe

startup probe for websocket

**_Type:_** dict<br />

#### Default value

```YAML
zammad_websocket_startup_probe:
  tcpSocket:
    port: 6042
  failureThreshold: 20
  periodSeconds: 4
```

## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
