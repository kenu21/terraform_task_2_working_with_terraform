data "archive_file" "terraform_task_2_zip" {
  type        = "zip"
  source_dir  = path.module
  output_path = "${path.module}/terraform_task_2.zip"
  excludes = [
    "${path.module}/terraform_task_2.zip"
  ]
}
