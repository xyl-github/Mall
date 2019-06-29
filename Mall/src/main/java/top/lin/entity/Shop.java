package top.lin.entity;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 10:13
 */
public class Shop {
    private Integer sid;
    private String sname;
    private String address;
    private String image;
    private String tel;
    private String businessHours;
    private Double longitude;
    private Double latitude;
    private String hotSearch;
    private Integer status;
    private String qrcodeImage;
    private String qrcodeText;

    public String getQrcodeImage() {
        return qrcodeImage;
    }

    public void setQrcodeImage(String qrcodeImage) {
        this.qrcodeImage = qrcodeImage;
    }

    public String getQrcodeText() {
        return qrcodeText;
    }

    public void setQrcodeText(String qrcodeText) {
        this.qrcodeText = qrcodeText;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getBusinessHours() {
        return businessHours;
    }

    public void setBusinessHours(String businessHours) {
        this.businessHours = businessHours;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public String getHotSearch() {
        return hotSearch;
    }

    public void setHotSearch(String hotSearch) {
        this.hotSearch = hotSearch;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                ", address='" + address + '\'' +
                ", image='" + image + '\'' +
                ", tel='" + tel + '\'' +
                ", businessHours='" + businessHours + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", hotSearch='" + hotSearch + '\'' +
                ", status=" + status +
                '}';
    }
}
