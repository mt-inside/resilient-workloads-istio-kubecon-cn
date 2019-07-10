source 00-common.sh
set +o errexit

set -x

kubectl patch ClusterRbacConfig default --type json -p '[{"op": "replace", "path": "/spec/mode", "value": "OFF"}]'
