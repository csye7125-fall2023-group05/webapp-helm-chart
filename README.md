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


## Using charts in Helm

- To create a chart:

```bash
# helm create [chart-name]
helm create webapp-helm-chart
```

- To install a chart onto a k8s cluster:

```bash
helm install [release-name] [chart-name]
helm install webapp-helm-release webapp-helm-chart
```

- To debug your k8s configuration and test it against the k8s api server, use the following command:

```bash
helm install [release-name] --debug -dry-run [chart-name]
helm install webapp-helm-release --debug -dry-run webapp-helm-chart
```

> This command actually verifies your configuration mentioned in the `yaml` files against a k8s api server

- To verify your configuration, but not against a k8s api server, we use `templates`, which will render the chart templates locally:

```bash
helm template [chart-name]
helm template webapp-helm-chart
```

- To find any errors or misconfigurations in your helm configurations, we use `lint`:

```bash
helm lint [chart-name]
helm lint webapp-helm-chart
```

- To uninstall a chart, use:

```bash
helm uninstall [release-name]
helm uninstall webapp-helm-release
```

