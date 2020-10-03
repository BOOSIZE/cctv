package com.example.cctv.entity;


public class Studentinfo {

  private Long sid;
  private String sname;
  private String ssex;
  private Long cid;
  private String cname;

  public String getCname()
  {
    return cname;
  }

  public void setCname(String cname)
  {
    this.cname = cname;
  }

  public Long getSid() {
    return sid;
  }

  public void setSid(Long sid) {
    this.sid = sid;
  }


  public String getSname() {
    return sname;
  }

  public void setSname(String sname) {
    this.sname = sname;
  }


  public String getSsex() {
    return ssex;
  }

  public void setSsex(String ssex) {
    this.ssex = ssex;
  }


  public Long getCid() {
    return cid;
  }

  public void setCid(Long cid) {
    this.cid = cid;
  }

}
