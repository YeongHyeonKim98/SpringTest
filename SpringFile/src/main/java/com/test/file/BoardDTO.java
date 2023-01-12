package com.test.file;

import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {

	private String seq;
	private String subject;
	private String content;
	private String regdate;
	
	//private String attach;
	private List<FileDTO> files;
	
}
