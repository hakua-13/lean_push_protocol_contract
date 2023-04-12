// SPDX-License-Identifier: Mit

pragma solidity ^0.8.17;

// PUSH Comm Contract Interface
interface IPUSHCommInterface {
    function sendNotification(address _channel, address _recipient, bytes calldata _identity) external;
}

contract testSendingNotifications{
    address public EPNS_COMM_CONTRACT_ADDRESS_FOR_SPECIFIC_BLOCKCHAIN = 0xb3971BCef2D791bc4027BbfedFb47319A4AAaaAa;
  

    function sendNotification() public{
        IPUSHCommInterface(EPNS_COMM_CONTRACT_ADDRESS_FOR_SPECIFIC_BLOCKCHAIN).sendNotification(
            0xc9d7144d4Bb4fF5936D1540faaeeFd0201b5fdf8, // from channel - recommended to set channel via dApp and put it's value -> then once contract is deployed, go back and add the contract address as delegate for your channel
            0xB05c8a4a1589F6809d1be61E81C0296a36652A26, // to recipient, put address(this) in case you want Broadcast or Subset. For Targetted put the address to which you want to send
            bytes(
                string(
                    // We are passing identity here: https://docs.epns.io/developers/developer-guides/sending-notifications/advanced/notification-payload-types/identity/payload-identity-implementations
                    abi.encodePacked(
                        "0", // this is notification identity: https://docs.epns.io/developers/developer-guides/sending-notifications/advanced/notification-payload-types/identity/payload-identity-implementations
                        "+", // segregator
                        "3", // this is payload type: https://docs.epns.io/developers/developer-guides/sending-notifications/advanced/notification-payload-types/payload (1, 3 or 4) = (Broadcast, targetted or subset)
                        "+", // segregator
                        "Title", // this is notificaiton title
                        "+", // segregator
                        "Body" // notification body
                    )
                )
            )
        );
    }
}