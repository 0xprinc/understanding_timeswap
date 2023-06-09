## What is TimeSwap V1
Timeswap is a 3 variable AMM-based lending and borrowing protocol which is self-sufficient, gas efficient and works without the need of oracles or liquidators. As of **19th April**, the TVL on **TimeSwap** is __$891,291__ which includes the value locked due to __V1__ and __V2__(new and improved).

AMM invariant model:
```
X × Y × Z = K

X = Principal Pool
​
Y = Interest Rate Pool
​
Z = Collateral Factor Pool 
​
K = Invariance Constant Product
```

> For In-Depth info. about **TimeSwap Protocol V1**, you can visit their [documentation](https://timeswap.gitbook.io/timeswap/) and also read their 
[WhitePaper](https://535034581-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MIPZkDBEvwedF77USHq%2Fuploads%2FbLje2gEs6r7PrZPUoLk5%2Fwhitepaper.pdf?alt=media&token=9694e405-88a5-4fc2-a409-2b2b527413c5)


<br>

## What's different in My Repo
This Repo is a fork of the [TimeSwap-V1-Core](https://github.com/Timeswap-Labs/Timeswap-V1-Core), which is the primary repo of TimeSwap Protocol in which I have done some analysis of the entire codebase of that repo. <br> 
I have written intensive comments on how is the logic and the mathematics given in their whitepaper implemented. What does each code snippet in the contract mean and why it is there.


## Some impressive ideas and implementations I found in TimeSwap
+ Using an `error.md` file to list all the possible errors and using codes related to those errors in all the contracts.
+ Using the idea of AMM invariant method to get interest rate and the collateral factor values.
+ Using numbers instead of actual tokens for applying the tokenisation of lending and liquidity providing. 


## TO-DO List

- [X] Reading the documentation and Whitepaper of TimeSwap-V1.
- [x] Reading and understanding all the contracts.
- [X] Understanding each and every part of all the contracts.
- [X] Writing intensive comments on the all the parts of the repo.
- [X] Understanding the tests.
- [ ] Writing my own tests using Foundry.
