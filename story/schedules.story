#
# Daily
#
echo make daily schedule, per 2 days, amount 100
omi schedule create_daily amount=100 every=2

$schd = schd_

echo get the content of the schedule
omi schedule get schedule=$schd

#
# Weekly
#
echo make weekly schedule, each monday and friday, amount 100
omi schedule create_weekly amount=100

$schd = schd_

echo get the content of the schedule
omi schedule get schedule=$schd

#
# Monthly
#
echo make monthly schedule, each 25th, amount 200
omi schedule create_monthly day=25 amount=200

$schd = schd_

echo get the content of the schedule
omi schedule get schedule=$schd

#
# Zig-Zag
#
echo make zig-zag schedule [/1, /10, /15], amount=200
omi schedule create_zig_zag amount=200

$schd = schd_

echo get the content of the schedule
omi schedule get schedule=$schd
