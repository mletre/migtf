terraform {
  backend "gcs" {
    bucket = "tf-bakend-state-666"
    # credentials = var.TF_VAR_service_account_key
  }
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.12.0"
    }

  }
}

provider "random" {}

provider "google-beta" {
  project = var.project
  region  = var.region
}

provider "google" {
  project = var.project
  region  = var.region
}

