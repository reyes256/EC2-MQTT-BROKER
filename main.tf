module "ec2_broker" {
  source = "./broker_module"

  instance_name = "MQTT-Broker"
  key_name = "secret_key"
}