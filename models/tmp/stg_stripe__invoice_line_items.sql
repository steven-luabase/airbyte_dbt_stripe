with invoice_line_items_period as (
    select
        _airbyte_invoice_line_items_hashid,
        to_timestamp_ntz("start", 0) as period_start,
        to_timestamp_ntz(END, 0) as period_end
    from {{ var('invoice_line_items_period') }}
),

invoice_line_items_plan as (
    select
        _airbyte_invoice_line_items_hashid,
        id as plan_id
    from {{ var('invoice_line_items_plan') }}
)

select
    id as invoice_line_item_id,
    invoice_id,
    subscription as subscription_id,
    plan_id,
    description as line_item_description,
    amount as line_item_amount,
    quantity as line_item_quantity,
    period_start,
    period_end
from {{ var('invoice_line_items') }}
left join invoice_line_items_period
    using(_airbyte_invoice_line_items_hashid)
left join invoice_line_items_plan
    using(_airbyte_invoice_line_items_hashid)