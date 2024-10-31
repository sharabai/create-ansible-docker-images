# Create docker images for Ansible

## Description

This project covers creation of two docker images for Ansible versions 2.14.13, 2.16.2. Alpine is used as a base image. The script copies ~/grab_this.txt to the created images and runs the playbook from the present folder.

## Instruction

Run `/full/path/to/build_and_run.sh playbook.yml` to create Ansible docker images and run them. The script would create a volume for the current directory from where you are running the command. In your current folder should be all of the ansible files you need to run your playbook. Script takes one parameter - name of the playbook to run.

## License

This project is licensed under a custom restrictive license. All rights are reserved. You may not use, modify, or redistribute this code without explicit permission. Use by automated systems, including AI, is strictly prohibited.

For more details, refer to the [LICENSE](./LICENSE) file.
