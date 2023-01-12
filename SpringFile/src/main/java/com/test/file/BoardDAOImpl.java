package com.test.file;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public int add(BoardDTO dto) {
		
		return template.insert("file.add", dto);
	}
	
	@Override
	public void addFile(FileDTO fdto) {
		
		template.insert("file.addFile", fdto);		
	}
	
	@Override
	public List<BoardDTO> list() {
		
		return template.selectList("file.list");
	}
	
	@Override
	public List<FileDTO> flist(String seq) {
		
		return template.selectList("file.flist", seq);
	}
	
	@Override
	public BoardDTO get(String seq) {
		
		return template.selectOne("file.get", seq);
	}
	
}


















