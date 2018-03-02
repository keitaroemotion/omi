#
# Try Charging Invalid Card
#
# Conclusion: For the Card of Insufficient Fund,
#             Retry > 3 causes no problem.
#
echo Create Token
omi token payment_rejected --nocopy --no-ask
$token = tokn_

echo Create a Customer
omi customer create_wc token=$token
$cust  = cust_

echo Charge a Customer
omi charge wc customer=$cust

assert status failed

#
# retry(1)
#
echo Retry(1): Charge a Customer
omi charge wc customer=$cust
assert status failed

#
# retry(2)
#
echo Retry(2): Charge a Customer
omi charge wc customer=$cust --no-ask
assert status failed

#
# retry(3)
#
echo Retry(3): Charge a Customer
omi charge wc customer=$cust --no-ask
assert status failed

#
# retry(4)
#
echo Retry(4): Charge a Customer
omi charge wc customer=$cust --no-ask
assert status failed

echo Delete a Customer
omi customer delete customer=$cust --no-ask
