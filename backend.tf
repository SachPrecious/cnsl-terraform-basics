terraform {
  backend "s3" {
    bucket       = "test-bk-456" // replace with the bucket name
    key          = "sachithram/terraform/state/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    profile      = "sachithram_personal" //replace with your aws profile
  }
}