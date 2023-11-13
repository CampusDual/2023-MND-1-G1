package com.ontimize.finants.model.debtSetting;

import com.ontimize.finants.model.core.dao.MovementDao;
import com.ontimize.jee.common.dto.EntityResult;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class User {
    private String name;
    private final List<Movement> movements = new ArrayList<>();
    private BigDecimal balance = BigDecimal.ZERO;

    public User(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Movement> getMovements() {
        return movements;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public void setMovementsFromEntityResult(EntityResult entityResult) {
        try {
            int movementCount = ((List<Object>) entityResult.get(MovementDao.ATTR_MOV_AMOUNT)).size();

            for (int i = 0; i < movementCount; i++){
                String concept = (String)entityResult.getRecordValues(i).get(MovementDao.ATTR_MOV_CONCEPT);
                BigDecimal amount = (BigDecimal)entityResult.getRecordValues(i).get(MovementDao.ATTR_MOV_AMOUNT);

                Movement movement = new Movement(amount, concept);
                this.movements.add(movement);
            }

            this.calculateBalance();

        } catch (Exception ex) {
            System.err.println(ex.getLocalizedMessage());
        }
    }

    private void calculateBalance(){
        if (!this.movements.isEmpty()) {
            BigDecimal totalMovements = BigDecimal.ZERO;

            for (Movement m : this.movements) {
                totalMovements = totalMovements.add(m.getAmount());
            }

            this.balance = totalMovements;
        }
    }
}
