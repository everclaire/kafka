# data "template_file" "cloud_init_orchestrate" {
#   template = file("cloud-init/node.yml")
#   vars = {
#     remote_user = var.user_name
#     ssh_pub_key = var.ssh_pub_key
#   }
# }

# data "template_file" "cloud_init_zk" {
#   template = file("cloud-init/node.yml")
#   vars = {
#     remote_user = var.user_name
#     ssh_pub_key = var.ssh_pub_key
#   }
# }