module "tg_bot" {
  source = "../../modules/ec2"
  instances_count = 1
  instance_availability_zones_mapping = data.terraform_remote_state.main.outputs.main_vpc.availability_zones_mapping
  instance_key_name = data.terraform_remote_state.main.outputs.aws_key_pair_user.key_name
  base_name = "tg-bot"
  instance_subnets_mapping = data.terraform_remote_state.main.outputs.main_vpc.subnets_mapping
  instance_tags = {
    mission = "tgbot"
  }
  instance_type = "t3.micro"
  instance_vpc_security_group_ids = [
    data.terraform_remote_state.main.outputs.main_vpc.security_group_allow_ssh,
    data.terraform_remote_state.main.outputs.main_vpc.security_group_outgoing,
    data.terraform_remote_state.main.outputs.main_vpc.security_group_allow_all_internal,
  ]
}
