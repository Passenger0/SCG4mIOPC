// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract ServiceRegistry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  //variable definition
  
  bool isActiveSendFeedback = false;
  
  bool isActiveNotifactionReceived = false;
  bool isEnabledNotifactionReceived = false;
  
  bool isActiveAssignPaper = false;
  
  bool isActiveReceiveReviews = false;
  bool isEnabledReceiveReviews = false;
  
  bool isActiveReceiveReviewRequest = false;
  bool isEnabledReceiveReviewRequest = false;
  
  bool isActiveSubmitReview = false;
  
  bool isActiveSendResult = false;
  
  bool isActiveFeedbackReceived = false;
  bool isEnabledFeedbackReceived = false;


  constructor(string memory _version) public {  
    version = _version;
    isActiveAssignPaper = true;    //协作起点置为true
  }


  function SendFeedback() external {
    if (isActiveSendFeedback) {
          isEnabledFeedbackReceived = true;
          FeedbackReceived();
    }
  }

  function NotifactionReceived() public {
    if (isEnabledNotifactionReceived) {
        emit next("", "", "NotifactionReceived");
    }
  }

  function AssignPaper() external {
    if (isActiveAssignPaper) {
          isEnabledReceiveReviewRequest = true;
          ReceiveReviewRequest();
    }
          isActiveReceiveReviews = true;
  }

  function ReceiveReviews() public {
    if (isEnabledReceiveReviews) {
        emit next("", "", "ReceiveReviews");
    }
          isActiveSendFeedback = true;
          isActiveSendResult = true;
  }

  function ReceiveReviewRequest() public {
    if (isEnabledReceiveReviewRequest) {
        emit next("", "", "ReceiveReviewRequest");
    }
          isActiveSubmitReview = true;
  }

  function SubmitReview() external {
    if (isActiveSubmitReview) {
          isEnabledReceiveReviews = true;
          ReceiveReviews();
    }
          isActiveFeedbackReceived = true;
  }

  function SendResult() external {
    if (isActiveSendResult) {
          isEnabledNotifactionReceived = true;
          NotifactionReceived();
    }
  }

  function FeedbackReceived() public {
    if (isEnabledFeedbackReceived) {
        emit next("", "", "FeedbackReceived");
    }
  }

}
