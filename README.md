### **About**
This project will create simple aws architecture with one instance. (You can change instances count in `terraform/projects/telegram-bot/module.tg-bot.tf` file using `instances_count` variable). Also you can change some parameters.
Then ansible playbook `ansible/playbooks/tg-bot.yml` will configure instance with some roles:
1) hostname - Just set hostname sane as `ec2_tag_Name` 
2) docker - Install docker
3) docker-swarm - Creates docker swarm cluster (or single instance swarm)
4) tg-bot-exec-service - This role will deploy GoLang binary as systemd service. https://github.com/skydivervrn/bot-tg-go-service This simple service will read `app.output` file and run command from this file in command line. Then it'll put answer to `cmd.output` file for dockerized app.
5) stack - Using `-e 'stack_name=tg_bot'` this role will create config from template and deploy docker swarm stack from this config using image from https://github.com/skydivervrn/bot . 

### **Configuration**:
1) Install AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
2) Use `aws configure` and pass your AWS secrets https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
3) Create an s3 bucket and pass it to terraform remote backend in backend.tf file
4) Create file terraform.tfvars and provide necessary variables
    ```
    user_key_pair = "" //as data of public key
    trusted_ipv4_cidr_blocks = "" // as list of cidr blocks ["1.1.1.1/32"]
    ```
5) (Optional) Create an `vault_password_file` ans pass it to `ansible.cfg` file. ( Or pass variables as plain text. WARNING Don't push sensitive data )
6) In `ansible/inventory/group_vars/all` create `docker-registry.yml` file (added to .gitignor) with content:
    ```yaml
    docker_registry_accounts:
    
      - registry: https://index.docker.io/v1/
        user: DOCKERHUB_USER
        password: YOUSECRETPASSWORD
    ```
7) Pass telegram bot token to `ansible/roles/stack/vars/bot.yml` file.
### **Installation**
1) From `terraform` directory run `terraform init && terraform apply` command and type `yes`.
2) From `ansible` directory run `ansible-playbook playbooks/tg-bot.yml -e 'stack_name=tg_bot'`

TODO:
- Create gitlab CI for building dicker.
- Create autorun.sh script
- Create monitoring server with telegram alerts
