resource "aws_iam_role" "ecr_allow" {
  name = "ecr_allow"

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

resource "aws_iam_instance_profile" "ecr_allow" {
 name = "ecr_allow"
 role = "${aws_iam_role.ecr_allow.name}" 
}

resource "aws_iam_policy" "ecr-policy" {
  name        = "ecr-policy"
  description = "ecr-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ecr:GetAuthorizationToken"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "my-policy-attach" {
  role       = "${aws_iam_role.ecr_allow.name}"
  policy_arn = "${aws_iam_policy.ecr-policy.arn}"
}