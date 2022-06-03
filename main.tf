resource "github_repository" "git-tf" {
  name        = "terraform-github"
  description = "using terraform for creating repo in Github"

  visibility = "public"

}

resource "null_resource" "git_push" {
  provisioner "local-exec" {
      interpreter = ["PowerShell", "-Command"]
      command = <<EOT
                git init
                git remote add origin  https://github.com/abdallauno1/terraform-github.git
                git branch -M main
                git add .
                git commit -m 'init'
                git push -u origin main
        EOT
  }
}