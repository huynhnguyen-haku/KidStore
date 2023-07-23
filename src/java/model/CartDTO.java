package model;

/**
 *
 * @author huynh
 */
public class CartDTO extends ProductDTO{
    private int amount;
    
    public CartDTO() { 
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
