// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("service-account.json")}"
  project     = "unixlistdotcom"
  region      = "${var.region}"
}
