{% set payment = get_payment_methods() %}

select
    {% for payment_method in payment %}
        sum(case when Institution = '{{payment_method}}' then COST end) as {{payment_method}}_amount,
    {% endfor %}
    sum(COST) as total_amount
from {{ ref('balance') }}