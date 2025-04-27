resource "aws_cloudwatch_event_bus" "aws_cw_bus" {
  name = "hackaton-${var.project}-event-bus"

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-event-bus"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}
