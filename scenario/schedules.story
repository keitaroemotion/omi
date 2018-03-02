#
# Create a Token
#
echo Create Token
omi token insufficient_fund --nocopy --no-ask
$token = tokn_

#
# Create a Customer
#
echo Create a Customer
omi customer create_wc token=$token --no-ask
$cust = cust_

#
# Daily
#
echo make daily schedule, per 2 days, amount 100
omi schedule create_daily amount=100 every=2 customer=$cust

$schd = schd_

echo get the content of the schedule --no-ask
omi schedule get schedule=$schd

#
# Weekly
#
echo make weekly schedule, each monday and friday, amount 100
omi schedule create_weekly amount=100 customer=$cust

#
# Monthly
#
echo make monthly schedule, each 25th, amount 200
omi schedule create_monthly day=25 amount=200 customer=$cust

#
# Zig-Zag
#
echo make zig-zag schedule [/1, /10, /15], amount=200
omi schedule create_zig_zag amount=200 customer=$cust

echo Delete a Customer
omi customer delete customer=$cust --no-ask
