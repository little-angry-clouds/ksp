export KUBE_HOME=~/.kube

function kgp {
  echo $KUBECONFIG
}

function ksp {
  export KUBE_PROFILE=$1
  export KUBECONFIG=$KUBE_HOME/$1-config
  # Because Terraform's k8s provider is stupid, 
  # let's add another variable that points to the same place
  export KUBE_CONFIG_PATH=$KUBE_HOME/$1-config
}

function kube_profiles {
  reply=($(ls $KUBE_HOME/*-config |
	       awk -F'/' '{print $5}' |
	       sed "s/-config$/ /g" |
	       tr -d '\n'))
}

compctl -K kube_profiles ksp
