#!/usr/bin/env bash

kubectl delete -n pg-nais-verification postgresql.acid.zalan.do/test-postgres-image
sleep 30

script=$(mktemp)
kubectl get rolebinding,serviceaccount,job,svc,pod,ep,cm,endpointslice,iampolicy,pdb,fqdnnetworkpolicy,netpol,secret,pvc,sts,postgresql -A | grep test-postgres-image | awk '{print "kubectl delete -n " $1 " "$2}' > "${script}"
chmod +x "${script}"
"${script}"
rm -f "${script}"
