package com.ontimize.finants.model.debtSetting;

import com.ontimize.finants.model.core.dao.GroupDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.dto.EntityResultMapImpl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class GroupBalance {

    private BigDecimal totalAmount = BigDecimal.ZERO;
    private BigDecimal splitAmount = BigDecimal.ZERO;
    private ArrayList<User> groupMembers = new ArrayList<>();

    private List<SettlingMovement> movementList = new ArrayList<>();

    public GroupBalance(ArrayList<User> groupMembers) {
        this.groupMembers = groupMembers;
        this.totalAmount = calculateTotalAmount();
        this.splitAmount = calculateSplitAmount();
    }

    public GroupBalance(EntityResult entityResult) {
        createGroupFromEntityResult(entityResult);
    }

    private void createGroupFromEntityResult(EntityResult entityResult) {

    }

    private BigDecimal calculateTotalAmount() {
        groupMembers.forEach(u -> totalAmount = totalAmount.add(u.getBalance()));
        return this.totalAmount;
    }

    private BigDecimal calculateSplitAmount(){
        if (totalAmount.compareTo(BigDecimal.ZERO) != 0) {
            //Expenses are negative movements, the sum should be negative
            //But is also possible to add group incomes even if not yet implemented
            splitAmount = totalAmount.divide(new BigDecimal(groupMembers.size()), RoundingMode.HALF_EVEN);
            splitAmount = splitAmount.setScale(2, RoundingMode.HALF_EVEN);
        }

        return this.splitAmount;
    }

    public EntityResult settlingBalance(){
        // Calculate group balance for each group member
        // Each user balance is the sum of its movements (what they theoretically paid)
        // minus how much they should pay
        groupMembers.forEach(u -> u.setBalance(splitAmount.subtract(u.getBalance())));

        // First, the user list is cloned and ordered in ascending order
        // That way users who owe the most money go first
        ArrayList<User> usersCloned = (ArrayList<User>) groupMembers.clone();
        usersCloned.sort(Comparator.comparing(User::getBalance));

        // Due to operations with irrational numbers, rounding is needed and might be some difference between
        // total amount and calculated total of up to 0.01, to fix this, 0.01 is added to the amount
        // the user who is owed the most should receive
        BigDecimal calculatedTotalFromSplit =  splitAmount.abs().multiply(new BigDecimal(groupMembers.size()));
        if (totalAmount.abs().compareTo(calculatedTotalFromSplit) < 0) {
            groupMembers.sort(Comparator.comparing(User::getBalance).reversed());
            BigDecimal adjustCent = groupMembers.get(0).getBalance().add(new BigDecimal("0.01"));

            groupMembers.get(0).setBalance(adjustCent);
        }

        for (int i = 0; i < usersCloned.size(); i++) {
            User payer = usersCloned.get(i);
            BigDecimal payerShouldSend = payer.getBalance().abs();

            // We skip users with positive balance, they don't have to pay to anyone
            while (payerShouldSend.compareTo(BigDecimal.ZERO) > 0) {
                // Original user list is sorted in reversed orderd, the user who is owed the most gets paid first
                groupMembers.sort(Comparator.comparing(User::getBalance).reversed());
                User userToPay = groupMembers.get(0);
                BigDecimal recipientShouldReceive = userToPay.getBalance().abs();

                // The amount payer has to pay should be compared in absolute values
                // to check if they owe more or less than userToPay is owed
                if (payerShouldSend.compareTo(recipientShouldReceive) >= 0) {
                    // Payer has to pay more than the recipient will receive, it will be split
                    BigDecimal amount = recipientShouldReceive;
                    userToPay.setBalance(userToPay.getBalance().subtract(amount));
                    payerShouldSend = payerShouldSend.subtract(amount);
                    payer.setBalance(payer.getBalance().add(amount));
                    movementList.add(new SettlingMovement(amount, payer, userToPay)); //For readability, quantities are better in positive values

                // If payer owes more than userToPay is owed, payer will split
                // their debt in two payments to two different users
                } else if (payerShouldSend.compareTo(recipientShouldReceive) < 0) {
                    // Payer pays all their money to userToPay, since it's not enough to cover the owed quantity
                    BigDecimal amount = payerShouldSend;
                    userToPay.setBalance(userToPay.getBalance().subtract(amount));
                    payerShouldSend = payerShouldSend.subtract(amount);
                    payer.setBalance(payer.getBalance().add(amount));
                    movementList.add(new SettlingMovement(amount, payer, userToPay)); //For readability, quantities are better in positive values

                }
            }
        }

        //Export movements as entity result
        /* Map<String, Object> = EntityResult
         * <ATTR_PAYER, List{"user1", "user2" ... "userN"}>
         * <ATTR_RECIPIENT,  List{"user1", "user2" ... "userN"}>
         * <ATTR_AMOUNT, List{"amount1", "amount2" ... "amountN"}
         */

        EntityResult settingMovements = new EntityResultMapImpl();
        List<String> payers = new ArrayList<>();
        List<String> recipients = new ArrayList<>();
        List<BigDecimal> amounts = new ArrayList<>();

        for (SettlingMovement m : movementList) {
            payers.add(m.getPayer().getName());
            recipients.add(m.getReceiver().getName());
            amounts.add(m.getAmount());
        }

        settingMovements.put(GroupDao.ATTR_PAYER, payers);
        settingMovements.put(GroupDao.ATTR_RECIPIENT, recipients);
        settingMovements.put(GroupDao.ATTR_AMOUNT, amounts);

        return settingMovements;
    }

}
