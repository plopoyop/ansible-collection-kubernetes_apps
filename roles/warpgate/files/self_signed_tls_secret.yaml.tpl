apiVersion: v1
kind: Secret
metadata:
  name: {{ .Values.tls_cert_secret }}
  labels:
    {{- include "warpgate.labels" . | nindent 4 }}
type: kubernetes.io/tls
{{- $existing := lookup "v1" "Secret" .Release.Namespace .Values.tls_cert_secret }}
{{- $hostnames := list }}
{{- range splitList "," (include "warpgate.tlsHostnames" .) }}{{- $hostnames = append $hostnames . }}{{- end }}
{{- $generated := genSelfSignedCert (first $hostnames) nil $hostnames 3650 }}
data:
  tls.crt: {{ index ($existing.data | default dict) "tls.crt" | default ($generated.Cert | b64enc) }}
  tls.key: {{ index ($existing.data | default dict) "tls.key" | default ($generated.Key | b64enc) }}
