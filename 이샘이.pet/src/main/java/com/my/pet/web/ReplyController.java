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

import com.my.pet.domain.Reply;
import com.my.pet.service.ReplyService;

@RestController
@RequestMapping("reply")
public class ReplyController {
	@Autowired private ReplyService replyService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("comment/replyView");
		return mv;
	}
	 
	@GetMapping("get")
	public List<Reply> getReplies(){
		return replyService.getReplies();
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
