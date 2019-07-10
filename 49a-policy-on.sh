source 00-common.sh

set -x

kubectl -n istio-system get cm istio -o jsonpath="{@.data.mesh}" | grep disablePolicyChecks

helm template istio-$ISTIO_VERSION/install/kubernetes/helm/istio --namespace=istio-system -x templates/configmap.yaml --set global.disablePolicyChecks=false | kubectl -n istio-system replace -f -

kubectl -n istio-system get cm istio -o jsonpath="{@.data.mesh}" | grep disablePolicyChecks
