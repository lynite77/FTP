package project.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	List<MemberVO> getMemberList();
	//void insertMember(MemberVO vo);
}
