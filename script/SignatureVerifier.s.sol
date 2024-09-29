// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {SignatureVerifier} from "../src/SignatureVerifier.sol";

contract SignatureVerifierScript is Script {
    SignatureVerifier public signatureVerifier;
    address deployer = vm.rememberKey(vm.envUint("PRIVATE_KEY"));

    function setUp() public {}

    function run() public {
        vm.startBroadcast(deployer);

        signatureVerifier = new SignatureVerifier();

        vm.stopBroadcast();
    }
}
