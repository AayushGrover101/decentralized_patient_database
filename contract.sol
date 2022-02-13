// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract Database {

    struct PatientDatabase {
        uint id;
        string name;
        string currentMedications;
        string pastMedications;
        string presecriptions;
        string pastProcedures;
        string diseaseHistory;
        string allergies;
        string _notes;
        string OHIP;

        // allow data to be used to further the progression of artificial intelligence algorithms
        bool dataUsageAgreement;
    }

    // mapping
    mapping (uint => PatientDatabase) public patientsById;
    uint public patientCount;

    mapping (string => PatientDatabase) public patientsByOHIP;
    string public searchOHIP;


    // adding datapoints
    function addPatient(string memory _name, string memory _currentMedications, string memory _pastMedications, string memory _presecriptions, string memory _pastProcedures, string memory _diseaseHistory, string memory _allergies, string memory _notes, string memory _OHIP,  bool _dataUsageAgreement) public {
        patientCount++;
        searchOHIP = _OHIP;
        patientsById[patientCount] = PatientDatabase(patientCount, _name, _currentMedications, _pastMedications, _presecriptions, _pastProcedures, _diseaseHistory, _allergies, _notes, _OHIP, _dataUsageAgreement);
        patientsByOHIP[searchOHIP] = PatientDatabase(patientCount, _name, _currentMedications, _pastMedications, _presecriptions, _pastProcedures, _diseaseHistory, _allergies, _notes, _OHIP, _dataUsageAgreement);
    }

}
