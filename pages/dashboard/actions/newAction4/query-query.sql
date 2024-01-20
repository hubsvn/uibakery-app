INSERT INTO organization_billing_info (
  organization_id, 
  developers_purchased_in_billing_period, 
  end_users_purchased_in_billing_period, 
  teams_purchased_in_billing_period, 
  billing_period_start, 
  plan_currency, 
  plan_periodity
) VALUES (
  5, 
  300000000, 
  300000000, 
  300000000, 
  '2027-12-31 22:00:00', 
  'USD', 
  'annually' -- or 'annually', use the correct ENUM value here
)
