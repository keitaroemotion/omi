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
let api_caller do as follows:
  a ${call_another_api_and_return_the_result_params} variable embedded in the caller script file
  does squentially execute the request such that no need to execute the pre-state stuff.
  or, make new flow to combine apis and bind those, kind of Turing-Incomplete style.
