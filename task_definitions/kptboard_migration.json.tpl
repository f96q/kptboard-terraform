[
  {
    "image": "${account_id}.dkr.ecr.${aws_region}.amazonaws.com/${kptboard}",
    "name": "${kptboard}-migration",
    "memory": 256,
    "essential": true,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${kptboard}",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "${kptboard}-migration"
      }
    },
    "command": ["bundle", "exec", "rake", "db:migrate"],    
    "environment": [
      {
        "name": "AWS_DEFAULT_REGION",
        "value": "${aws_region}"
      },
      {
        "name": "PARAMETER_STORE_PREFIX",
        "value": "${kptboard}"
      }
    ]
  }
]