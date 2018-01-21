# Omise Sugoi

This repository is the easy demo tool of Omise API and tutorial how to use Omise.js

## Instruction

Please do the following:
```
$ bundle install
```

## collecting_cards.html

This file is the real example to demonstrate how to embed Omise.js to collect cards of your customers.

## api_caller

api_caller does call Omise Api. Initially you need to go to [Omise Dashboard](https://dashboard.omise.co/test/keys) and copy its public | private key starts from `pkey_` `skey_`

then touch the file name `config` and edit as follows:

```
skey=[your secret key on Omise Dashboard]
pkey=[your public key on Omise Dashboard]
```

after that, please do the following:

```
$./api_caller scripts/[api]/[api_to_call]
```

## Special Thanks
Thanks to Mr. Akira Narita, it is possible to test the Omise Webhook API with his [omise-webhook](http://akinrt.hatenablog.com/entry/omise-webhook) module. If you quickly want to test Omise-Webhook API without launching SSL/TLS certificate enhancing https website, his repository helps you.
