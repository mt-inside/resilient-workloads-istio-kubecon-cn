source 00-common.sh

set -x

kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/policy/mixer-rule-deny-label.yaml
