#
# Try Charging Invalid Card
#
echo Create Token
omi token create --nocopy --no-ask
$token = tokn_

echo Create a Customer
omi customer create_wc token=$token
$cust  = cust_

echo Delete a Customer
omi customer delete customer=$cust --no-ask
