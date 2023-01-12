package com.test.file;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO dao;
	
	@GetMapping(value="/list")
	public String list(Model model) {
		
		List<BoardDTO> list = dao.list();			
		
		for (BoardDTO dto : list) {
			List<FileDTO> flist = dao.flist(dto.getSeq());
			dto.setFiles(flist);
		}
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping(value="/add")
	public String add() {
		
		return "add";
	}
	
	
	
	@PostMapping(value="/addok")
	public String addok(HttpServletRequest req) {
		
		
		BoardDTO dto = new BoardDTO();
		
		
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		
		dto.setSubject(subject);
		dto.setContent(content);
		
		int result = dao.add(dto); //글쓰기
		
		
		//multi.getFile(content);		// 1개만 넘겼을때
		List<MultipartFile> files = multi.getFiles("attach");		// 여러개 넘겼을때 
		String path = req.getRealPath("resources/files");
		
		System.out.println(path);
		
		for (MultipartFile file : files) {
			
			//System.out.println(file.isEmpty());
			
			if (!file.isEmpty()) {
				String filename = getFileName(path, file.getOriginalFilename());
				
				try {
					file.transferTo(new File(path + "\\" + filename));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				//첨부파일 정보 insert
				FileDTO fdto = new FileDTO();
				
				fdto.setFilename(filename); //파일명
				fdto.setFilesize(file.getSize() + "");
				fdto.setMimetype(file.getContentType());
				
				dao.addFile(fdto);
				
			}
			
		}
		
		
		return "redirect:/list";
	}
	
	private String getFileName(String path, String filename) {
		
		//저장 폴더내의 파일명을 중복되지 않게 만들기
		//path = "resources/files"
		//filename = "test.txt"
		
		//test.txt > test(1).txt > test(2).txt
		int n = 1; //인덱스 숫자
		int index = filename.lastIndexOf("."); //확장자 위치
		
		String tempName = filename.substring(0, index); //"test"
		String tempExt = filename.substring(index); //".txt"
		
		while (true) {
			
			File file = new File(path + "\\" + filename);
			
			if (file.exists()) {
				//있다. > 중복 > 파일명 변경
				filename = String.format("%s(%d)%s", tempName, n, tempExt);
				n++;				
			} else {
				//없다. > 사용 가능한 파일명
				return filename;
			}
			
		}
		
	}

	@GetMapping(value="/view")
	public String view(Model model, String seq) {
		
		BoardDTO dto = dao.get(seq);
		
		dto.setFiles(dao.flist(seq));		
		
		model.addAttribute("dto", dto);
		
		return "view";
	}
	
}




















