resource "null_resource" "docker_image" {
  triggers = {
    version = var.image_tag
  }

  provisioner "local-exec" {
    command = <<EOF
    cd ${var.dockerfile_path} &&
    docker build -t ${var.repository_url}:${var.image_tag} .
    aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${var.repository_url}
    docker push ${var.repository_url}:${var.image_tag}
    EOF
  }
}

output "docker_image_uri" {
  value = "${var.repository_url}:${var.image_tag}"
  depends_on = [
    null_resource.docker_image
  ]
}