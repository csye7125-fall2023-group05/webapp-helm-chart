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
  labels:
    app: {{ .Values.podLabel.app }}
    service: {{ .Values.podLabel.service }}
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
{{- define "webapp-helm-chart.configMap" }}
  {{- with .Values.config }}
  flyway_url: "jdbc:postgresql://psql-db-0.psql-service.{{ .namespace }}.svc.cluster.local:{{ .app_dbport}}/{{ .app_db }}"
  app_hostname: {{ .app_hostname }}
  app_port: {{ .app_port | quote }}
  app_db: {{ .app_db }}
  app_dbhost: "psql-db-0.psql-service.{{ .namespace }}.svc.cluster.local"
  app_dbport: {{ .app_dbport | quote }}
  app_dbschema: {{ .app_dbschema }}
  {{- end }}
{{- end }}