//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.0 <0.9.0;

contract PastryCook {
    bool private activeAssignLayers = false;
    bool private activeSendDecoratedLayer1 = false;
    bool private activeSendDecoratedLayer2 = false;
    bool private activeSendDecorationsRequest = false;
    bool private activeAssignDecorations = false;
    bool private activeSendCake = false;

    string public version;
    constructor(string memory _version) public {  
        version = _version;
    }

    event next(bytes from, bytes to, bytes activity);//消息广播

    function SendCakeRequest() public {
        activeAssignLayers = true;
        activeSendDecorationsRequest = true;
        emit next("", "", "CakePreparation");
    }

    function AssignLayers() public {
        if (activeAssignLayers) {
            activeSendDecoratedLayer1 = true;
            emit next("", "", "LayerPreparation");
        }
    }

    function SendDecorationsRequest() public {
        if (activeSendDecorationsRequest) {
            activeAssignDecorations = true;
            emit next("", "", "ReceiveDecorations");
        }
    }

    function AssignDecoration() public {
        if (activeAssignDecorations) {
            activeSendDecoratedLayer2 = true;
            emit next("", "", "ReceiveDecoration");
        }
    }
    
    function SendCake() public {
        if (activeSendCake) {
            emit next("", "", "ReceiveCake");
        }
    }

    function SendDecoratedLayer() public {
        if (activeSendDecoratedLayer1 && activeSendDecoratedLayer2) {
            activeSendCake = true;
            emit next("", "", "ReceiveAndCombineLayer");
        }
    }
}