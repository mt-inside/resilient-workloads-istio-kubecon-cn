source 00-common.sh

set -x
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/platform/kube/bookinfo.yaml
#kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/platform/kube/bookinfo-add-serviceaccount.yaml
kubectl get pods --watch
