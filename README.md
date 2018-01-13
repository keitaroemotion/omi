# Omise Turorial

This repository is the tutorial how to use Omise.js | Omise APIs using examples.

## collecting_cards.html

This file is the real example to demonstrate how to embed Omise.js to collect cards of your customers.

## api_caller

api_caller does call Omise Api. Initially you need to go to [Omise Dashboard](https://dashboard.omise.co/test/keys) and copy its private key starts from `skey_`

then touch the file name `config` and edit as follows:

```
skey=[your skey on Omise Dashboard]
```

after that, please do the following:

```
$./api_caller scripts/[api_to_call]
```


## TODOs

let api_caller to be installer to the system and be accessible from anywhere (not that hard)
