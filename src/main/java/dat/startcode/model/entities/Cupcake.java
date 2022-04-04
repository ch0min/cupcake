package dat.startcode.model.entities;

import java.util.Objects;

public class Cupcake {
    private int cupcake_id;
    private String topping;
    private String bottom;
    private int price;
    private int amount;

    public Cupcake(String topping, String bottom, int price, int amount) {
        this.topping = topping;
        this.bottom = bottom;
        this.price = price;
        this.amount = amount;
    }

    public String getTopping() {
        return topping;
    }

    public String getBottom() {
        return bottom;
    }

    public int getPrice() {
        return price;
    }

    public int getAmount() {
        return amount;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public void setBottom(String bottom) {
        this.bottom = bottom;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Cupcake{" +
                "topping='" + topping + '\'' +
                ", bottom='" + bottom + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Cupcake)) return false;
        Cupcake cupcake = (Cupcake) o;
        return getPrice() == cupcake.getPrice() && getAmount() == cupcake.getAmount() && Objects.equals(getTopping(), cupcake.getTopping()) && Objects.equals(getBottom(), cupcake.getBottom());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getTopping(), getBottom(), getPrice(), getAmount());
    }
}


