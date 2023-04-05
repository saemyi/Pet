package com.my.pet.web;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.pet.domain.Comment;
import com.my.pet.service.CommentService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("comment/commentList");
		return mv;
	}
	 
	@GetMapping("get")
	public List<Comment> getComments(){
		return commentService.getComments();
	}  
	
	@PostMapping("add")
	public void addComment(String commentContent, LocalDateTime commentTime, String userId, int meetingId) {
		commentService.addComment(commentContent, commentTime, userId, meetingId);
	}
	
	@PutMapping("fix")
	public void fixComment(String commentContent, 
			@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")LocalDateTime commentTime) {
		commentService.fixComment(commentContent, commentTime);
	}
	
	@DeleteMapping("del/{commentId}")
	public void delComment(@PathVariable int commentId) {
		commentService.delComment(commentId);
	}
}
