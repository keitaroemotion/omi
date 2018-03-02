#
# Try Charging Invalid Card
#
echo Create Token
omi token insufficient_fund --nocopy --no-ask
$token = tokn_

echo Create a Customer
omi customer create_wc token=$token
$cust  = cust_

echo Charge a Customer
omi charge wc customer=$cust

assert status failed

echo Delete a Customer
omi customer delete customer=$cust --no-ask
