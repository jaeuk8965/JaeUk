//package com.popup.project.admin.controller;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.io.Resource;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.popup.project.board.inquiry.dto.InquiryDTO;
//import com.popup.project.board.inquiry.dto.InquirySimpleBbsDTO;
//import com.popup.project.board.inquiry.dto.inquiryCommentDTO;
//import com.popup.project.board.inquiry.service.InquirysBoardService;
//import com.popup.project.board.inquiry.service.InquiryFileDownService;
//import com.popup.project.board.inquiry.service.InquiryPagingService;
//import com.popup.project.board.inquiry.service.inquiryCommentService;
//
//import jakarta.servlet.http.HttpServletRequest;
//
//@Controller
//@RequestMapping("/Admin")
//public class AdminInquiryController {
//
//    @Autowired
//    private InquirysBoardService boardService;
//    
//    
//    @Autowired
//    private InquiryFileDownService fileDownService;
//    
//    @Autowired
//    private InquiryPagingService pagingService;
//    
//    @Autowired
//    private inquiryCommentService commentService;
//
//    @RequestMapping("/inquiry/inquiryList")
//    public String boardList(Model model, HttpServletRequest req, InquiryDTO inquiryDTO)
//    {
//        int totalCount = boardService.getTotalCount(inquiryDTO);
//        int pageNum = (req.getParameter("pageNum") == null || req.getParameter("pageNum").equals("")) ? 1 : Integer.parseInt(req.getParameter("pageNum"));
//
//        int start = (pageNum - 1) * InquiryPagingService.PAGE_SIZE + 1;
//        int end = pageNum * InquiryPagingService.PAGE_SIZE;
//        inquiryDTO.setStart(start);
//        inquiryDTO.setEnd(end);
//
//        Map<String, Object> maps = new HashMap<>();
//        maps.put("totalCount", totalCount);
//        maps.put("pageSize", InquiryPagingService.PAGE_SIZE);
//        maps.put("pageNum", pageNum);
//        model.addAttribute("maps", maps);
//
//        model.addAttribute("lists", boardService.getBoardList(inquiryDTO));
//
//        String searchField = req.getParameter("searchField");
//        String searchKeyword = req.getParameter("searchKeyword");
//
//        String pagingImg = pagingService.generatePaging(totalCount, pageNum, req.getContextPath() + "/inquiryList?", searchField, searchKeyword);
//        model.addAttribute("pagingImg", pagingImg);
//
//        model.addAttribute("searchField", searchField);
//        model.addAttribute("searchKeyword", searchKeyword);
//
//        return "Admin/inquiry/inquiryList";
//    }
//
//    @GetMapping("/inquiryWrite")
//    public String boardWriteGet(Model model) {
//        return "/Admin/inquiry/inquiryWrite";
//    }
//
//    @PostMapping("/inquiryWrite")
//    public String writePost(@RequestParam(name = "userNick") String userNick,
//            @RequestParam("inquiry_title") String inquiryTitle,
//            @RequestParam("inquiry_content") String inquiryContent,
//            @RequestParam(value = "inquiry_ofile", required = false) MultipartFile inquiryOfile,
//            @RequestParam(value = "inquiry_sfile", required = false) MultipartFile inquirySfile,
//            RedirectAttributes redirectAttributes) {
//
//        InquirySimpleBbsDTO dto = new InquirySimpleBbsDTO();
//        dto.setInquiry_title(inquiryTitle);
//        dto.setInquiry_content(inquiryContent);
//        dto.setUser_nick(userNick);  // 닉네임 설정
//        
//        try {
//            int result = boardService.writePost(dto, inquiryOfile, inquirySfile);
//            if (result <= 0) {
//                throw new RuntimeException("Post writing failed");
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//            return "redirect:/error?message=fileUploadFailed";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "redirect:/error?message=dataWriteFailed";
//        }
//
//        return "redirect:/Admin/inquiry/inquiryList";
//    }
//
//    @GetMapping("/inquiry/inquiryView")
//    public String boardView(Model model, @RequestParam("inquiry_num") String inquiryNum) {
//        InquirySimpleBbsDTO inquirysimplebbsDTO = new InquirySimpleBbsDTO();
//        inquirysimplebbsDTO.setInquiry_num(inquiryNum);
//
//        // 게시물 조회 및 조회수 증가
//        boardService.incrementVisitCount(inquiryNum);
//        inquirysimplebbsDTO = boardService.getBoardView(inquirysimplebbsDTO);
//        inquirysimplebbsDTO.setInquiry_content(inquirysimplebbsDTO.getInquiry_content().replace("\r\n", "<br/>"));
//
//        // 댓글 조회
//        List<inquiryCommentDTO> comments = commentService.getCommentsByInquiryNum(inquiryNum);
//
//        model.addAttribute("inquirysimplebbsDTO", inquirysimplebbsDTO);
//        model.addAttribute("comments", comments);
//        return "Admin/inquiry/inquiryView";
//    }
//
//    @PostMapping("/inquiry/addComment")
//    public String addComment(inquiryCommentDTO inquirycommentDTO, @RequestParam("inquiry_num") String inquiryNum, @SessionAttribute("userNick") String userNick, @PathVariable("role") String role) {
//        inquirycommentDTO.setInquiry_num(inquiryNum);
//        inquirycommentDTO.setUser_nick(userNick);
//        commentService.addComment(inquirycommentDTO);
//        return "redirect:/Admin/inquiry/inquiryView?inquiry_num=" + inquiryNum;
//    }
//    
//
//    @GetMapping("/inquiryDownload")
//    public ResponseEntity<Resource> downloadFile(
//        @RequestParam("inquiry_ofile") String inquiryOfile,
//        @RequestParam("inquiry_sfile") String inquirySfile,
//        @RequestParam("inquiry_num") String inquiryNum,
//        InquirySimpleBbsDTO inquirysimplebbsDTO) {
//
//        // 파일 존재 여부 체크
//        if (inquiryOfile == null || inquiryOfile.isEmpty()) {
//            // 파일이 없는 경우 처리
//            return ResponseEntity.notFound().build();
//        }
//
//        boardService.incrementDownCount(inquiryNum);
//        
//        return fileDownService.downloadFile(inquiryOfile, inquirySfile);
//    }
//
//    @GetMapping("/inquiryEdit")
//    public String boardEditGet(Model model, InquirySimpleBbsDTO inquirysimplebbsDTO) {
//        inquirysimplebbsDTO = boardService.getBoardView(inquirysimplebbsDTO);
//        model.addAttribute("inquirysimplebbsDTO", inquirysimplebbsDTO);
//        return "Admin/inquiry/inquiryEdit";
//    }
//   
//    @PostMapping("/inquiryEdit")
//    public String boardEditPost(@RequestParam(name = "userNick") String userNick,
//            @RequestParam("inquiry_num") String inquiryNum,
//            @RequestParam("inquiry_title") String inquiryTitle,
//            @RequestParam("inquiry_content") String inquiryContent,
//            @RequestParam(value = "inquiry_ofile", required = false) MultipartFile inquiryOfile,
//            @RequestParam("prevOfile") String prevOfile,
//            HttpServletRequest request) {
//
//        InquirySimpleBbsDTO dto = new InquirySimpleBbsDTO();
//        dto.setInquiry_num(inquiryNum);
//        dto.setInquiry_title(inquiryTitle);
//        dto.setInquiry_content(inquiryContent);
//        dto.setUser_nick(userNick);
//        
//        try {
//            int result = boardService.editPost(dto, inquiryOfile, prevOfile);
//            if (result <= 0) {
//                throw new RuntimeException("Post editing failed");
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//            return "redirect:/error?message=fileUploadFailed";
//        } catch (Exception e) {
//            e.printStackTrace();  // 다른 예외 처리
//            return "redirect:/error?message=unexpectedError";
//        }
//        
//        return "redirect:/Admin/inquiry/inquiryView?inquiry_num=" + inquiryNum;
//    }
//
//    @PostMapping("/inquiryDelete")
//    public String boardDeletePost(HttpServletRequest req) {
//        int result = boardService.inquirydeletePost(req.getParameter("inquiry_num"));
//        System.out.println("글삭제결과:" + result);
//        return "redirect:/Admin/inquiry/inquiryList";
//    }
//}