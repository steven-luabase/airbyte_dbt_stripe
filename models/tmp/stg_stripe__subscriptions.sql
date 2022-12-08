select
    id as subscription_id,
    customer as customer_id,
    status,
    to_timestamp_ntz("start"::int, 0)  as start_date,
    to_timestamp_ntz(ended_at::int, 0)  as ended_at,
    billing as subscription_billing,
    to_timestamp_ntz(billing_cycle_anchor::int, 0) as billing_cycle_anchor,
    to_timestamp_ntz(canceled_at::int, 0) as canceled_at,
    to_timestamp_ntz(created::int, 0) as created_at,
    to_timestamp_ntz(current_period_start::int, 0) as current_period_start,
    to_timestamp_ntz(current_period_end::int, 0) as current_period_end,
    to_timestamp_ntz(trial_start::int, 0) as trial_start,
    to_timestamp_ntz(trial_end::int, 0) as trial_end,
    days_until_due,
    cancel_at_period_end as is_cancel_at_period_end
from {{ var('subscriptions') }}