output "response" {
  value = {
    "this"                     = local.response
    "internal-module-response" = module.example_internal_module.response
    "external-module-response" = module.example_external_module.response
  }
  description = "Sub-module responses"
}
