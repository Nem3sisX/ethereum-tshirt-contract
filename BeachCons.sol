pragma solidity >=0.7.0 <0.9.0;

contract BeachTees {
    bool deal_flag = false;
    uint256 public qty_count;
    uint256 public cost;
    address public BeachClass;
    string public order_flag = "Awaited";
    string public payment_flag = "Awaited";

    constructor(uint256 qty_count_temp) {
        BeachClass = msg.sender;
        qty_count = qty_count_temp;
    }

    function accept_calc() public {
        if (msg.sender == BeachClass) {
            revert("BeachTShirt accepting offer.");
        }
        deal_flag = true;
        order_flag = "Confirmed";
        cost = qty_count * 1200;
    }

    function payment_calc() public {
        if (deal_flag == false) {
            if (msg.sender == BeachClass) {
                revert("Wait for offer acceptance");
            } else {
                revert("Payment cannot be executed by BeachTShirt");
            }
        } else {
            if (msg.sender != BeachClass) {
                revert("Payment cannot be executed by BeachTShirt");
            }
            payment_flag = "Completed transaction.";
        }
    }
}
