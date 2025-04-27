resource "aws_db_instance" "rds_cone" {
  identifier = "rds-hackaton-cone-instance"
  allocated_storage = "20"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro	"
  username = var.db_username
  password = var.db_password
  db_name = "hackatondb"
  skip_final_snapshot = true
  publicly_accessible = false
  storage_encrypted = true

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-rds"
      Project = "${var.project}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
    }
  )
}