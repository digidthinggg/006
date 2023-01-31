// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Layer.sol";

contract Wallet {
  using Layer for Layer.LayerAPI;


  /*
  struct TmpRequirement {
    AmountMinMax amount;
    string[] tokensArr;
    Layer.LayerAPI[] layerFlow;
  }
  */


  struct AmountMinMax {
    uint256 min;
    uint256 max;
  }

  struct Requirement {
    AmountMinMax amount;

    uint numTokens;
    mapping (uint => string) tokens;
  }


  struct WithdrawalLayers {
    uint numRequirements;
    mapping (uint => Requirement) requirements;
  }

  struct Withdrawal {
    WithdrawalLayers layers;

    bool executed;
  }

  uint numWithdrawals;
  mapping (uint => Withdrawal) withdrawalQueue;


  struct TransferLayers {
    uint numRequirements;
    mapping (uint => Requirement) requirements;
  }

  // TODO start here
  uint numTransferLayers;

  TransferLayers transferLayers = TransferLayers();

  struct Transfer {
    uint256 transferNum;
    address receiver;
    uint256 amount;

    TransferLayers layers;

    bool executed;
  }

  // Pending transfers.
  uint numTransfers;
  mapping (uint => Transfer) transferQueue;


  event HandleLayerStartedEV();
  event HandleLayerSuccessEV();
  event HandleLayerFailureEV();


  function test() public virtual {
    testSetTransferRequirements();

    // instead of map of requirements inside transfer
    // struct Layers with map of requirements
    // because requirements are the same for each action

    // So
    // TransferLayers containing Requirements for Transfer
    // WithdrawLayers containing Requirements for Withdraw
    // etc
  }

  // Test with 2 layer requirements.
  function testSetTransferRequirements() private {
    Requirement storage requirementA = transferLayers.requirements[transferLayers.numRequirements];

    AmountMinMax memory amountA = AmountMinMax({
      min: 0,
      max: 100
    });

    requirementA.amount = amountA;

    requirementA.tokens[requirementA.numTokens] = "ETH";
    requirementA.numTokens++;

    requirementA.tokens[requirementA.numTokens] = "USDC";
    requirementA.numTokens++;


    transferLayers.numRequirements++;


    Requirement storage requirementB = transferLayers.requirements[transferLayers.numRequirements];

    AmountMinMax memory amountB = AmountMinMax({
      min: 100,
      max: 200
    });

    requirementB.amount = amountB;

    requirementB.tokens[requirementB.numTokens] = "USDT";
    requirementB.numTokens++;

    requirementB.tokens[requirementB.numTokens] = "SHIB";
    requirementB.numTokens++;
  }


  function deltest() public virtual {
    AmountMinMax memory amount = AmountMinMax({
      min: 0,
      max: 100
    });

    //Transfer storage transfer = transferQueue[numTransfers];

    //transfer.transferNum = 1111;
    //transfer.receiver = address(0xdafea492d9c6733ae3d56b7ed1adb60692c98bc5);

    //Requirement storage requirement = transfer.requirements[transfer.numRequirements];
  }


  // Make 1 requirement and log it.
  event LogRequirementAmountEV(uint256 min, uint256 max);
  function oldoldoldtest() public virtual {
    /*
    AmountMinMax memory amountMinMax = AmountMinMax({
      min: 0,
      max: 100
    });
    */

    //bytes32[] memory tokensArr = [ "ETH", "USDC" ];

    //string[2] memory tokensArr = [ "ETH", "USDC" ];

  }

  // AmountMinMax always retains same structure
  // tokens is dynamic and the struct field needs to be returned from build function
  // and needs to be inserted into Requirement dynamically


  function tmptest() public virtual {
    // change from
    // [
    // [ ..., ..., ... ],
    // [ ... ],
    // [ ..., ..., ... ]
    //
    // to
    // [ ..., ..., ..., X, ..., X, ..., ..., ... ]

    Layer.LayerAPI[] memory arr = new Layer.LayerAPI[](8);

    Layer.LayerAPI memory seq0Num0;
    arr[0] = seq0Num0;

    Layer.LayerAPI memory seq0Num1;
    arr[1] = seq0Num1;

    Layer.LayerAPI memory seq0Num2;
    arr[2] = seq0Num2;

    Layer.LayerAPI memory seqSep0;
    seqSep0.isSeqSep = true;
    arr[3] = seqSep0;

    Layer.LayerAPI memory seq1Num0;
    arr[4] = seq1Num0;

    Layer.LayerAPI memory seqSep1;
    seqSep1.isSeqSep = true;
    arr[5] = seqSep1;

    Layer.LayerAPI memory seq2Num0;
    arr[6] = seq2Num0;
    Layer.LayerAPI memory seq2Num1;
    arr[7] = seq2Num1;
  }


  function oldoldtest() public virtual {
    Layer.LayerAPI[] memory arr = new Layer.LayerAPI[](3);

    Layer.LayerAPI memory l0;
    Layer.LayerAPI memory l1;
    Layer.LayerAPI memory l2;

    arr[0] = l0;





  }


  function createLayer() private {
  }

  function addLayer() private {
  }


  function oldtest() public virtual {

    // start by creating a 1d array of the LayerAPI struct to test
    //Layer.LayerAPI[] memory arr;

    //Layer.LayerAPI memory l0;
    //Layer.LayerAPI memory l1;

    //arr.push(l0);
    //arr.push(l1);
    
    //emit LogLength(arr.length);

    // then 2d arr to test

    // needs to be dynamic
    // push,pop,shift in alibrary or smth
  }

  function testInitTransferRequirements() private {
    //
  }

  // temp.
  function buildLayer(
  ) internal virtual returns (Layer.LayerAPI memory) {
    Layer.LayerAPI memory layer;
    layer.init();
    // Log to check how it's returned.
  }

  function handleLayerStarted() external {
    emit HandleLayerStartedEV();
  }

  function handleLayerSuccess() external {
    // dispatchNext
    emit HandleLayerSuccessEV();
  }

  function handleLayerFailure() external {
    emit HandleLayerFailureEV();
  }

  function executeTransfer() private {
    //
  }
}
