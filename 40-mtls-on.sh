source 00-common.sh

set -x

# NB: THIS NEEDS mTLS ON. OTHERWISE ALL CONFIG IS ACCEPTED AND EVERYTHING
# LOOKS GOOD BUT ENVOY'S RBAC FILTER DOESN'T GET THE AUTHN PRINCIPAL WITH
# THE REQUEST SO IT JUST DENIES EVERYTHING.

# Receiving envoys should accept only mTLS
# Not stictly necessary, as the default is PERMISSIVE
kubectl patch MeshPolicy default --type json -p '[{"op": "replace", "path": "/spec/peers/0/mtls", "value": {}}]'

# Bookinfo services send mTLS
kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all-mtls.yaml
