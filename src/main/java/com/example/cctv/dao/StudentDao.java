package com.example.cctv.dao;

import com.example.cctv.entity.Studentinfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StudentDao
{
	@Select("<script> SELECT STU.SID, STU.SNAME,STU.SSEX,CLA.CNAME FROM STUDENTINFO STU,CLASSINFO CLA WHERE STU.CID=CLA.CID " +
			"<when test='sname!=null'> AND STU.SNAME  LIKE CONCAT('%',#{sname},'%')</when> " +
			"<when test='ssex!=null'> AND STU.SSEX=#{ssex} </when>" +
			"LIMIT #{limit} OFFSET #{start} </script>")
	List<Studentinfo> getList(Integer limit,Integer start,String sname,String ssex);

	@Select("<script> SELECT COUNT(*) FROM STUDENTINFO WHERE 1=1" +
			"<when test='sname!=null'> AND SNAME LIKE CONCAT('%',#{sname},'%')</when> " +
			"<when test='ssex!=null'> AND SSEX=#{ssex} </when> </script>")
	Integer getSum(String sname,String ssex);

	@Update("UPDATE STUDENTINFO SET SNAME =#{sname} WHERE SID=#{sid}")
	int updateSname(Long sid,String sname);

	@Delete("DELETE FROM STUDENTINFO WHERE SID=#{sid}")
	int deleteStudent(Long sid);

	@Insert("INSERT INTO STUDENTINFO (SNAME,SSEX,CID) VALUES (#{sname},#{ssex},#{cid})")
	int addStudent(Studentinfo studentinfo);
}