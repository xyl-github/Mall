package top.lin.entity;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 11:14
 */
public class Brand {
    private Integer bid;
    private Integer shopid;
    private String bname;
    private String logo;
    private Integer status;

    @Override
    public String toString() {
        return "Brand{" +
                "bid=" + bid +
                ", shopid=" + shopid +
                ", bname='" + bname + '\'' +
                ", logo='" + logo + '\'' +
                ", status=" + status +
                '}';
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
