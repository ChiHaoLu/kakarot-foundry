// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {SignatureVerifier} from "../src/SignatureVerifier.sol";

contract SignaturVerifierTest is Test {
    SignatureVerifier public signatureVerifier;
    address signer;
    uint256 signerKey;

    function setUp() public {
        signatureVerifier = new SignatureVerifier();
        (signer, signerKey) = makeAddrAndKey("signer");
    }

    function testVerify() public view {
        string memory message = "Meow";
        bytes32 messageHash = signatureVerifier.getMessageHash(message);
        bytes32 ethMessageHash = signatureVerifier.getEthSignedMessageHash(messageHash);
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(signerKey, ethMessageHash);
        bytes memory signature = abi.encodePacked(r, s, v);
        assertEq(signature.length, 65);
        assertEq(signatureVerifier.verify(signer, message, signature), true);
    }
}
