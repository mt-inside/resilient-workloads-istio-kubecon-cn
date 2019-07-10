# Check authn
kubectl get policies.authentication.istio.io --all-namespaces
kubectl get meshpolicies.authentication.istio.io
kubectl get destinationrules.networking.istio.io --all-namespaces -o yaml | grep "host:"


# Check RBAC is on
kubectl get clusterrbacconfigs.rbac.istio.io --all-namespaces

# Check pilot likes your RBAC YAMLs
kubectl port-forward $(kubectl -n istio-system get pods -l istio=pilot -o jsonpath='{.items[0].metadata.name}') -n istio-system 9876:9876
open http://127.0.0.1:9876/scopez
kubectl logs $(kubectl -n istio-system get pods -l istio=pilot -o jsonpath='{.items[0].metadata.name}') -c discovery -n istio-system -f | grep rbac

# Check envoy is getting RBAC config
kubectl exec  $(kubectl get pods -l app=details -o jsonpath='{.items[0].metadata.name}') -c istio-proxy -- curl localhost:15000/config_dump -s | less

# Check envoy is making the right decisions
kubectl exec  $(kubectl get pods -l app=details -o jsonpath='{.items[0].metadata.name}') -c istio-proxy -- curl -X POST localhost:15000/logging?rbac=debug -s | grep rbac
kubectl logs $(kubectl get pods -l app=details -o jsonpath='{.items[0].metadata.name}') -c istio-proxy -f
