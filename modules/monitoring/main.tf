resource "aws_cloudwatch_log_group" "aws_cloudwatch" {
  name = "/${var.project}/${var.environment}/${var.name}"

  retention_in_days = 30

  tags = merge(
    var.tags,
    {
      Name = "${var.name}"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "hackaton-${var.project}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarma si CPU EC2 > 80%"
  dimensions = {
    InstanceId = var.ec2_instance_id
  }
}
