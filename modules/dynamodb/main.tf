resource "aws_dynamodb_table" "dynamondb_table" {
  name = "ddb-hackaton-${var.project}-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "ID"

  attribute {
    name = "ID"
    type = "S"
  }
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