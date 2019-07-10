source 00-common.sh

# See:
# - https://istio.io/docs/tasks/security/authn-policy/
# - https://istio.io/docs/concepts/security/#authorization
# - https://istio.io/help/ops/security/debugging-authorization/

set -x

# Turn RBAC on
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/platform/kube/rbac/rbac-config-ON.yaml
