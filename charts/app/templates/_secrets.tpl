{{/* 
secret environment variables from a file
*/}}
{{- define "secrets.fromFile" }}
{{ $namespace := include "common.namespace" . }}
{{ $app := include "app.fullname" . }}
{{ if .Values.secretsToFile.enabled }}
{{ if .Values.secretsToFile.secretNames }}
{{- range $key := .Values.secretsToFile.secretNames }}
- secretKey: {{ $key }}
  remoteRef:
    key: /{{ $namespace }}/{{ $app }}/{{ $key }}
    property: {{ $key }}
{{ end }}
{{ end }}
{{ end }}
{{- end }}

{{/* 
Determine the Pod annotations used in the controller 
*/}}
{{- define "secrets.volumeMount" }}
{{ $app := include "app.fullname" . }}
{{- if .Values.secretsToFile.enabled }}
{{ range $key := .Values.secretsToFile.secretNames }}
- name: {{ $app }}
  mountPath: /app/{{ $key }}
  subPath: {{ $key  }}
  readOnly: true
{{ end }}
{{- end }}
{{- end }}

{{/* 
Determine the Pod annotations used in the controller 
*/}}
{{- define "secrets.volumes" }}
{{ $app := include "app.fullname" . }}
{{- if .Values.secretsToFile.enabled }}
- name: {{ $app }}
  secret:
    secretName: {{ $app }}
    items:
{{ range $key := .Values.secretsToFile.secretNames }}
      - key: {{ $key }}
        path: {{ $key }}
{{ end }}
{{- end }}
{{- end }}