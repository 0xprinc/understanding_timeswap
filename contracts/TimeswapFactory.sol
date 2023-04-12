// SPDX-License-Identifier: BUSL-1.1
pragma solidity =0.8.4;

import {IFactory} from './interfaces/IFactory.sol';
import {IPair} from './interfaces/IPair.sol';
import {IERC20} from '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import {TimeswapPair} from './TimeswapPair.sol';

/// @title Timeswap Factory
/// @author Timeswap Labs
/// @notice It is recommended to use Timeswap Convenience to interact with this contract.
/// @notice All error messages are coded and can be found in the documentation.
contract TimeswapFactory is IFactory {
    /* ===== MODEL ===== */

    /// @inheritdoc IFactory
    address public override owner;
    /// @inheritdoc IFactory
    address public override pendingOwner;
    /// @inheritdoc IFactory
    uint256 public immutable override fee;
    /// @inheritdoc IFactory
    uint256 public immutable override protocolFee;

    /// @inheritdoc IFactory
    mapping(IERC20 => mapping(IERC20 => IPair)) public override getPair;

    /* ===== INIT ===== */

    /// @param _owner The chosen owner address.
    /// @param _fee The chosen fee rate.
    /// @param _protocolFee The chosen protocol fee rate.
    constructor(
        address _owner,
        uint16 _fee,
        uint16 _protocolFee
    ) {
        require(_owner != address(0), 'E101');
        require(_fee != 0);
        require(_protocolFee != 0);
        owner = _owner;
        fee = _fee;
        protocolFee = _protocolFee;
    }

    /* ===== UPDATE ===== */

    /// @inheritdoc IFactory
    function createPair(IERC20 asset, IERC20 collateral) external override returns (IPair pair) {
        // checking for the required and valid conditions that are to be needed to make a new pair
        require(asset != collateral, 'E103');
        require(asset != IERC20(address(0)), 'E101');
        require(collateral != IERC20(address(0)), 'E101');
        require(getPair[asset][collateral] == IPair(address(0)), 'E104');

        
        // creating a new instance of the pair contract for two tokens 
        pair = new TimeswapPair{salt: keccak256(abi.encode(asset, collateral))}(asset, collateral, uint16(fee), uint16(protocolFee));

        // putting the pair inside the mapping that maintains all the pairs that are created using this contract 
        getPair[asset][collateral] = pair;

        // now emitting the evene tof the creation
        emit CreatePair(asset, collateral, pair);
    }

    /// @inheritdoc IFactory
    function setPendingOwner(address _pendingOwner) external override {
        // required conditions of a new owner of the factory contract
        require(msg.sender == owner, 'E102');
        require(_pendingOwner != address(0), 'E101');

        // setting the pending owner into the state variable specially made for it 
        pendingOwner = _pendingOwner;

        emit SetOwner(_pendingOwner);
    }

    /// @inheritdoc IFactory
    function acceptOwner() external override {
        require(msg.sender == pendingOwner, 'E102');

        // setting the new owner if the pending owner calls this function and calls it hence accepting the owner request
        owner = msg.sender;
        pendingOwner = address(0);

        emit AcceptOwner(msg.sender);
    }
}
