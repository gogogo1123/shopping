
package com.Ims.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.BoardVo;
import com.Ims.shop.vo.CriteriaBoard;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.PagingBoard;
import com.Ims.shop.vo.QnaVo;
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
			  @RequestParam(value="type", defaultValue = "") String type, ModelAndView mav,CriteriaBoard cri) throws Exception{
	  System.out.println("cri = " + cri);
	  System.out.println("####################type : "+cri.getType());
	  System.out.println("####################keyword : "+cri.getKeyword());
	  HtmlEscape.unescapeHtml("&amp;&amp; &quot; &apos; &apos; &lt; &gt; &nbsp; <br>");
	  int BoardCnt = boardService.BoardListCnt(cri);
	  System.out.println("1???");
	  
	  PagingBoard pageMaker = new PagingBoard(); 
	  pageMaker.setCri(cri);
	  pageMaker.setTotalCount(BoardCnt);
	  System.out.println("2???");
	  List<Map<String, Object>> list = boardService.Boardlist(cri);
	  System.out.println("3???");
	  
	  mav.addObject("ct_idx", cri.getCt_idx());
	  mav.addObject("list", list); 
	  mav.addObject("pageMaker", pageMaker);
	/*
	 * if (type != null & type != "") {
	 */  
		  mav.addObject("type", type);
	  /*
	  }
	  if (keyword != null & keyword != "") {
		  */
		  mav.addObject("keyword", keyword);
	  /*
	  }
	  */
	  mav.setViewName("/board/List");
	  
	  System.out.println("list : " + list);
	  System.out.println("Criteria : " +cri);
	  System.out.println("pageMaker : " + pageMaker);
	  System.out.println("####################type : "+cri.getType());
	  System.out.println("####################keyword : "+cri.getKeyword());
	  return mav;
	  
	  }
	
	// ????????? ????????????
	@RequestMapping(value = "{ct}/View.do/{bidx}/{ct_idx}")
	public String View(@PathVariable("ct") String ct, @PathVariable("bidx") Integer bidx,
			@PathVariable("ct_idx") String ct_idx,BoardVo vo, CriteriaBoard cri, Model mav,
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
		
		mav.addAttribute("vo", boardService.View(bidx));
		mav.addAttribute("pageMaker", pageMaker);
		mav.addAttribute("type", cri.getType());
		mav.addAttribute("keyword", cri.getKeyword());
		System.out.println("filename : "+ vo.getFilename());
		System.out.println("file1 : "+ vo.getFiles());
		
		
		
		return "board/View";
		
	}

	// ????????? ?????????
	@RequestMapping(value = "{ct}/Write.do")
	public ModelAndView Write(@PathVariable("ct") String ct, HttpServletRequest request, BoardVo boardVo, ModelAndView mav
			) {
		

		mav.setViewName("/board/Write");
		return mav;
	}
	
	@RequestMapping(value = "{ct}/WriteProcess.do")
	public String insert(@PathVariable("ct") String ct,BoardVo boardVo, MultipartHttpServletRequest request
			) throws Exception{
		
			// ---?????? ????????? ?????? --
			System.out.println("#########################WriteProcess");
			
			String filename = "-";
			if(!boardVo.getFiles().isEmpty()) {
				filename = boardVo.getFiles().getOriginalFilename();
				try {
					ServletContext application = request.getSession().getServletContext();
					String path = application.getRealPath("/resources/images/");
					System.out.println("path =" +path);
					
					new File(path).mkdir();
					boardVo.getFiles().transferTo(new File(path+filename));
				} catch (Exception e) {
	                 e.printStackTrace();
				}
			}
		boardVo.setFilename(filename);
		boardService.insert(boardVo);
		
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
	public String Modify(@PathVariable("ct") String ct,@PathVariable("bidx") Integer bidx, @PathVariable("ct_idx") String ct_idx, Model mav, HttpServletRequest request, BoardVo vo) {
		
		
		System.out.println("######################???????????????");
		
		
		mav.addAttribute("vo", boardService.View(bidx));
		
		
		return "board/Modify";
		
	}

	@RequestMapping("{ct}/update.do")
	public String update(@PathVariable("ct") String ct, BoardVo vo, HttpServletRequest request) {
	 
		System.out.println("######################?????? ?????? ?????????");
	
		
		// ---?????? ????????? ?????? --
		
		String filename = "-";
		if(!vo.getFiles().isEmpty()) {
			filename = vo.getFiles().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				vo.getFiles().transferTo(new File(path+filename));
			} catch (Exception e) {
                 e.printStackTrace();
			}
			vo.setFilename(filename);
			
			
		}
		
		System.out.println("#########################" + vo.getFilename());
		
		
		
		if(vo.getCt_idx() == 1) {
			boardService.update(vo);
			System.out.println("######################???????????????1");
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}else if(vo.getCt_idx() ==0) {
			boardService.update(vo);
			System.out.println("####################???????????????0");
			return "redirect:/board/notice/List.do?ct=notice&ct_idx=0";
			
		}
		return "redirect:/";
		
	}
	
	
	


	@RequestMapping("{ct}/Delete.do/{bidx}/{ct_idx}")
	public String Delete(@PathVariable("ct") String ct,@PathVariable("bidx") Integer bidx, @PathVariable("ct_idx") String ct_idx,HttpServletRequest request, BoardVo vo) {
						
		System.out.println("###################?????? ?????????");
		
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
			System.out.println("###################?????????????????? ct_idx :"+ ct_idx);
			return "redirect:/board/notice/List.do?ct=notice&ct_idx=0";
		}else if(vo.getCt_idx() ==1) {
			System.out.println("###################qna?????? ct_idx :"+ ct_idx);
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}
		
		return "redirect:/";

}
	
	
	
	
	
	
	
	
	
	
}