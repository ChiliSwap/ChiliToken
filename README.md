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

- [Token Implementation](https://scrollscan.com/address/0xfc599bfc4e32757552a053d1bd9b3d35bc47124f#code)  
- [Transparent Proxy](https://scrollscan.com/address/0x4393cc09be8a87953a3db5265951d71a3e21366d#code)  
- [ProxyAdmin](https://scrollscan.com/address/0xd2f7296a079237044961ce5c94e52a2c23fa82bf#code)   

> Note: When `safe.global` is online, the owner of the `proxyAdmin`  & the admin will be transferred to a safe. 

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
