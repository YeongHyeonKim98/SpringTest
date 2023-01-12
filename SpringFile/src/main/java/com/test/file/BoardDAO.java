package com.test.file;

import java.util.List;

public interface BoardDAO {

	int add(BoardDTO dto);

	void addFile(FileDTO fdto);

	List<BoardDTO> list();

	List<FileDTO> flist(String seq);

	BoardDTO get(String seq);

}
