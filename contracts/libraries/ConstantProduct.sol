// SPDX-License-Identifier: BUSL-1.1
pragma solidity =0.8.4;

import {IPair} from '../interfaces/IPair.sol';
import {FullMath} from './FullMath.sol';

library ConstantProduct {
    using FullMath for uint256;


    /// @notice checks whether the constant product is followed 
    /// @param state @inheritdoc IPair
    /// @param xReserve state.x - xDecrease
    /// @param yAdjusted value of y after adjustment through the formula
    /// @param zAdjusted value of z after adjustment through the formula
    function checkConstantProduct(
        IPair.State memory state,
        uint112 xReserve,
        uint128 yAdjusted,
        uint128 zAdjusted
    ) internal pure {

        // we are using mul512(prod0 and prod2) since there is not the accurate value of y and z but
        // there is a very little truncation which is done by solidity itself, so we are using the bounds  
        // on the values of the product(invariant)
        (uint256 prod0, uint256 prod1) = (uint256(yAdjusted) * zAdjusted).mul512(xReserve);
        (uint256 _prod0, uint256 _prod1) = ((uint256(state.y) * state.z)).mul512(state.x);

        require(prod1 >= _prod1, 'E301');
        if (prod1 == _prod1) require(prod0 >= _prod0, 'E301');
    }
}
