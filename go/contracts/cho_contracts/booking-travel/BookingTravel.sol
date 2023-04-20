pragma solidity >=0.4.24;
contract Registry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  constructor(string memory _version) public {
    version = _version;
    Init();
  }

bool private TravelInfo_Active = true;

function Init() public {
    TravelInfo_Active = true;
}

bool private Offer_Active = false;

function SendTravelRequest() public {
    if(TravelInfo_Active) {
        Offer_Active = true;
        TravelInfo_Active = false;
        emit next("","","ReceiveRequest");
    }
}

bool private Gateway_0dtfzfd_Active = false;

function SendOrder() public {
    if(Offer_Active) {
        Gateway_0dtfzfd_Active = true;
        Gateway_0dtfzfd();
        Offer_Active = false;
        emit next("","","ReceiveOffer");
    }
}

bool private Rejection_Active = false;

bool private Confirmation_Active = false;

function Gateway_0dtfzfd() public {
    if (Gateway_0dtfzfd_Active) {
        Rejection_Active = true;
        Confirmation_Active = true;
        Gateway_0dtfzfd_Active = false;
    }
}

bool private Gateway_1y210oa_from_Rejection_Active = false;

function SendRejection() public {
    if(Rejection_Active) {
        Gateway_1y210oa_from_Rejection_Active = true;
        Rejection_Active = false;
        emit next("","","ReceiveRejection");
    }
}

bool private Itinerary_Active = false;

function SendConfirmation() public {
    if(Confirmation_Active) {
        Itinerary_Active = true;
        Confirmation_Active = false;
        emit next("","","ReceiveConfirmation");
    }
}

bool private Gateway_1y210oa_from_Itinerary_Active = false;

function SendItinerary() public {
    if(Itinerary_Active) {
        Gateway_1y210oa_from_Itinerary_Active = true;
        Itinerary_Active = false;
        emit next("","","ReceiveItinerary");
    }
}

bool private _Active = false;

function Gateway_1y210oa() public {
    if ( Gateway_1y210oa_from_Rejection_Active || Gateway_1y210oa_from_Itinerary_Active) {
        _Active = true;
        Gateway_1y210oa_from_Rejection_Active = false;
        Gateway_1y210oa_from_Itinerary_Active = false;
    }
}

function End() public {
    if(_Active) {
        //Event_1ilon0o_Active = true;
    }
}

}
