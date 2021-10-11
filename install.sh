export ADMIN_EMAIL=admin
export ADMIN_PASSWORD=admin

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube start --kubernetes-version='v1.18.2' --memory='5gb' --disk-size='20gb'  --force

minikube start --memory='5gb' --disk-size='20gb'  --force

helm repo add shipa-charts https://shipa-charts.storage.googleapis.com

helm repo update

helm install shipa shipa-charts/shipa --namespace shipa-system --create-namespace  --set auth.adminUser=admin@shipa.io  --set auth.adminPassword=admin_Admin_34  --timeout=45m --wait --debug


helm install shipa shipa-charts/shipa --namespace shipa-system --create-namespace   --timeout=15m  --wait --debug -f values.override.yaml

helm install shipa shipa-charts/shipa \
--timeout=15m \
--namespace shipa-system \
--create-namespace \
--set=metrics.image=gcr.io/shipa-1000/metrics:30m \
--set=auth.adminUser=admin@shipa.io \
--set=auth.adminPassword=shipa2020 \
--set=shipaCluster.serviceType=ClusterIP \
--set=shipaCluster.ip=10.100.10.20 \
--set=service.nginx.serviceType=ClusterIP \
--set=service.nginx.clusterIP=10.100.10.10

