resource "github_repository" "LabIaC" {
    name = "LabIaC"
    description = "Infra Arch lab IaC"
    visibility = "public"
    #use a template to create a repository
    template {
        owner = "hashicorp"
        repository = "terraform-github-repository"
    }
}
#upload a readme file to the repository
resource "github_repository_file" "readme" {
    repository = github_repository.LabIaC.name
    file = "README.md"
    content = "This is a README file"
}
#Create a branch for the repository
resource "github_branch" "master" {
    repository = "LabIaC"
    branch = "master"
}
resource "github_branch" "development" {
    repository = "LabIaC"
    branch = "development"
}
#create another branch for feature branch
resource "github_branch" "feature" {
    repository = "LabIaC"
    branch = "feature"
}

#do a commit to the repository of the actual directory
resource "github_repository_file" "main" {
    repository = github_repository.LabIaC.name
    file = "main.tf"
    content = file("${path.module}/main.tf")
}