echo make daily schedule, per 2 days, amount 100
omi schedule create_daily amount=100 every=2

$schd = schd_

echo get the content of the schedule
omi schedule get schedule=$schd

echo make weekly schedule, each monday and friday, amount 100
omi schedule create_weekly amount=100
