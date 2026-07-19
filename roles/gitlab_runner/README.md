# gitlab_runner

Install and configure a GitLab Runner on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [gitlab_runner_additional_helm_values](#gitlab_runner_additional_helm_values)
  - [gitlab_runner_affinity](#gitlab_runner_affinity)
  - [gitlab_runner_cache](#gitlab_runner_cache)
  - [gitlab_runner_certs_secret_name](#gitlab_runner_certs_secret_name)
  - [gitlab_runner_check_interval](#gitlab_runner_check_interval)
  - [gitlab_runner_concurrent](#gitlab_runner_concurrent)
  - [gitlab_runner_config_maps](#gitlab_runner_config_maps)
  - [gitlab_runner_config_toml](#gitlab_runner_config_toml)
  - [gitlab_runner_connection_max_age](#gitlab_runner_connection_max_age)
  - [gitlab_runner_deployment_annotations](#gitlab_runner_deployment_annotations)
  - [gitlab_runner_deployment_labels](#gitlab_runner_deployment_labels)
  - [gitlab_runner_deployment_name](#gitlab_runner_deployment_name)
  - [gitlab_runner_enabled](#gitlab_runner_enabled)
  - [gitlab_runner_env_vars](#gitlab_runner_env_vars)
  - [gitlab_runner_executor](#gitlab_runner_executor)
  - [gitlab_runner_existing_secret](#gitlab_runner_existing_secret)
  - [gitlab_runner_extra_containers](#gitlab_runner_extra_containers)
  - [gitlab_runner_extra_env](#gitlab_runner_extra_env)
  - [gitlab_runner_extra_env_from](#gitlab_runner_extra_env_from)
  - [gitlab_runner_extra_env_from_refs](#gitlab_runner_extra_env_from_refs)
  - [gitlab_runner_extra_manifests](#gitlab_runner_extra_manifests)
  - [gitlab_runner_extra_objects](#gitlab_runner_extra_objects)
  - [gitlab_runner_gitlab_url](#gitlab_runner_gitlab_url)
  - [gitlab_runner_helm_chart_version](#gitlab_runner_helm_chart_version)
  - [gitlab_runner_host_aliases](#gitlab_runner_host_aliases)
  - [gitlab_runner_hostname](#gitlab_runner_hostname)
  - [gitlab_runner_hpa](#gitlab_runner_hpa)
  - [gitlab_runner_image_pull_policy](#gitlab_runner_image_pull_policy)
  - [gitlab_runner_image_pull_secrets](#gitlab_runner_image_pull_secrets)
  - [gitlab_runner_image_registry](#gitlab_runner_image_registry)
  - [gitlab_runner_image_repository](#gitlab_runner_image_repository)
  - [gitlab_runner_image_tag](#gitlab_runner_image_tag)
  - [gitlab_runner_job_namespace](#gitlab_runner_job_namespace)
  - [gitlab_runner_liveness_probe](#gitlab_runner_liveness_probe)
  - [gitlab_runner_log_format](#gitlab_runner_log_format)
  - [gitlab_runner_log_level](#gitlab_runner_log_level)
  - [gitlab_runner_metrics_enabled](#gitlab_runner_metrics_enabled)
  - [gitlab_runner_metrics_pod_monitor_enabled](#gitlab_runner_metrics_pod_monitor_enabled)
  - [gitlab_runner_metrics_port](#gitlab_runner_metrics_port)
  - [gitlab_runner_namespace](#gitlab_runner_namespace)
  - [gitlab_runner_node_selector](#gitlab_runner_node_selector)
  - [gitlab_runner_pod_annotations](#gitlab_runner_pod_annotations)
  - [gitlab_runner_pod_labels](#gitlab_runner_pod_labels)
  - [gitlab_runner_pod_security_context](#gitlab_runner_pod_security_context)
  - [gitlab_runner_pre_entrypoint_script](#gitlab_runner_pre_entrypoint_script)
  - [gitlab_runner_priority_class_name](#gitlab_runner_priority_class_name)
  - [gitlab_runner_probe_timeout_seconds](#gitlab_runner_probe_timeout_seconds)
  - [gitlab_runner_rbac_cluster_wide_access](#gitlab_runner_rbac_cluster_wide_access)
  - [gitlab_runner_rbac_create](#gitlab_runner_rbac_create)
  - [gitlab_runner_rbac_rules](#gitlab_runner_rbac_rules)
  - [gitlab_runner_readiness_probe](#gitlab_runner_readiness_probe)
  - [gitlab_runner_replicas](#gitlab_runner_replicas)
  - [gitlab_runner_resources](#gitlab_runner_resources)
  - [gitlab_runner_revision_history_limit](#gitlab_runner_revision_history_limit)
  - [gitlab_runner_runner_name](#gitlab_runner_runner_name)
  - [gitlab_runner_runtime_class_name](#gitlab_runner_runtime_class_name)
  - [gitlab_runner_scheduler_name](#gitlab_runner_scheduler_name)
  - [gitlab_runner_secrets](#gitlab_runner_secrets)
  - [gitlab_runner_security_context](#gitlab_runner_security_context)
  - [gitlab_runner_sentry_dsn](#gitlab_runner_sentry_dsn)
  - [gitlab_runner_service_account_annotations](#gitlab_runner_service_account_annotations)
  - [gitlab_runner_service_account_image_pull_secrets](#gitlab_runner_service_account_image_pull_secrets)
  - [gitlab_runner_service_account_name](#gitlab_runner_service_account_name)
  - [gitlab_runner_session_server_enabled](#gitlab_runner_session_server_enabled)
  - [gitlab_runner_session_server_external_port](#gitlab_runner_session_server_external_port)
  - [gitlab_runner_session_server_internal_port](#gitlab_runner_session_server_internal_port)
  - [gitlab_runner_session_server_node_port](#gitlab_runner_session_server_node_port)
  - [gitlab_runner_session_server_public_ip](#gitlab_runner_session_server_public_ip)
  - [gitlab_runner_session_server_service_type](#gitlab_runner_session_server_service_type)
  - [gitlab_runner_shutdown_timeout](#gitlab_runner_shutdown_timeout)
  - [gitlab_runner_strategy](#gitlab_runner_strategy)
  - [gitlab_runner_termination_grace_period_seconds](#gitlab_runner_termination_grace_period_seconds)
  - [gitlab_runner_token](#gitlab_runner_token)
  - [gitlab_runner_tolerations](#gitlab_runner_tolerations)
  - [gitlab_runner_topology_spread_constraints](#gitlab_runner_topology_spread_constraints)
  - [gitlab_runner_unregister_runners](#gitlab_runner_unregister_runners)
  - [gitlab_runner_volume_mounts](#gitlab_runner_volume_mounts)
  - [gitlab_runner_volumes](#gitlab_runner_volumes)
  - [gitlab_runner_wait_install](#gitlab_runner_wait_install)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### gitlab_runner_additional_helm_values

Free-form helm values merged into the rendered values file. Use this to set
any chart parameter not exposed by the role above.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_additional_helm_values: {}
```

### gitlab_runner_affinity

Affinity rules applied to the runner manager pod.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_affinity: {}
```

### gitlab_runner_cache

Distributed cache configuration (passed to runners.cache in the chart values).

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_cache: {}
```

#### Example usage

```YAML
  gitlab_runner_cache:
    secretName: "s3access"
```

### gitlab_runner_certs_secret_name

Name of a Kubernetes Secret holding custom CA certificates. Used to populate
/home/gitlab-runner/.gitlab-runner/certs/ for self-signed GitLab instances.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_certs_secret_name: ''
```

### gitlab_runner_check_interval

Interval in seconds between two checks for new builds.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_check_interval: 3
```

### gitlab_runner_concurrent

Maximum number of concurrent jobs handled by the runner manager.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_concurrent: 10
```

### gitlab_runner_config_maps

Additional config files mounted into the runner pod under /configmaps.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_config_maps: {}
```

### gitlab_runner_config_toml

Multi-line TOML snippet rendered by the chart as runners.config. The string is
evaluated as a Helm template, so it can reference Helm values directly. Leave
empty to keep the chart default (kubernetes executor with the alpine image).

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_config_toml: ''
```

#### Example usage

```YAML
  gitlab_runner_config_toml: |
    [[runners]]
      [runners.kubernetes]
        namespace = "{% raw %}{{ default .Release.Namespace .Values.runners.jobNamespace }}{% endraw %}"
        image = "alpine"
```

### gitlab_runner_connection_max_age

Maximum connection age for TLS keepalive connections (e.g. "15m"). Empty = chart default.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_connection_max_age: ''
```

### gitlab_runner_deployment_annotations

Annotations applied to the runner Deployment.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_deployment_annotations: {}
```

### gitlab_runner_deployment_labels

Labels applied to the runner Deployment.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_deployment_labels: {}
```

### gitlab_runner_deployment_name

Helm release name for GitLab Runner

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_deployment_name: gitlab-runner
```

### gitlab_runner_enabled

Should GitLab Runner helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_enabled: true
```

### gitlab_runner_env_vars

Environment variables present at runner registration time. Use a list of
{name, value} mappings (rendered into envVars).

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_env_vars: []
```

#### Example usage

```YAML
  gitlab_runner_env_vars:
    - name: "RUNNER_EXECUTOR"
      value: "kubernetes"
```

### gitlab_runner_executor

Executor used to run jobs. Empty = chart default (kubernetes).

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_executor: ''
```

### gitlab_runner_existing_secret

Name of an existing Kubernetes secret containing the key "runner-token".
When set, the role does not create a secret and the chart references this one
through runners.secret.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_existing_secret: ''
```

### gitlab_runner_extra_containers

Sidecar containers added to the runner pod.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_extra_containers: []
```

### gitlab_runner_extra_env

Additional environment variables as key-value pairs (rendered into extraEnv).

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_extra_env: {}
```

### gitlab_runner_extra_env_from

Additional environment variables sourced from secrets/configmaps (rendered into extraEnvFrom).

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_extra_env_from: {}
```

#### Example usage

```YAML
  gitlab_runner_extra_env_from:
    CACHE_S3_ACCESS_KEY:
      secretKeyRef:
        name: "s3access"
        key: "accesskey"
```

### gitlab_runner_extra_env_from_refs

envFrom references attached to the runner manager pod.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_extra_env_from_refs: []
```

#### Example usage

```YAML
  gitlab_runner_extra_env_from_refs:
    - secretRef:
        name: "gitlab-runner-cache-config"
```

### gitlab_runner_extra_manifests

Extra Kubernetes manifests created in the runner namespace before installing the chart.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_extra_manifests: []
```

### gitlab_runner_extra_objects

Extra Kubernetes manifests rendered by the chart alongside the runner.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_extra_objects: []
```

### gitlab_runner_gitlab_url

The GitLab Server URL (with protocol) to register the runner against.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_gitlab_url: https://gitlab.com/
```

#### Example usage

```YAML
  gitlab_runner_gitlab_url: "https://gitlab.example.com/"
```

### gitlab_runner_helm_chart_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_helm_chart_version: 0.91.0
```

### gitlab_runner_host_aliases

hostAliases injected into the runner manager pod.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_host_aliases: []
```

### gitlab_runner_hostname

Custom hostname for the runner manager pod.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_hostname: ''
```

### gitlab_runner_hpa

HorizontalPodAutoscaler configuration for the runner manager Deployment.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_hpa: {}
```

#### Example usage

```YAML
  gitlab_runner_hpa:
    minReplicas: 1
    maxReplicas: 10
    metrics:
      - type: "Pods"
        pods:
          metricName: "gitlab_runner_jobs"
          targetAverageValue: "400m"
```

### gitlab_runner_image_pull_policy

Image pull policy for the runner deployment. Options: Always, IfNotPresent, Never.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_image_pull_policy: IfNotPresent
```

### gitlab_runner_image_pull_secrets

List of imagePullSecrets to use for pulling the runner image.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_image_pull_secrets: []
```

#### Example usage

```YAML
  gitlab_runner_image_pull_secrets:
    - name: "image-pull-secret"
```

### gitlab_runner_image_registry

Container image registry for the runner image. Leave empty to use the chart default.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_image_registry: ''
```

### gitlab_runner_image_repository

Container image repository for the runner image. Leave empty to use the chart default.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_image_repository: ''
```

### gitlab_runner_image_tag

Container image tag for the runner image. Leave empty to default to alpine-v{chart-appVersion}.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_image_tag: ''
```

### gitlab_runner_job_namespace

Namespace where job pods are scheduled. Empty = same as the runner namespace.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_job_namespace: ''
```

### gitlab_runner_liveness_probe

Custom livenessProbe for the runner container.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_liveness_probe: {}
```

### gitlab_runner_log_format

Log format. Options: runner, text, json. Empty = chart default.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_log_format: ''
```

### gitlab_runner_log_level

Log level. Options: debug, info, warn, error, fatal, panic. Empty = chart default.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_log_level: ''
```

### gitlab_runner_metrics_enabled

Enable the integrated Prometheus metrics exporter.

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_metrics_enabled: false
```

### gitlab_runner_metrics_pod_monitor_enabled

Create a prometheus-operator PodMonitor for the runner pods.

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_metrics_pod_monitor_enabled: false
```

### gitlab_runner_metrics_port

Port exposed by the metrics exporter.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_metrics_port: 9252
```

### gitlab_runner_namespace

K8s namespace to install the GitLab Runner chart

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_namespace: gitlab-runner
```

### gitlab_runner_node_selector

nodeSelector applied to the runner manager pod.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_node_selector: {}
```

### gitlab_runner_pod_annotations

Annotations applied to the runner manager pod.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_pod_annotations: {}
```

### gitlab_runner_pod_labels

Labels applied to the runner manager pod.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_pod_labels: {}
```

### gitlab_runner_pod_security_context

Pod-level securityContext applied to the runner manager pod.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_pod_security_context:
  runAsUser: 100
  fsGroup: 65533
```

### gitlab_runner_pre_entrypoint_script

Custom bash script executed before the gitlab-runner process starts.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_pre_entrypoint_script: ''
```

### gitlab_runner_priority_class_name

PriorityClass name applied to the runner manager pod.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_priority_class_name: ''
```

### gitlab_runner_probe_timeout_seconds

Timeout in seconds for liveness and readiness probes. 0 = chart default.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_probe_timeout_seconds: 0
```

### gitlab_runner_rbac_cluster_wide_access

Allow the runner to manage resources cluster-wide rather than only in its namespace.

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_rbac_cluster_wide_access: false
```

### gitlab_runner_rbac_create

Create Role/RoleBinding (or ClusterRole/ClusterRoleBinding when clusterWideAccess is enabled).

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_rbac_create: true
```

### gitlab_runner_rbac_rules

Additional RBAC rules to grant to the runner. Empty list lets the chart use its defaults.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_rbac_rules: []
```

#### Example usage

```YAML
  gitlab_runner_rbac_rules:
    - apiGroups: [""]
      resources: ["pods"]
      verbs: ["create", "delete", "get"]
```

### gitlab_runner_readiness_probe

Custom readinessProbe for the runner container.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_readiness_probe: {}
```

### gitlab_runner_replicas

Number of runner manager pods to launch.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_replicas: 1
```

### gitlab_runner_resources

Resource requests and limits for the runner manager pod.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_resources: {}
```

#### Example usage

```YAML
  gitlab_runner_resources:
    requests:
      cpu: "100m"
      memory: "128Mi"
    limits:
      cpu: "200m"
      memory: "256Mi"
```

### gitlab_runner_revision_history_limit

How many old ReplicaSets for this Deployment to retain.

**_Type:_** integer<br />

### gitlab_runner_runner_name

Runner name reported to GitLab. Empty = chart default.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_runner_name: ''
```

### gitlab_runner_runtime_class_name

RuntimeClass name applied to the runner manager pod.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_runtime_class_name: ''
```

### gitlab_runner_scheduler_name

Custom scheduler used to schedule the runner manager pods.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_scheduler_name: ''
```

### gitlab_runner_secrets

Secrets mounted into the runner pod (read-only) at /secrets.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_secrets: []
```

#### Example usage

```YAML
  gitlab_runner_secrets:
    - name: "my-secret"
```

### gitlab_runner_security_context

Container-level securityContext applied to the runner manager container.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_security_context:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: false
  runAsNonRoot: true
  privileged: false
  capabilities:
    drop:
      - ALL
```

### gitlab_runner_sentry_dsn

Sentry DSN used by the runner manager to report errors.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_sentry_dsn: ''
```

### gitlab_runner_service_account_annotations

Annotations to apply to the runner ServiceAccount.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_service_account_annotations: {}
```

### gitlab_runner_service_account_image_pull_secrets

imagePullSecrets attached to the ServiceAccount.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_service_account_image_pull_secrets: []
```

### gitlab_runner_service_account_name

ServiceAccount name to use. Empty = chart generates one based on the release name.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_service_account_name: ''
```

### gitlab_runner_session_server_enabled

Enable the runner session server (used for interactive web terminals).

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_session_server_enabled: false
```

### gitlab_runner_session_server_external_port

Session server external port advertised to GitLab. 0 = chart default.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_session_server_external_port: 0
```

### gitlab_runner_session_server_internal_port

Session server internal listening port. 0 = chart default.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_session_server_internal_port: 0
```

### gitlab_runner_session_server_node_port

NodePort assigned to the session server when serviceType is NodePort. 0 = auto.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_session_server_node_port: 0
```

### gitlab_runner_session_server_public_ip

Public IP or hostname advertised by the session server.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_session_server_public_ip: ''
```

### gitlab_runner_session_server_service_type

Service type for the session server. Options: ClusterIP, Headless, NodePort, LoadBalancer.

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_session_server_service_type: LoadBalancer
```

### gitlab_runner_shutdown_timeout

Timeout in seconds for forceful shutdown of the runner process.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_shutdown_timeout: 0
```

### gitlab_runner_strategy

Update strategy for the runner Deployment.

**_Type:_** dict<br />

#### Default value

```YAML
gitlab_runner_strategy: {}
```

#### Example usage

```YAML
  gitlab_runner_strategy:
    type: "RollingUpdate"
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
```

### gitlab_runner_termination_grace_period_seconds

Grace period (in seconds) before pods are forcibly terminated, allowing in-flight
jobs to finish.

**_Type:_** integer<br />

#### Default value

```YAML
gitlab_runner_termination_grace_period_seconds: 3600
```

### gitlab_runner_token

Runner authentication token retrieved from the GitLab UI/API.
When set (and gitlab_runner_existing_secret is empty), the role creates a Kubernetes
secret holding this token and the chart consumes it. Mark this variable as sensitive
(e.g. with Ansible Vault or an external secret store).

**_Type:_** string<br />

#### Default value

```YAML
gitlab_runner_token: ''
```

### gitlab_runner_tolerations

Tolerations applied to the runner manager pod.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_tolerations: []
```

### gitlab_runner_topology_spread_constraints

topologySpreadConstraints applied to the runner manager pod.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_topology_spread_constraints: []
```

### gitlab_runner_unregister_runners

Unregister all runners before chart termination/upgrade.

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_unregister_runners: true
```

### gitlab_runner_volume_mounts

Additional volume mounts attached to the runner container.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_volume_mounts: []
```

### gitlab_runner_volumes

Additional volumes attached to the runner Deployment.

**_Type:_** list<br />

#### Default value

```YAML
gitlab_runner_volumes: []
```

### gitlab_runner_wait_install

Wait for helm install to finish

**_Type:_** boolean<br />

#### Default value

```YAML
gitlab_runner_wait_install: false
```

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
