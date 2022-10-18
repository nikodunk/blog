---
layout: post
title: "How-to: Blockchain experiments: Software that cannot die"
date: 2017-12-19 08:00:00 -0700
tags: ["How-To"]
image: /blockchain/monet-dieppe-1024-768.jpg
---

## A note on technical legacy

What is lasting in the tech world? Architects build things that stay forever. Technologists build things that a week later doesn't work because npm install's libraries have changed. I read once that the average lifespan of a webpage on the internet is 8 months. The oldest software companies are Apple and Microsoft.
Legacy in software is bad. It is a dirty word.

Blockchain, because it is shared by all, may be a solution to this issue of splitting useful (but ephemeral) "built" software projects from capitalistic cycles, and allow them to be guaranteed to be run forever, as everyone is running them. On that note, this is how to run a minimal local blockchain to test code on your local computer, which could then be deployed to the distributed test-net or main-net and be run forever.

![](/assets/blockchain/monet-dieppe-1024-768.jpg)

Smart contracts replace backend code in a true Dapp. Blockchains replace the server. They're basically a glorified distributed database that anyone can run programs on and everyone helps run – a mix between AWS and Bittorrent. We'll be using classic React front-end code to interact with it eventually (which I'd still recommend hosting on a server – but could be served from IPFS or such too), but for now we'll just interface with the smart contract through the terminal.

## NOTE: See other experiments [here](https://nikodunk.github.io/learnings).

![](/assets/blockchain/ethereum.png)

## How to run a minimal local blockchain

Install the truffle toolbox, which is a Ethereum-approved framework for making Ethereum/blockchain development easier. The code I'm using here is from a simple CRUD Dapp I built [here](https://github.com/nikodunk/contactstorage).

Open terminal and get a local blockchain up. This'll give you 10 test accounts with 10 fake ether on each. You'll see both private and public keys of all 10 accounts if the command works.

    ganache-cli

Open a new tab in terminal, then open the Truffle console into this test blockchain:

    truffle console

Compile your contract in the Truffle Console as below. Delete your build folder if re-compiling – sometimes it doesn't like overwriting your contract.

    compile

Migrate your contract in the Truffle Console with

    migrate	--reset

Test the contract from the Truffle Console by ADDING A CONTACT:
contactStorage.deployed().then(instance => instance.addContacts('George Jetson'))

Test the contract from the Truffle Console by GETTING YOUR CONTACTS:
contactStorage.deployed().then(instance => instance.getContacts())

Or, open a new terminal tab (or close the Truffle Console with Ctrl + C) and run the React frontend:

    npm start

## How to run on a real blockchain

We'll be using a real remote blockchain in this second example, and interact with our smart contract through a simple React frontend. We'll be using the "testnet" (test blockchain) called Rinkeby here. This is an actual distributed blockchain running on computers all over the world, but Rinkeby doesn't use 'real' Ether so you won't be spending actual Ether while you're testing your smart contract. We'll then run a local React interface to interact with our deployed smart contract. In early 2018, I think Rinkeby is the best testnet.

Sync with the testnet blockchain by opening terminal and running:

    geth --rinkeby --rpc --rpcapi db,eth,net,web3,personal

in new tab, compile and deploy contract
truffle console --network rinkeby

if you don't have an account:

    x = web3.personal.newAccount('pw')
    web3.eth.getBalance("yourAcctNumber")
    web3.eth.accounts

Otherwise, unlock your account:

    web3.personal.unlockAccount("0x2df219a1ae3845ab32a041499db27d4bfdb43876", 'password', 15000)

    web3.personal.unlockAccount("0x43928ec2bb4ea1eb6a77a5fd9caf36ca7b15600f", 'pw', 15000)

Compile and migrate as described in the local version:

    compile

    migrate --reset --network rinkeby

Test the contract from the Truffle Console by ADDING A CONTACT:
contactStorage.deployed().then(instance => instance.addContacts('George Jetson'))

Test the contract from the Truffle Console by GETTING YOUR CONTACTS:
contactStorage.deployed().then(instance => instance.getContacts())

Close Ganache, Truffle Console as the contract's now live in Rinkeby!

Serve your React frontend by opening a new terminal and running
npm start

to deploy to github pages:

change homepage to reflect your github page:

    "homepage": "http://nikodunk.github.io/contactStorage",

Then run

    npm run build

And copy files to root directory

That's it! You now know how to run a deploy a smart contract to a blockchain and interact with it through a React frontend.

---
