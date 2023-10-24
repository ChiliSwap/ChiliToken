## ChiliSwap Token Contract

- [ChiliSwap Token Contract](#chiliswap-token-contract)
- [Deployed Addresses](#deployed-addresses)
  - [Scroll Mainnet](#scroll-mainnet)
- [Development](#development)
  - [Build](#build)
  - [Test](#test)
  - [Format](#format)
  - [Gas Snapshots](#gas-snapshots)
  - [Anvil](#anvil)
  - [Deploy](#deploy)

## Deployed Addresses 

### Scroll Mainnet 


- [0x7404405380770248ede07945ec0dc3ddc0516a5c](https://scrollscan.com/address/0x7404405380770248ede07945ec0dc3ddc0516a5c#code) 

## Development

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Deploy.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```
