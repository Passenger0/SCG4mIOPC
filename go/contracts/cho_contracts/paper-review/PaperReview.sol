pragma solidity >=0.4.24;
contract Registry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  constructor(string memory _version) public {
    version = _version;
    Init();
  }

bool private ReviewRequest_Active = false;

function Init() public {
    ReviewRequest_Active = true;
}

bool private Review_Active = false;

function AssignPaper() public {
    if(ReviewRequest_Active) {
        Review_Active = true;
        ReviewRequest_Active = false;
        emit next("","","ReceiveReviewRequest");
    }
}

bool private Gateway_0itszv8_Active = false;

function SubmitReview() public {
    if(Review_Active) {
        Gateway_0itszv8_Active = true;
        Gateway_0itszv8();
        Review_Active = false;
        emit next("","","ReceiveReviews");
    }
}

bool private Feedback_Active = false;

bool private Notification_Active = false;

function Gateway_0itszv8() public {
    if (Gateway_0itszv8_Active) {
        Feedback_Active = true;
        Notification_Active = true;
        Gateway_0itszv8_Active = false;
    }
}

bool private Gateway_02hbkji_from_Feedback_Active = false;

function SendFeedback() public {
    if(Feedback_Active) {
        Gateway_02hbkji_from_Feedback_Active = true;
        Feedback_Active = false;
        emit next("","","FeedbackReceived");
    }
}

bool private Gateway_02hbkji_from_Notification_Active = false;

function SendResult() public {
    if(Notification_Active) {
        Gateway_02hbkji_from_Notification_Active = true;
        Notification_Active = false;
        emit next("","","NotifactionReceived");
    }
}

bool private _Active = false;

function Gateway_02hbkji() public {
    if ( Gateway_02hbkji_from_Feedback_Active && Gateway_02hbkji_from_Notification_Active) {
        _Active = true;
        Gateway_02hbkji_from_Feedback_Active = false;
        Gateway_02hbkji_from_Notification_Active = false;
    }
}

function End() public {
    if(_Active) {
        // Event_1ilon0o_Active = true;
    }
}

}
