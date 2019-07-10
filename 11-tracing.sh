source 00-common.sh

set -x

# In the production configurations, jaeger's sample rate is 1%, so we need >100 requests to get a trace (try 120 for safety).
# In the demo config, the sample rate is 100%.
for i in `seq 1 3`; do curl -s -o /dev/null http://$GATEWAY_URL/productpage; done
echo open http://localhost:16686
kubectl port-forward -n istio-system $(kubectl get pod -n istio-system -l app=jaeger -o jsonpath='{.items[0].metadata.name}') 16686:16686
