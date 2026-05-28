resource "aws_budgets_budget" "cost_budget" {
  name              = "Rewards-Budget"
  limit_amount      = 1.0
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  budget_type       = "COST"

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 80
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"
    subscriber_email_addresses = [var.email]
  }
}
