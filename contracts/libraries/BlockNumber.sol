// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.8.4;

library BlockNumber {

    /// @notice gives the latest block number 
    /// @return blocknumber returns latest blockknumber 
    function get() internal view returns (uint32 blockNumber) {
        // can overflow
        blockNumber = uint32(block.number);
    }
}