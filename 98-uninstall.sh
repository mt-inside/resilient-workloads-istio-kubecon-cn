source 00-common.sh

set +o errexit

set -x

kubectl delete -f istio-$ISTIO_VERSION/samples/bookinfo/platform/kube/bookinfo-add-serviceaccount.yaml
kubectl delete -f istio-$ISTIO_VERSION/samples/bookinfo/platform/kube/bookinfo.yaml
# FIXME: write istio install yaml to a file on install, use here to delete
helm template istio-$ISTIO_VERSION/install/kubernetes/helm/istio --name istio --namespace istio-system | kubectl delete -f -
kubectl delete -f istio-$ISTIO_VERSION/install/kubernetes/helm/istio-init/files
kubectl delete -f istio-$ISTIO_VERSION/install/kubernetes/namespace.yaml
