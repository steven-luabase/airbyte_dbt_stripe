select
    id as invoice_id,
    to_timestamp_ntz(created::int, 0) as created_at,
    number as invoice_number,
    description,
    paid,
    total,
    subtotal,
    tax,
    amount_due,
    amount_paid,
    amount_remaining,
    to_timestamp_ntz(due_date::int, 0) as due_date,
    attempt_count,
    charge as charge_id,
    status,
    customer as customer_id
from {{ var('invoices') }}