// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.8.4;

import {IPair} from '../interfaces/IPair.sol';

library Array {
    
    /// @notice appends the due in the dues list whenever someone borrows or mints 
    /// @return id returns the index of the appended due in the list
    function insert(IPair.Due[] storage dues, IPair.Due memory dueOut) internal returns (uint256 id) {
        id = dues.length;   
        
        dues.push(dueOut);
        
    }
}