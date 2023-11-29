{{/*
Expand the name of the chart.
*/}}
{{- define "webapp-helm-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "webapp-helm-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "webapp-helm-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "webapp-helm-chart.labels" }}
app: {{ .Values.podLabel.app }}
service: {{ .Values.podLabel.service }}
{{- end }}

{{/*
DB labels
*/}}
{{- define "webapp-helm-chart.db.labels" }}
app: {{ .Values.postgresql.primary.podLabels.app }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "webapp-helm-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "webapp-helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
ConfigMap data
*/}}
{{- define "webapp-helm-chart.configData" }}
  flyway_url: "jdbc:postgresql://{{ include "postgresql.v1.primary.fullname" .Subcharts.postgresql }}-0.{{  include "postgresql.v1.primary.svc.headless" .Subcharts.postgresql }}.{{ .Values.namespace }}.svc.cluster.local:{{ .Values.config.app_dbport}}/{{ .Values.config.app_db }}"
  app_dbhost: "{{ include "postgresql.v1.primary.fullname" .Subcharts.postgresql }}-0.{{  include "postgresql.v1.primary.svc.headless" .Subcharts.postgresql }}.{{ .Values.namespace }}.svc.cluster.local"
  {{- with .Values.config }}
  app_hostname: {{ .app_hostname }}
  app_port: {{ .app_port | quote }}
  app_db: {{ .app_db }}
  app_dbport: {{ .app_dbport | quote }}
  app_dbschema: {{ .app_dbschema }}
  k8s_group: {{ .k8s_group }}
  k8s_api_version: {{ .k8s_api_version }}
  k8s_cr_kind: {{ .k8s_cr_kind }}
  k8s_cr_kind_plural: {{ .k8s_cr_kind_plural }}
  k8s_namespace: {{ .k8s_namespace }}
  k8s_broker_0: {{ .k8s_broker_0 }}
  k8s_broker_1: {{ .k8s_broker_1 }}
  k8s_broker_2: {{ .k8s_broker_2 }}
  k8s_client_id: {{ .k8s_client_id }}
  k8s_docker_config_json: {{ .k8s_docker_config_json }}
  k8s_topic: {{ .k8s_topic }}

  {{- end }}
{{- end }}

{{/*
Secret data
*/}}
{{- define "webapp-helm-chart.secretData" }}
  {{- with .Values.secret }}
  flyway_user: {{ .username | b64enc }}
  flyway_password: {{ .password | b64enc }}
  {{- end }}
{{- end }}

{{/*
Liveness probe
*/}}
{{- define "webapp-helm-chart.livenessProbe" }}
  httpGet:
    path: {{ .Values.probes.path }}
    port: {{ .Values.service.port }}
  initialDelaySeconds: {{ .Values.livenessConfig.initialDelaySeconds }}
  periodSeconds: {{ .Values.livenessConfig.periodSeconds }}
{{- end }}

{{/*
Readiness probe
*/}}
{{- define "webapp-helm-chart.readinessProbe" }}
  httpGet:
    path: {{ .Values.probes.path }}
    port: {{ .Values.service.port }}
  initialDelaySeconds: {{ .Values.readinessConfig.initialDelaySeconds }}
  periodSeconds: {{ .Values.readinessConfig.periodSeconds }}
{{- end }}

{{/*
Deployment Strategy
*/}}
{{- define "webapp-helm-chart.deployStrategy" }}
{{- with .Values.deployStrat }}
type: {{ .rolling }}
rollingUpdate:
  maxSurge: {{ .maxSurge }}
  maxUnavailable: {{ .maxUnavailable}}
{{- end }}
{{- end }}
