//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.0 <0.9.0;

contract BookTravel {

    bool private activeSendOffer = false;
    bool private activeSendConfirmation = false;
    bool private activeSendItinerary = false;
    bool private activeSendRejection = false;

    string public version;
    constructor(string memory _version) public {  
        version = _version;
    }

    event next(bytes from, bytes to, bytes activity);//消息广播

    function SendTravelRequest() public {
        activeSendOffer = true;
        emit next("", "", "ReceiveRequest");
    }

    function SendOrder() public {
        if (activeSendOffer) {
            activeSendConfirmation = true;
            activeSendRejection = true;
            emit next("", "", "ReceiveOffer");
        }
    }

    function SendConfirmation() public {
        if (activeSendConfirmation) {
            activeSendItinerary = true;
            emit next("", "", "ReceiveConfirmation");
        }
    }

    function SendItinerary() public {
        if (activeSendItinerary) {
            activeSendConfirmation = true;
            emit next("", "", "ReceiveItinerary");
        }
    }

    function SendRejection() public {
        if (activeSendRejection) {
            emit next("", "", "ReceiveRejection");
        }
    }
}

