# Gas Optimization

## Goal

The goal of this exercise is to optimize contracts for minimal gas usage. This assignment contains 3 tasks in form of gas optimization examples. For each task your goal is to reduce the gas usage as much as possible

## Steps

- Optimize each contract in `src/` directory by making changes in the same file

## What each contract does?

- `Storage`
    - Stores certain variables such as `day`, `amount` and `ownerAddr`
- `ArrayIncrement`
    - Stores a state variable `counter`. Function `incrementBy` takes in an array and adds each element of this array to counter variable
- `MarginCalculator`
    - Stores a state variable `marginPercentage`. Function `getOwnerMargin` takes in an amount and returns respective amounts for owner and sender
- `Lock`
    - Determines if the contract is locked or not on the basis of value stored in `locked` variable
- `Dispenser`
    - Stores the ether received during initialisation
    - It has a waiting period of 3 days before the funds are dispensed to all three receivers

## Evaluation

-   Clone this repo. Use the flag `--recurse-submodules` to clone the repo along with the submodules. You can use the following command after replacing the `CLONE_URL` with the clone url of your repo

    ```
    git clone --recurse-submodules CLONE_URL
    ```

-   Install `forge-std` library using the below command
    ```
    forge install foundry-rs/forge-std --no-commit
    ```
    
-   Create a new branch with your name. You can use the following command

    ```
    git checkout -b my-name
    ```

-   Make changes to contracts in this directory - `src/`. The tests in `test/` directory should run successfully.

-   Run Tests
    ```
    forge test
    ```

-   Create a pull request from your branch to the main branch of original repo to run the github workflow.
