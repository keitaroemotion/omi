######################################################################
# Create a Recipient                                                 #
######################################################################
omi recipient create
$recp = recp_

######################################################################
# Daily                                                              #
######################################################################
echo make daily transfer schedule, per 2 days, amount 260
omi trsch create_daily amount=260 every=2 recipient=$recp

$schd = schd_

echo get the content of the transfer schedule
omi trsch get schedule=$schd

######################################################################
# Create a Recipient                                                 #
######################################################################
omi recipient create
$recp = recp_

######################################################################
# Weekly                                                             #
######################################################################
echo make weekly transfer schedule, each monday and friday, amount 260
omi trsch create_weekly amount=260 every=1 recipient=$recp %=50

######################################################################
# Create a Recipient                                                 #
######################################################################
omi recipient create
$recp = recp_

######################################################################
# Monthly                                                            #
######################################################################
echo make monthly transfer schedule, each 25th, amount 200
omi trsch create_monthly day=25 amount=200 recipient=$recp

######################################################################
# Create a Recipient                                                 #
######################################################################
omi recipient create
$recp = recp_

#####################################################################
# Zig-Zag                                                           #
#####################################################################
echo make zig-zag transfer schedule [/1, /10, /15], amount=200
omi trsch create_zig_zag amount=200 recipient=$recp every=3


#####################################################################
# [ITERATION]                                                       #
#####################################################################
omi recipients
{$recp} = recp_
$recp: omi recipient delete recipient=$
