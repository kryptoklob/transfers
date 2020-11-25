// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.1;
pragma experimental ABIEncoderV2;

import "../TransferDefinition.sol";

/// @title Message Transfer
/// @notice A transfer with no verification and only a message as the state.
///         Can be used to communicate with other parties without an external
///         communication provider.

contract MessageTransfer is TransferDefinition {
    struct TransferState {
        string message;
    }

    struct TransferResolver {
        string message;
    }

    string public constant override Name = "MessageTransfer";
    string
        public constant
        override StateEncoding = "tuple(string message)";
    string
        public constant
        override ResolverEncoding = "tuple(string message)";

    /* solhint-disable */
    function create(bytes calldata /*encodedBalance*/, bytes calldata /*encodedState*/)
        external
        override
        pure
        returns (bool)
    {
        return true;
    }

    function resolve(
        bytes calldata encodedBalance,
        bytes calldata /*encodedState*/,
        bytes calldata /*encodedResolver*/
    ) external override pure returns (Balance memory) {
        Balance memory balance = abi.decode(encodedBalance, (Balance));
        return balance;
    }
    /* solhint-enable */
}
