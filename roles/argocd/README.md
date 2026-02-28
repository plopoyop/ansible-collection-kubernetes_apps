# argocd

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [argocd_additional_config](#argocd_additional_config)
  - [argocd_application_controller_resources](#argocd_application_controller_resources)
  - [argocd_application_sets](#argocd_application_sets)
  - [argocd_application_sets_default_go_template_options](#argocd_application_sets_default_go_template_options)
  - [argocd_applications](#argocd_applications)
  - [argocd_clusters](#argocd_clusters)
  - [argocd_controller_replicas](#argocd_controller_replicas)
  - [argocd_default_finalizers](#argocd_default_finalizers)
  - [argocd_deployment_name](#argocd_deployment_name)
  - [argocd_enabled](#argocd_enabled)
  - [argocd_helm_chart_ref](#argocd_helm_chart_ref)
  - [argocd_helm_chart_version](#argocd_helm_chart_version)
  - [argocd_helm_repo_name](#argocd_helm_repo_name)
  - [argocd_helm_repo_url](#argocd_helm_repo_url)
  - [argocd_namespace](#argocd_namespace)
  - [argocd_projects](#argocd_projects)
  - [argocd_redis_resources](#argocd_redis_resources)
  - [argocd_repo_server_replicas](#argocd_repo_server_replicas)
  - [argocd_repo_server_resources](#argocd_repo_server_resources)
  - [argocd_repositories](#argocd_repositories)
  - [argocd_server_ingress_annotations](#argocd_server_ingress_annotations)
  - [argocd_server_ingress_class_name](#argocd_server_ingress_class_name)
  - [argocd_server_ingress_enabled](#argocd_server_ingress_enabled)
  - [argocd_server_ingress_hostname](#argocd_server_ingress_hostname)
  - [argocd_server_ingress_labels](#argocd_server_ingress_labels)
  - [argocd_server_ingress_tls_enabled](#argocd_server_ingress_tls_enabled)
  - [argocd_server_ingress_tls_secret_name](#argocd_server_ingress_tls_secret_name)
  - [argocd_server_replicas](#argocd_server_replicas)
  - [argocd_server_resources](#argocd_server_resources)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

None.

## Default Variables

### argocd_additional_config

Additional configuration to merge with the helm values.
This allows to add any configuration not explicitly exposed by this role.

**_Type:_** dict<br />

#### Default value

```YAML
argocd_additional_config: {}
```

### argocd_application_controller_resources

ArgoCD application controller resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
argocd_application_controller_resources: {}
```

### argocd_application_sets

List of application sets to add to ArgoCD
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#application-sets

**_Type:_** list<br />

#### Default value

```YAML
argocd_application_sets: []
```

### argocd_application_sets_default_go_template_options

Default go template options for application sets

**_Type:_** list<br />

#### Default value

```YAML
argocd_application_sets_default_go_template_options:
  - missingkey=error
```

### argocd_applications

List of applications to add to ArgoCD
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#applications

**_Type:_** list<br />

#### Default value

```YAML
argocd_applications: []
```

### argocd_clusters

List of clusters to add to ArgoCD
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#clusters

**_Type:_** list<br />

#### Default value

```YAML
argocd_clusters: []
```

### argocd_controller_replicas

Number of ArgoCD application controller replicas

**_Type:_** int<br />

#### Default value

```YAML
argocd_controller_replicas: 1
```

### argocd_default_finalizers

Default finalizers for ArgoCD projects

**_Type:_** list<br />

#### Default value

```YAML
argocd_default_finalizers:
  - resources-finalizer.argocd.argoproj.io
```

### argocd_deployment_name

Deployment name for ArgoCD helm chart

**_Type:_** string<br />

#### Default value

```YAML
argocd_deployment_name: argocd
```

### argocd_enabled

Should ArgoCD helm chart be installed

**_Type:_** boolean<br />

#### Default value

```YAML
argocd_enabled: true
```

### argocd_helm_chart_ref

#### Default value

```YAML
argocd_helm_chart_ref: '{{ argocd_helm_repo_name }}/argo-cd'
```

### argocd_helm_chart_version

Helm chart version to install

**_Type:_** string<br />

#### Default value

```YAML
argocd_helm_chart_version: 9.4.0
```

### argocd_helm_repo_name

#### Default value

```YAML
argocd_helm_repo_name: argo
```

### argocd_helm_repo_url

#### Default value

```YAML
argocd_helm_repo_url: https://argoproj.github.io/argo-helm
```

### argocd_namespace

K8s namespace to install the ArgoCD chart

**_Type:_** string<br />

#### Default value

```YAML
argocd_namespace: argocd
```

### argocd_projects

List of projects to add to ArgoCD
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#projects

**_Type:_** list<br />

#### Default value

```YAML
argocd_projects: []
```

### argocd_redis_resources

ArgoCD redis resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
argocd_redis_resources: {}
```

### argocd_repo_server_replicas

Number of ArgoCD repo server replicas

**_Type:_** int<br />

#### Default value

```YAML
argocd_repo_server_replicas: 1
```

### argocd_repo_server_resources

ArgoCD repo server resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
argocd_repo_server_resources: {}
```

### argocd_repositories

List of repositories to add to ArgoCD
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#repositories

**_Type:_** list<br />

#### Default value

```YAML
argocd_repositories: []
```

#### Example usage

```YAML
argocd_repositories:
  - name: "private-repo"
    type: "git"
    parameters:
      url: "git@github.com:argoproj/my-private-repository.git"
      sshPrivateKey: "{{ lookup('file', '~/.ssh/id_rsa') }}"
```

### argocd_server_ingress_annotations

Annotations for ArgoCD server ingress

**_Type:_** dict<br />

#### Default value

```YAML
argocd_server_ingress_annotations: {}
```

### argocd_server_ingress_class_name

Ingress classname for ArgoCD server ingress

**_Type:_** string<br />

#### Default value

```YAML
argocd_server_ingress_class_name:
```

### argocd_server_ingress_enabled

Enable ingress for ArgoCD server

**_Type:_** boolean<br />

#### Default value

```YAML
argocd_server_ingress_enabled: false
```

### argocd_server_ingress_hostname

Hostname for ArgoCD server ingress

**_Type:_** string<br />

#### Default value

```YAML
argocd_server_ingress_hostname:
```

### argocd_server_ingress_labels

Labels for ArgoCD server ingress

**_Type:_** dict<br />

#### Default value

```YAML
argocd_server_ingress_labels: {}
```

### argocd_server_ingress_tls_enabled

Enable TLS for ArgoCD server ingress

**_Type:_** boolean<br />

#### Default value

```YAML
argocd_server_ingress_tls_enabled: false
```

### argocd_server_ingress_tls_secret_name

Secret name for ArgoCD server TLS certificate

**_Type:_** string<br />

#### Default value

```YAML
argocd_server_ingress_tls_secret_name:
```

### argocd_server_replicas

Number of ArgoCD server replicas

**_Type:_** int<br />

#### Default value

```YAML
argocd_server_replicas: 1
```

### argocd_server_resources

ArgoCD server resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
argocd_server_resources: {}
```

## Dependencies

None.
