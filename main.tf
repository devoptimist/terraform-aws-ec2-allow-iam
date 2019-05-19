resource "aws_iam_role" "ec2_allow" {
  name = "${var.policy_name}"
  count = "${var.create_policy}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "ec2_allow" {
  name = "${var.policy_name}"
  role = "${aws_iam_role.ec2_allow.id}"
  count = "${var.create_policy}"

  policy = <<EOF
{
  "Version": "2012-10-17"
  "Statement": [
    {
      "Action": [
        "iam:RemoveRoleFromInstanceProfile",
        "iam:DeleteInstanceProfile",
        "cloudformation:DescribeStacks",
        "cloudformation:DeleteStack",
        "cloudformation:DescribeStackResources",
        "cloudwatch:PutMetricAlarm",
        "cloudwatch:DescribeAlarms",
        "cloudwatch:DeleteAlarms",
        "ec2:AllocateAddress",
        "ec2:AssignPrivateIpAddresses",
        "ec2:AssociateAddress",
        "ec2:CreateVolume",
        "ec2:DeleteVolume",
        "ec2:DeleteVpc",
        "ec2:DeleteRouteTable",
        "ec2:DeleteSubnet",
        "ec2:DeleteInternetGateway",
        "ec2:DisassociateRouteTable",
        "ec2:DeleteNetworkAcl",
        "ec2:DetachInternetGateway",
        "ec2:DeleteNetworkAclEntry",
        "ec2:DeleteRoute",
        "ec2:DescribeNetworkAcls",
        "ec2:DeleteNetworkAclEntry",
        "ec2:DeleteSecurityGroup",
        "ec2:CreateTags",
        "ec2:DescribeAddresses",
        "ec2:DescribeAvailabilityZones",
        "ec2:DescribeInstanceAttribute",
        "ec2:DescribeInstanceStatus",
        "ec2:DescribeInstances",
        "ec2:DescribeInternetGateways",
        "ec2:DescribeInternetGatewaysResult",
        "ec2:DescribeRouteTables",
        "ec2:DescribeRegions",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSubnets",
        "ec2:DescribeTags",
        "ec2:DescribeVolumeAttribute",
        "ec2:DescribeVolumeStatus",
        "ec2:DescribeVolumes",
        "ec2:DescribeVpcs",
        "ec2:ReplaceNetworkAclAssociation",
        "ec2:RunInstances",
        "ec2:StartInstances",
        "ec2:StopInstances",
        "ec2:TerminateInstances",
        "ec2:UnassignPrivateIpAddresses",
        "ec2:CancelSpotInstanceRequests",
        "ec2:RequestSpotInstances",
        "ec2:DescribeSpotInstanceRequests",
        "ec2:DescribeImages",
        "ec2:GetPasswordData",
        "ec2:GetConsoleOutput"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_allow" {
  count = "${var.create_policy}"
  name = "${var.policy_name}"
  role = "${aws_iam_role.ec2_allow.name}"
}

provisioner "local-exec" {
  command = "sleep 30"
}
