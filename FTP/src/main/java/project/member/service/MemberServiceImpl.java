package project.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.member.mapper.MemberMapper;
import project.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public List<MemberVO> getMemberList() {

		return memberMapper.getMemberList();
	}

	//@Override
	//public void insertMember(MemberVO member) {
	//	memberMapper.insertMember(member);}
	
}
