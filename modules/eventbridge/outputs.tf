output "event_bus_name" {
  description = "Nombre del EventBridge bus."
  value       = aws_cloudwatch_event_bus.aws_cw_bus
}