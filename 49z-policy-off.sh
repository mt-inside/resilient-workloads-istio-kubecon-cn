source 00-common.sh
set +o errexit

set -x

kubectl delete -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml
kubectl delete -f istio-$ISTIO_VERSION/samples/bookinfo/policy/mixer-rule-deny-label.yaml

helm template istio-$ISTIO_VERSION/install/kubernetes/helm/istio --namespace=istio-system -x templates/configmap.yaml --set global.disablePolicyChecks=true | kubectl -n istio-system replace -f -
kubectl -n istio-system get cm istio -o jsonpath="{@.data.mesh}" | grep disablePolicyChecks
