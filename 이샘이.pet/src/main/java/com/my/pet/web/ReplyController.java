package com.my.pet.web;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Comment;
import com.my.pet.domain.Reply;
import com.my.pet.service.ReplyService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("reply")
public class ReplyController {
	@Autowired private ReplyService replyService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("comment/replyView");
		return mv;
	}
	
	@GetMapping("{commentId}")
	public ModelAndView getRepliesById(@PathVariable int commentId, ModelAndView mv, HttpSession session) {
		session.setAttribute("RepliesById", commentId);
		mv.setViewName("reply/replyView");
		return mv;
	}
	@GetMapping("getComment/{commentId}")
	public Comment getComment(@PathVariable int commentId) {
		return replyService.getComment(commentId);
	}
	@GetMapping("get/{commentId}")
	public List<Reply> getReplies(@PathVariable int commentId){
		return replyService.getReplies(commentId);
	}  
	
	@PostMapping("add")
	public void addReply(String replyContent, LocalDateTime replyTime, String userId, int commentId) {
		replyService.addReply(replyContent, replyTime, userId, commentId);
	}
	
	@PutMapping("fix")
	public void fixReply(@RequestBody Reply reply) {
		replyService.fixReply(reply);
	}
	
	@DeleteMapping("del/{replyId}")
	public void delReply(@PathVariable int replyId) {
		replyService.delReply(replyId);
	}
}
