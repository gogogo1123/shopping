
package com.Ims.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Ims.shop.service.BoardService;
import com.Ims.shop.vo.BoardVo;
import com.Ims.shop.vo.CriteriaBoard;
import com.Ims.shop.vo.PagingBoard;
import com.google.gson.JsonObject;

import org.unbescape.html.HtmlEscape;
@RequestMapping(value = "/board/")
@Controller
public class BoardController{

	private BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {

		this.boardService = boardService;
	}
	
	@RequestMapping("{ct}/List.do")
	  public ModelAndView list(
			  @PathVariable("ct") String ct, @RequestParam(value="keyword", defaultValue = "") String keyword,
			  @RequestParam(value="type", defaultValue = "") String type, ModelAndView mav,CriteriaBoard cri, HttpSession session) throws Exception{
	  System.out.println("cri = " + cri);
	  System.out.println("####################type : "+cri.getType());
	  System.out.println("####################keyword : "+cri.getKeyword());
	 
	  String member_id = (String)session.getAttribute("userid");
	  if (member_id == null) {
		  member_id = "";
	  }
	  int BoardCnt = boardService.BoardListCnt(cri);
	  System.out.println("1번");
	  System.out.println(ct);
	  System.out.println("##################List에 들어온 member_id"+ member_id);
	  cri.setMember_id(member_id);
	  PagingBoard pageMaker = new PagingBoard(); 
	  pageMaker.setCri(cri);
	  pageMaker.setTotalCount(BoardCnt);
	  
	  
	  System.out.println("2번");
	  List<Map<String, Object>> list = boardService.Boardlist(cri);
	  
	  
	  System.out.println("3번");
	  
	  mav.addObject("ct_idx", cri.getCt_idx());
//	  if(cri.getCt_idx()== 0) {
//		  ct = cri.setCt_title("notice");
//	  }
//	  if(cri.getCt_idx() == '1') {
//		  ct = cri.setCt_title("qna");
//	  }
//	  if(cri.getCt_idx()==2) {
//		  ct = cri.setCt_title("dq");
//	  }
	  mav.addObject("list", list); 
	  mav.addObject("pageMaker", pageMaker);
	  
	  mav.addObject("type", type);
	 
	  mav.addObject("keyword", keyword);
	  mav.addObject("ct",ct);
	  mav.setViewName("/board/List");
	  
	  System.out.println("list : " + list);
	  System.out.println("Criteria : " +cri);
	  System.out.println("pageMaker : " + pageMaker);
	  System.out.println("####################type : "+cri.getType());
	  System.out.println("####################keyword : "+cri.getKeyword());
	  return mav;
	  
	  }
	
	// 게시물 상세보기
	@RequestMapping(value = "{ct}/View.do/{bidx}/{ct_idx}")
	public String View(@PathVariable("ct") String ct, @PathVariable("bidx") Integer bidx,
			@PathVariable("ct_idx") int ct_idx,BoardVo vo, CriteriaBoard cri, Model mav,
			@RequestParam(value="keyword", defaultValue = "") String keyword, 
			@RequestParam(value="type", defaultValue = "") String type,
			@RequestParam(value="PerPageNum", defaultValue = "10") Integer PerPageNum,
			@RequestParam(value="page", defaultValue = "1") Integer page) {
		
		int BoardCnt = boardService.BoardListCnt(cri);
		PagingBoard pageMaker = new PagingBoard(); 
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(BoardCnt);
		pageMaker.getCri().setPerPageNum(PerPageNum);
		pageMaker.getCri().setPage(page);
		
		mav.addAttribute("vo", boardService.View(vo));
		mav.addAttribute("pageMaker", pageMaker);
		mav.addAttribute("type", cri.getType());
		mav.addAttribute("keyword", cri.getKeyword());
		mav.addAttribute("ct_idx", ct_idx);
		System.out.println("filename : "+ vo.getFilename());
		System.out.println("file1 : "+ vo.getFiles());
		
		
		
		return "board/View";
		
	}

	// 게시물 글쓰기
	@RequestMapping(value = "{ct}/Write.do")
	public ModelAndView Write(@PathVariable("ct") String ct, HttpServletRequest request, BoardVo boardVo, ModelAndView mav
			) {
		

		mav.setViewName("/board/Write");
		return mav;
	}
	
	@RequestMapping(value = "{ct}/WriteProcess.do")
	public String insert(@PathVariable("ct") String ct,BoardVo boardVo, MultipartHttpServletRequest multiFile,
			HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
//			// ---파일 업로드 관련 --
//			System.out.println("#########################WriteProcess");
//			JsonObject jsonObject = new JsonObject();
//			PrintWriter printWriter = null;
//			OutputStream out = null;
//			MultipartFile file = multiFile.getFile("upload");
//			
//			if(file != null) {
//				if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
//					if(file.getContentType().toLowerCase().startsWith("image/")) {
//					    try{
//					    	 
//				            String fileName = file.getOriginalFilename();
//				            byte[] bytes = file.getBytes();
//				           
//				            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images"); //저장경로
//				            System.out.println("uploadPath:"+uploadPath);
//
//				            File uploadFile = new File(uploadPath);
//				            if(!uploadFile.exists()) {
//				            	uploadFile.mkdir();
//				            }
//				            String fileName2 = UUID.randomUUID().toString();
//				            uploadPath = uploadPath + "/" + fileName2 +fileName;
//				            
//				            out = new FileOutputStream(new File(uploadPath));
//				            out.write(bytes);
//				            
//				            printWriter = resp.getWriter();
//				            String fileUrl = req.getContextPath() + "/resources/images/" +fileName2 +fileName; //url경로
//				            System.out.println("fileUrl :" + fileUrl);
//				            JsonObject json = new JsonObject();
//				            json.addProperty("uploaded", 1);
//				            json.addProperty("fileName", fileName);
//				            json.addProperty("url", fileUrl);
//				            printWriter.print(json);
//				            System.out.println(json);
//				 
//				        }catch(IOException e){
//				            e.printStackTrace();
//				        } finally {
//				            if (out != null) {
//			                    out.close();
//			                }
//			                if (printWriter != null) {
//			                    printWriter.close();
//			                }
//				        }
//					}
//				}
//			}
			
			
			
			
			/*String filename = "-";
			if(!boardVo.getFiles().isEmpty()) {
				filename = boardVo.getFiles().getOriginalFilename();
				try {
					ServletContext application = multiFile.getSession().getServletContext();
					String path = application.getRealPath("/resources/images/");
					System.out.println("path =" +path);
					
					new File(path).mkdir();
					boardVo.getFiles().transferTo(new File(path+filename));
				} catch (Exception e) {
	                 e.printStackTrace();
				}
			}
		boardVo.setFilename(filename);*/
		boardService.insert(boardVo);
		System.out.println("########################boardVo.getHidden====="+boardVo.getHidden());
		
		if(boardVo.getCt_idx() == 0) {
			System.out.println("#############ct_idx = 0");
			return "redirect:/board/notice/List.do?ct=notice&ct_idx=0";
		}else if(boardVo.getCt_idx() == 1) {
			System.out.println("#############ct_idx = 1");
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}else if(boardVo.getCt_idx() == 2){
			System.out.println("#############ct_idx = 2");
			return"redirect:/board/dq/List.do?ct=dq&ct_idx=2";
		}
		System.out.println("#############ct_idx = ????");
		return "redirect:/board/notice/List.do";
//	return "redirect:/board/notice/List.do";
	}



	
	@RequestMapping("{ct}/Modify.do/{bidx}/{ct_idx}")
	public String Modify(@PathVariable("ct") String ct,@PathVariable("bidx") Integer bidx,BoardVo vo, @PathVariable("ct_idx") Integer ct_idx, Model mav, HttpServletRequest request) {
		
		
		System.out.println("######################수정페이지");
		
		
		mav.addAttribute("vo", boardService.View(vo));
		
		
		return "board/Modify";
		
	}

	@RequestMapping("{ct}/update.do")
	public String update(@PathVariable("ct") String ct, BoardVo vo, HttpServletRequest request) {
	 
		System.out.println("######################수정 처리 페이지");
	
		
//		// ---파일 업로드 관련 --
//		
//		String filename = "-";
//		if(!vo.getFiles().isEmpty()) {
//			filename = vo.getFiles().getOriginalFilename();
//			try {
//				ServletContext application = request.getSession().getServletContext();
//				String path = application.getRealPath("/resources/images/");
//				System.out.println("path =" +path);
//				
//				new File(path).mkdir();
//				vo.getFiles().transferTo(new File(path+filename));
//			} catch (Exception e) {
//                 e.printStackTrace();
//			}
//			vo.setFilename(filename);
//			
//			
//		}
//		
//		System.out.println("#########################" + vo.getFilename());
		
		
		
		if(vo.getCt_idx() == 1) {
			boardService.update(vo);
			System.out.println("######################여기실행됨1");
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}else if(vo.getCt_idx() ==0) {
			boardService.update(vo);
			System.out.println("####################여기실행됨0");
			return "redirect:/board/notice/List.do?ct=notice&ct_idx=0";
			
		}else if(vo.getCt_idx() == 2) {
			boardService.update(vo);
			System.out.println("####################여기실행됨2");
			return "redirect:/board/dq/List.do?ct=dq&ct_idx=2";
		}
		return "redirect:/";
		
	}
	
	
	
	


	@RequestMapping("{ct}/Delete.do/{bidx}/{ct_idx}")
	public String Delete(@PathVariable("ct") String ct,@PathVariable("bidx") Integer bidx, @PathVariable("ct_idx") Integer ct_idx,HttpServletRequest request, BoardVo vo) {
						
		System.out.println("###################삭제 페이지");
		
		String filename = boardService.file_info(bidx);
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images/");
			File f = new File(path+filename);
			
			if(f.exists())
				f.delete();
		}
		
		
		
		boardService.delete(bidx);
		if(vo.getCt_idx() ==0) {
			System.out.println("###################공지사항삭제 ct_idx :"+ ct_idx);
			return "redirect:/board/notice/List.do?ct=notice&ct_idx=0";
		}else if(vo.getCt_idx() ==1) {
			System.out.println("###################qna삭제 ct_idx :"+ ct_idx);
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}else if(vo.getCt_idx() ==2) {
			System.out.println("###################dq삭제 ct_idx :"+ ct_idx);
			return"redirect:/board/dq/List.do?ct=dq&ct_idx=2";
		}
		return "redirect:/";
		}


	
	
	
	
}
	
	
	
	
	
