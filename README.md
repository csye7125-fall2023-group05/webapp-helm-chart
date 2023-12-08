# Webapp Helm Chart

Helm is the best way to find, share, and use software built for Kubernetes. In a way, it is a package manager for Kubernetes.

Helm helps you manage Kubernetes applications — `Helm Charts` help you define, install, and upgrade even the most complex Kubernetes application.

## Installation

> NOTE: The below steps mentioned are for MacOS only. For other distros, please refer the [official documentation](https://helm.sh/docs/intro/install/).

To install Helm, use the following command:

```bash
brew install helm
```

## Helm Concepts

- A _Chart_ is a Helm package. It contains all of the resource definitions necessary to run an application, tool, or service inside of a Kubernetes cluster. Think of it like the Kubernetes equivalent of a Homebrew formula, an Apt dpkg, or a Yum RPM file.
- A _Repository_ is the place where charts can be collected and shared.
- A _Release_ is an instance of a chart running in a Kubernetes cluster. One chart can often be installed many times into the same cluster. And each time it is installed, a new _release_ is created. Consider a MySQL chart. If you want two databases running in your cluster, you can install that chart twice. Each one will have its own _release_, which will in turn have its own _release name_.

Helm installs _charts_ into Kubernetes, creating a new _release_ for each installation. And to find new charts, you can search Helm chart _repositories_.

### The Chart File Structure

A chart is organized as a collection of files inside of a directory. The directory name is the name of the chart (without versioning information). Thus, a chart describing WordPress would be stored in a `wordpress/` directory.

Inside of this directory, Helm will expect a structure that matches this:

```text
wordpress/
  Chart.yaml          # A YAML file containing information about the chart
  LICENSE             # OPTIONAL: A plain text file containing the license for the chart
  README.md           # OPTIONAL: A human-readable README file
  values.yaml         # The default configuration values for this chart
  values.schema.json  # OPTIONAL: A JSON Schema for imposing a structure on the values.yaml file
  charts/             # A directory containing any charts upon which this chart depends.
  crds/               # Custom Resource Definitions
  templates/          # A directory of templates that, when combined with values,
                      # will generate valid Kubernetes manifest files.
  templates/NOTES.txt # OPTIONAL: A plain text file containing short usage notes
```

> Helm reserves use of the `charts/`, `crds/`, and `templates/` directories, and of the listed file names. Other files will be left as they are.

### Chart.yaml

The `Chart.yaml` file is required for a chart. It contains the following fields:

```yaml
apiVersion: The chart API version (required)
name: The name of the chart (required)
version: A SemVer 2 version (required)
kubeVersion: A SemVer range of compatible Kubernetes versions (optional)
description: A single-sentence description of this project (optional)
type: The type of the chart (optional)
keywords:
  - A list of keywords about this project (optional)
home: The URL of this projects home page (optional)
sources:
  - A list of URLs to source code for this project (optional)
dependencies: # A list of the chart requirements (optional)
  - name: The name of the chart (nginx)
    version: The version of the chart ("1.2.3")
    repository: (optional) The repository URL ("https://example.com/charts") or alias ("@repo-name")
    condition: (optional) A yaml path that resolves to a boolean, used for enabling/disabling charts (e.g. subchart1.enabled )
    tags: # (optional)
      - Tags can be used to group charts for enabling/disabling together
    import-values: # (optional)
      - ImportValues holds the mapping of source values to parent key to be imported. Each item can be a string or pair of child/parent sublist items.
    alias: (optional) Alias to be used for the chart. Useful when you have to add the same chart multiple times
maintainers: # (optional)
  - name: The maintainers name (required for each maintainer)
    email: The maintainers email (optional for each maintainer)
    url: A URL for the maintainer (optional for each maintainer)
icon: A URL to an SVG or PNG image to be used as an icon (optional).
appVersion: The version of the app that this contains (optional). Needn't be SemVer. Quotes recommended.
deprecated: Whether this chart is deprecated (optional, boolean)
annotations:
  example: A list of annotations keyed by name (optional).
```

> As of `v3.3.2`, additional fields are not allowed. The recommended approach is to add custom metadata in `annotations`.

To know more about how to work with `values.yaml` and `./templates/_helpers.tpl`, i.e., using template functions and variables in Helm, refer the [official documentation](https://helm.sh/docs/chart_template_guide/).

## Using charts in Helm

- To create a chart:

```bash
# helm create [chart-name]
helm create webapp-helm-chart
```

- To debug your k8s configuration and test it against the k8s api server, use the following command:

```bash
# helm install [release-name] --debug -dry-run [chart-name]
helm install webapp-helm-release --debug --dry-run webapp-helm-chart
```

> This command actually verifies your configuration mentioned in the `yaml` files against a k8s api server

- To verify your configuration, but not against a k8s api server, we use `templates`, which will render the chart templates locally:

```bash
# helm template [chart-name]
helm template webapp-helm-chart
```

- To find any errors or misconfigurations in your helm configurations, we use `lint`:

```bash
# helm lint [chart-name]
helm lint webapp-helm-chart
```

- To install a chart onto a k8s cluster:

```bash
# helm install [release-name] [chart-name]
helm install webapp-helm-release webapp-helm-chart
```

- To update a chart in an already running k8s cluster:

```bash
# helm upgrade [release-name] [chart-name]
helm upgrade webapp-helm-release webapp-helm-chart
```

- To uninstall a chart, use:

```bash
# helm uninstall [release-name]
helm uninstall webapp-helm-release
```

- To update your helm dependencies, use the command:

```bash
helm dependency upgrade
```

- Once you have edited a chart, helm can package it into a chart archive for you:

```bash
# helm package [chart-name]
helm package webapp-helm-chart
```

## 📈 Chart Dependencies

In case we want to use another chart as a dependency for our custom Helm chart, we can use them by adding a `dependencies` section in the `Chart.yaml`.

- For our use-case, let us assume we need a Postgresql Helm chart. In order to add it as a dependency for our custom chart, we need to edit the following files with the given example code:

```yaml
# values.yaml
psql:
  enabled: true
```

```yaml
# Chart.yaml
dependencies:
  - name: postgresql
    version: "13.1.5"
    repository: https://charts.bitnami.com/bitnami
    condition: psql.enabled # referenced from `values.yaml`
```

> NOTE: You also need to overwrite the postgresql database username and passwords in order for the webapp to connect to the postgresql stateful set with the correct user.

- Now we need to add the `bitnami` Helm repository, we can do that by running:

```bash
# add bitnami to repositories
helm repo add bitnami https://charts.bitnami.com/bitnami
```

- Pull the `postgresql` Helm chart from the bitnami repo:

```bash
# the --untar will untar the bitnami/postgresql Helm chart
helm pull bitnami/postgresql --untar
```

- To add the latest "pulled" `bitnami/postgresql` Helm chart as a dependency to our custom Helm chart:

```bash
helm dependency update
```

## Enable Metrics Server in Minikube

- In order for HPA to work we need to **ENABLE** `metrics` server which we first need to enable it in the cluster
- This is the command to enable metrics server in **minikube**

```bash
 minikube addons enable metrics-server
```

## Enable Cilium for N/w Policies to work in Minikube

- Install `cilium-cli` on your local workstation

```bash
# macOS only
brew install cilium-cli
```

- In order to run the below steps your cluster(minikube) should be up
- Also, we need to install `cilium`to run the below commands

```bash
# to install cilium in cluster
cilium install

# to test the connectivity with cluster
cilium connectivity test
```

## Istio Setup  [official documentation](https://istio.io/latest/docs/setup/getting-started/)

- Download & move in that downloaded directory of Istio

```bash
curl -L https://istio.io/downloadIstio | sh -
export PATH=$PWD/bin:$PATH
```

- Install istio

```bash
istioctl install
```

- Label the namespace where we would want our Envoy Proxy to be deployed

```bash
# this helps istio to identify where to deploy envoy proxies as a side car
kubectl label namespace webapp istio-injection=enabled
```

- After installing helm chart we would need to create a tunnel if testing in minikube else just need to use the external IP exposed by the istio-ingress service

```bash
minikube tunnel
```
