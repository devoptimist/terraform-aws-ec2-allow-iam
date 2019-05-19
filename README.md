# Important
This module create an aws iam role, role policy and profile for enabling
ec2 access

## Usage

```hcl
module "create_profile" {
  policy_name   = "test_policy"
  create_policy = true
}
```

## Inputs

| Name | Description | Type | Default | Required |
|policy_name| The name to give to the role, role policy and profile | string | ec2_allow_policy | no |
|create_policy|Used as a boolean should only ever be 0 or 1 | int | 1 | no|

