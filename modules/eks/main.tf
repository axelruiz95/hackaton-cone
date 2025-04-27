resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-hackaton-${var.project}-role"

  assume_role_policy = data.aws_iam_policy_document.eks_assume_role_policy.json

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-eks-cluster-role"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}

data "aws_iam_policy_document" "eks_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster-hackaton-${var.project}"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-eks-cluster"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}

resource "aws_eks_node_group" "eks_node_g" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-nodegroup-hackaton-${var.project}"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  instance_types = ["t3.medium"] 

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-eks-nodegroup"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}

resource "aws_iam_role" "eks_node_role" {
  name = "eks-node-role-hackaton-${var.project}"

  assume_role_policy = data.aws_iam_policy_document.eks_node_assume_role_policy.json

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-eks-node-role"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}
resource "aws_iam_role_policy_attachment" "eks_worker_node" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ec2_readonly" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}


data "aws_iam_policy_document" "eks_node_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
