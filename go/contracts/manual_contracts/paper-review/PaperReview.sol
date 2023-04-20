//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.0 <0.9.0;

contract PaperReview {

    bool private activeSubmitReview = false;
    bool private activeSendResult = false;
    bool private activeSendFeedback = false;

    string public version;
    constructor(string memory _version) public {  
        version = _version;
    }

    event next(bytes from, bytes to, bytes activity);//消息广播

    function AssignPaper() public {
        activeSubmitReview = true;
        emit next("", "", "ReceiveReviewRequest");
    }

    function SubmitReview() public {
        if (activeSubmitReview) {
            activeSendFeedback = true;
            activeSendResult = true;
            emit next ("", "", "ReceiveReviews");
        }
    }

    function SendResult() public {
        if (activeSendResult) {
            emit next("", "", "NotificationReceived");
        }
    }

    function SendFeedback() public {
        if (activeSendFeedback) {
            emit next("", "", "FeedbackReceived");
        }
    }
    
}