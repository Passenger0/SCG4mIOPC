pragma solidity >=0.4.24;
contract Registry {
  event next(bytes from, bytes to, bytes activity);

  string public version;
  constructor(string memory _version) public {
    version = _version;
    Init();
  }

bool private examslist_Active = true;

function Init() public {
    examslist_Active = true;
}

bool private prenotation_Active = false;

function CommunicateExamSession() public {
    if(examslist_Active) {
        prenotation_Active = true;
        examslist_Active = false;
        emit next("","","ChooseExam");
    }
}

bool private newsession_Active = false;

function BookExam() public {
    if(prenotation_Active) {
        newsession_Active = true;
        prenotation_Active = false;
        emit next("","","BookStudent");
    }
}

bool private evaluation_Active = false;

function AdviseProfessor() public {
    if(newsession_Active) {
        evaluation_Active = true;
        newsession_Active = false;
        emit next("","","InitProfessor");
    }
}

bool private Event_1ilon0o_Active = false;

function Evaluate() public {
    if(evaluation_Active) {
        Event_1ilon0o_Active = true;
        evaluation_Active = false;
        emit next("","","ReceiveEvaluation");
    }
}

function End() public {
    if(evaluation_Active) {
        Event_1ilon0o_Active = true;
    }
}

}
