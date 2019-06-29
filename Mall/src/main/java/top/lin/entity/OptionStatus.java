package top.lin.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 11:57
 */
public class OptionStatus {
    private Integer id;
    private Integer shopId;
    private Date date;
    private Integer pv;
    private Integer uv;
    private Integer gameCoupon;
    private Integer heanCoupon;
    private Integer floorCoupon;
    private Integer parking;
    private Integer comment;
    private Integer opinion;
    private Integer fightfChartPV;
    private Integer fightfChartUV;
    private Integer yesYesTouchPV;
    private Integer yesYesTouchUV;

    public String getFormatDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }

    @Override
    public String toString() {
        return "OptionStatus{" +
                "id=" + id +
                ", shopId=" + shopId +
                ", date=" + date +
                ", pv=" + pv +
                ", uv=" + uv +
                ", gameCoupon=" + gameCoupon +
                ", heanCoupon=" + heanCoupon +
                ", floorCoupon=" + floorCoupon +
                ", parking=" + parking +
                ", comment=" + comment +
                ", opinion=" + opinion +
                ", fightfChartPV=" + fightfChartPV +
                ", fightfChartUV=" + fightfChartUV +
                ", yesYesTouchPV=" + yesYesTouchPV +
                ", yesYesTouchUV=" + yesYesTouchUV +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getPv() {
        return pv;
    }

    public void setPv(Integer pv) {
        this.pv = pv;
    }

    public Integer getUv() {
        return uv;
    }

    public void setUv(Integer uv) {
        this.uv = uv;
    }

    public Integer getGameCoupon() {
        return gameCoupon;
    }

    public void setGameCoupon(Integer gameCoupon) {
        this.gameCoupon = gameCoupon;
    }

    public Integer getHeanCoupon() {
        return heanCoupon;
    }

    public void setHeanCoupon(Integer heanCoupon) {
        this.heanCoupon = heanCoupon;
    }

    public Integer getFloorCoupon() {
        return floorCoupon;
    }

    public void setFloorCoupon(Integer floorCoupon) {
        this.floorCoupon = floorCoupon;
    }

    public Integer getParking() {
        return parking;
    }

    public void setParking(Integer parking) {
        this.parking = parking;
    }

    public Integer getComment() {
        return comment;
    }

    public void setComment(Integer comment) {
        this.comment = comment;
    }

    public Integer getOpinion() {
        return opinion;
    }

    public void setOpinion(Integer opinion) {
        this.opinion = opinion;
    }

    public Integer getFightfChartPV() {
        return fightfChartPV;
    }

    public void setFightfChartPV(Integer fightfChartPV) {
        this.fightfChartPV = fightfChartPV;
    }

    public Integer getFightfChartUV() {
        return fightfChartUV;
    }

    public void setFightfChartUV(Integer fightfChartUV) {
        this.fightfChartUV = fightfChartUV;
    }

    public Integer getYesYesTouchPV() {
        return yesYesTouchPV;
    }

    public void setYesYesTouchPV(Integer yesYesTouchPV) {
        this.yesYesTouchPV = yesYesTouchPV;
    }

    public Integer getYesYesTouchUV() {
        return yesYesTouchUV;
    }

    public void setYesYesTouchUV(Integer yesYesTouchUV) {
        this.yesYesTouchUV = yesYesTouchUV;
    }
}
