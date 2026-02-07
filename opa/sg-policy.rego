package terraform.security

deny[msg] {
  r := input.resource_changes[_]
  r.type == "aws_security_group"
  ingress := r.change.after.ingress[_]
  ingress.cidr_blocks[_] == "0.0.0.0/0"
  msg := "Open security group detected"
}
