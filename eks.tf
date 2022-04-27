resource "aws_iam_role" "eks_cluster" {
  name = "eks_cluster"


  assume_role_policy = <<POLICY
    {

        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Effect" : "Allow",
                "Principal" : { "Service" : "eks.amazonaws.com" },
                "Action" : "sts:AssumeRole"
            }
        ]
    }
    POLICY
}

resource "aws_iam_role_policy_attachment" "aws_eksc_policy" {
  #ARN
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    #attach pol
  role = aws_iam_role.eks_cluster.name
}

#make clust
resource "aws_eks_cluster" "EKS" {
  name = "EKS"
  role_arn = aws_iam_role.eks_cluster.arn
  version = "1.18"
  
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true

    subnet_ids = [ 
        aws_subnet.pub1.id,
        aws_subnet.pub2.id,
        aws_subnet.pub3.id,
        aws_subnet.pv1.id,
        aws_subnet.pv2.id,
        aws_subnet.pv3.id
     ]
  }
  depends_on = [aws_iam_role_policy_attachment.aws_eksc_policy]
}