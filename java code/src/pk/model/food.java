/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk.model;

/**
 *
 * @author VanThien
 */
public class food {
    private String idfood  ;
    private String foodName ;
    private double price ;
    private String  kind  ;

    public void setKind(String kind) {
        this.kind = kind;
    }
    public void setIdfood(String idfood) {
        this.idfood = idfood;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getIdfood() {
        return idfood;
    }

    public String getFoodName() {
        return foodName;
    }

    public double getPrice() {
        return price;
    }

    public String getKind() {
        return kind;
    }
    
}
