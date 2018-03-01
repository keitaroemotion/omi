# Omi

omi does call Omise Api. It enables you stay away from bunch of curl commands since
this script builds everything for you automatically. In short, omi makes your Omise
API Calling Process easy.


## Instruction

Please do the following:
```
$ bundle install
```

## setup

To install,
```
$ ./installer
```

Initially you need to go to [Omise Dashboard](https://dashboard.omise.co/test/keys) and copy its public | private key starts from `pkey_` `skey_`

```
$ mkdir /usr/local/etc/omi/
$ vim /usr/local/etc/omi/config
```

then touch the file name `config` and edit as follows:

```
skey=[your secret key on Omise Dashboard]
pkey=[your public key on Omise Dashboard]
```

## usage

Grammar is basically as follows:

```
$ omi [api] [action]
```

### [Token API (Testing Purpose Only)](https://www.omise.co/tokens-api)
This API is testing purpose only. 
For the production-level card addition, you need
to use **Omise.js**

#### create token

```
$ omi token create
```

This command copies the result token such as

```
token=[token_id]
```

to the clipboard.

if you want to edit the request parameters,
(for instance, by default, it sets the test card,
 you may want to test arbiterary card)

just add -e parameter such as:

```
$ omi token create -e
```

Usually, the response of the API call is by default console output.
You can change this to vim editor mode such as:

```
$ omi token create -v
```

#### get token info

```
$ omi token get token=[token]
```

### [Customer API](https://www.omise.co/customers-api)
#### create customer
```
$ omi customer create
```

#### create customer with specific card
```
$ omi customer create_wc token=[token_id]
```

#### attach a card to customer
```
$ omi customer add_card token=[token_id]
```

#### list customers
```
$ omi customer list
```

or 

```
$ omi customers
```

#### get customer
```
$ omi customer get
```

#### update customer
```
$ omi customer update
```

#### destory customer
```
$ omi customer delete
```

### [Card API](https://www.omise.co/cards-api)

#### enlist cards
```
$ omi card list customer=[customer_id]
```

or

```
$ omi cards customer=[customer_id]
```


will automatically allow you to list the cards related to the customer_id.

Also,

```
$ omi card list
```

brings you to the interactive mode, since the customer has not been specified.
it does ask you to choose customers you created, if you have.

if you want to look only for the cards of specific customer, then:
```
$ omi card list customer=[customer_id] | grep "card_"
```

then, if you want detailed information of the card,

```
$ omi card get
```

with this, interactive mode guids you through finding the data of 
cards belonging to specific customer.

if you want to update the card,
```
$ omi card update
```

if you want to delete the card,
```
$ omi card delete
```

### [Charge API](https://www.omise.co/charges-api)
#### enlist charges
```
$ omi charge list
```

or

```
$ omi charges
```


et cetra. The others are in the help menu.


## Local Host Execution (Only for Omise Developers)

For Omise Developers, the option "-l" helps to access to its local instance (localhost)

Example:
```
$ omi charges -l [your skey|pkey of localhost]
```

or, simply you can call like this:

Example:
```
$ omil charges [your skey|pkey of localhost]
```

## passing arbiterary (pkey|skey) as argument

For instace, if you want use the specific skey instead of default one,
```
$ omi charges skey_... 
```

Or if pkey,
```
$ omi charges pkey_... 
```

Or both,
```
$ omi charges pkey_... skey_...
```

## Count function

when you add `count` as argument, it is going to
yield the size of the result record.

```
$ omi charges count
```

## Rich output option

```
$ omi charges --rich
```
this converts the raw JSON output into more syntax highlighted compact output

## Authentication Failure
When you get authentication failure from API, it means your command missing key parameter.

```
-s [skey]
```

so just please add it to the last of the command.

## Scenario execution DSL

You can define the DSL scenario to preserve the combined execution of
omi script. It also preserves the response object such as:

```
###############################################################
# Daily                                                       #
###############################################################
echo make daily schedule, per 2 days, amount 100
omi schedule create_daily amount=100 every=2

$schd = schd_

echo get the content of the schedule
omi schedule get schedule=$schd
```

The line starts from `#` is the commented out area.
Also, the blank line is going to be dismissed by the interpreter.

`echo ` simply outputs the argument strings into the console.
`omi ....` does execute the omi shell command.
`$schd = schd_` is the `[variable_name] = regex_prefix`. In this case, we want to extract the
`schd_...` from result object and assign it to the `$schd` variable.

## collecting_cards.html

This file is the real example to demonstrate how to embed Omise.js to collect cards of your customers.

## preparing the test environment

1. execute the following script and obey the instructions

```
$ ./test_env/prepare
```
2. after 1. has been started, execute the following:

```
$ ./test_env/launch
```

3. then you have to go to (https://dashboard.omise.co/test/webhooks) and edit the endpoint such as:

```
https://[random hash].ngrok.io/omise/webhook
```

4. after that, you are going to execute whatever API command as you like.


## Special Thanks
Thanks to Mr. Akira Narita, it is possible to test the Omise Webhook API with his [omise-webhook](http://akinrt.hatenablog.com/entry/omise-webhook) module. If you quickly want to test Omise-Webhook API without launching SSL/TLS certificate enhancing https website, his repository helps you.
