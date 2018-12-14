pragma solidity ^0.4.24;

//
// A contract to map users ETH address to an IPFS hash of their profile.
//

contract ProfileRegistry {
    event ProfileUpdated(address indexed account, bytes32 ipfsHash);
    event ProfileDeleted(address indexed account);

    mapping(address => bytes32) public profiles;

    // @notice Create or update a profile.
    // @param ipfsHash IPFS hash of the updated profile.
    function updateProfile(bytes32 ipfsHash) public {
        profiles[msg.sender] = ipfsHash;
        emit ProfileUpdated(msg.sender, ipfsHash);
    }

    // @dev Delete a profile.
    function deleteProfile() public {
        delete profiles[msg.sender];
        emit ProfileDeleted(msg.sender);
    }
}