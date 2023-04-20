// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  //variable definition
  
  bool isActiveReceiveConfirmation = false;
  bool isEnabledReceiveConfirmation = false;
  
  bool isActiveSendItinerary = false;
  
  bool isActiveReceiveRejection = false;
  bool isEnabledReceiveRejection = false;
  
  bool isActiveSendConfirmation = false;
  
  bool isActiveSendTravelRequest = false;
  
  bool isActiveReceiveItinerary = false;
  bool isEnabledReceiveItinerary = false;
  
  bool isActiveReceiveOffer = false;
  bool isEnabledReceiveOffer = false;
  
  bool isActiveSendRejection = false;
  
  bool isActiveReceiveRequest = false;
  bool isEnabledReceiveRequest = false;
  
  bool isActiveSendOrder = false;


  constructor(string memory _version) public {  
    version = _version;
    isActiveSendTravelRequest = true;    //协作起点置为true
  }


  function ReceiveConfirmation() public {
    if (isEnabledReceiveConfirmation) {
        emit next("", "", "ReceiveConfirmation");
    }
          isActiveSendItinerary = true;
          isActiveReceiveRejection = true;
  }

  function SendItinerary() external {
    if (isActiveSendItinerary) {
          isEnabledReceiveItinerary = true;
          ReceiveItinerary();
    }
  }

  function ReceiveRejection() public {
    if (isEnabledReceiveRejection) {
        emit next("", "", "ReceiveRejection");
    }
  }

  function SendConfirmation() external {
    if (isActiveSendConfirmation) {
          isEnabledReceiveConfirmation = true;
          ReceiveConfirmation();
    }
          isActiveReceiveItinerary = true;
          isActiveSendRejection = true;
  }

  function SendTravelRequest() external {
    if (isActiveSendTravelRequest) {
          isEnabledReceiveRequest = true;
          ReceiveRequest();
    }
          isActiveReceiveOffer = true;
  }

  function ReceiveItinerary() public {
    if (isEnabledReceiveItinerary) {
        emit next("", "", "ReceiveItinerary");
    }
  }

  function ReceiveOffer() public {
    if (isEnabledReceiveOffer) {
        emit next("", "", "ReceiveOffer");
    }
          isActiveSendRejection = true;
          isActiveSendConfirmation = true;
  }

  function SendRejection() external {
    if (isActiveSendRejection) {
          isEnabledReceiveRejection = true;
          ReceiveRejection();
    }
  }

  function ReceiveRequest() public {
    if (isEnabledReceiveRequest) {
        emit next("", "", "ReceiveRequest");
    }
          isActiveSendOrder = true;
  }

  function SendOrder() external {
    if (isActiveSendOrder) {
          isEnabledReceiveOffer = true;
          ReceiveOffer();
    }
          isActiveReceiveConfirmation = true;
          isActiveReceiveRejection = true;
  }

}
