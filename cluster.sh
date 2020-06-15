eksctl create cluster \
--name capstone-eks \
--version 1.16 \
--region us-east-1 \
--nodegroup-name standard-workers \
--node-type t3.large \
--nodes 5 \
--nodes-min 1 \
--nodes-max 4 \
--ssh-access \
--ssh-public-key ~/.ssh/id_rsa.pub \
--managed

aws eks --region us-east-1 update-kubeconfig --name capstone-eks