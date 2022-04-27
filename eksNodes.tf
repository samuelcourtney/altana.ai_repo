resource "aws_iam_role" "eks_nodes" {
  name = "eks_nodes"


  assume_role_policy = <<POLICY
    {

        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Effect" : "Allow",
                "Principal" : { 
                    "Service" : "ec2.amazonaws.com" 
                },
                "Action" : "sts:AssumeRole"
            }
        ]
    }
    POLICY
}

resource "aws_iam_policy_attachment" "worker_node_policy" {
  name = "worker_node_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  roles = aws_iam_role.eks_nodes.name
}

resource "aws_iam_policy_attachment" "cni" {
  name = "cni"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  roles = aws_iam_role.eks_nodes.name
}

resource "aws_iam_policy_attachment" "regRO" {
  name = "regRO"  
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  roles = aws_iam_role.eks_nodes.name
}

resource "aws_eks_node_group" "nodes" {
  cluster_name = aws_eks_cluster.EKS.name
  node_group_name = "eks_nodes"
  node_role_arn = aws_iam_role.eks_nodes.arn

subnet_ids = [
    aws_subnet.pv1.id,
    aws_subnet.pv2.id,
    aws_subnet.pv3.id
]
scaling_config {
  desired_size = 1
  max_size = 1
  min_size = 1
}

    ami_type = "AL2_x86_64"
    capacity_type = "ON_DEMAND"
    disk_size = 1
    force_update_version = false
    instance_types =["t2.mirco"]

    labels = {
    role = "eks_nodes"
    }

    version = "1.18"

    depends_on = [
        aws_iam_policy_attachment.regRO,
        aws_iam_policy_attachment.cni,
        aws_iam_policy_attachment.worker_node_policy
    ]
}

