{{/*
Define annotations for ingress
*/}}
{{- define "ingress.annotations" }}
{{ $arn := .Values.ingress.certificate_arn }}
{{- if .Values.ingress.enabled }}
alb.ingress.kubernetes.io/healthcheck-path: /health
alb.ingress.kubernetes.io/group.name: shared-ingress
kubernetes.io/ingress.class: alb
alb.ingress.kubernetes.io/success-codes: "200"
alb.ingress.kubernetes.io/listen-ports: '[{"HTTPS":443}, {"HTTP":80}]'
alb.ingress.kubernetes.io/load-balancer-attributes: deletion_protection.enabled=true
alb.ingress.kubernetes.io/scheme: internet-facing
alb.ingress.kubernetes.io/target-type: ip
alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type": "redirect", "RedirectConfig": { "Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}'
alb.ingress.kubernetes.io/healthcheck-interval-seconds: "30"
alb.ingress.kubernetes.io/healthcheck-timeout-seconds: "3"
alb.ingress.kubernetes.io/unhealthy-threshold-count: '5'
alb.ingress.kubernetes.io/load-balancer-attributes: routing.http2.enabled=true,routing.http.drop_invalid_header_fields.enabled=true,deletion_protection.enabled=true,idle_timeout.timeout_seconds=120
# alb.ingress.kubernetes.io/ip-address-type: dualstack
alb.ingress.kubernetes.io/certificate-arn: {{ $arn }}
{{- end }}
{{- end }}