# Omi

This repository is the easy demo tool of Omise API and tutorial how to use Omise.js

## Instruction

Please do the following:
```
$ bundle install
```

## collecting_cards.html

This file is the real example to demonstrate how to embed Omise.js to collect cards of your customers.

## omi

omi does call Omise Api. Initially you need to go to [Omise Dashboard](https://dashboard.omise.co/test/keys) and copy its public | private key starts from `pkey_` `skey_`

## installation

```
$ ./installer
```

## usage

Grammar is basically as follows:

```
$ omi [api] [action]
```

### Token API (Testing Purpose Only)
This API is testing purpose only. 
For the production-level card addition, you need
to use **Omise.js**

#### create token

```
$ omi token create
```

This command copis the result token such as

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

#### get token

```
$ omi token get token=[token]
```

### Card API

#### enlist cards
```
$ omi card list customer=[customer_id]
```

will automatically allow you to list the cards related to the customer_id.

Also,

```
$ omi card list
```

brings you to the interactive mode, since the customer has not been specified.
it does ask you to choose customers you created, if you have.


XXX this part, coming soon


then touch the file name `config` and edit as follows:

```
skey=[your secret key on Omise Dashboard]
pkey=[your public key on Omise Dashboard]
```

after that, please do the following:

```
$./omi scripts/[api]/[api_to_call]
```

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
