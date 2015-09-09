package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.District;
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.SubscriberComment;
import com.surelution.wxmp.jx.SubscriberCommentAssignment;
import com.surelution.wxmp.jx.SubscriberCommentReplyUser;
import com.surelution.wxmp.jx.User;
import com.surelution.wxmp.jx.UserBranch;

class CommentAction extends JxBaseAction {

	/**
	 * 如果没有action能够匹配上，而且，内容是文本的，则认为该消息是用户咨询消息，需要人工干预
	 */
	@Override
	public boolean accept() {
		getParam(Attribute.KEY_MsgType) == Attribute.Msg_Type_TEXT
	}

	@Override
	public void execute() {
		def now = new Date()
        def content = getParam(Attribute.KEY_Content).trim()
		def title = KeyedMessage.findByKey("COMMENT-ACCEPTED").message
		SubscriberComment sc = new SubscriberComment()
		sc.subscriber = subscriber
		sc.content = content
		sc.createdAt = now
		sc.closed = false
		sc.save(flush:true)

		def comments = SubscriberCommentAssignment.findAllBySubscriberAndClosed(subscriber, false)
		if(!comments || comments.size() == 0) {
			def user
			def users
			def branch = subscriber.preferedBranch
			if(branch) {
				users = SubscriberCommentReplyUser.findAllByBranch(branch)
			} else {
				users = SubscriberCommentReplyUser.findAllByBranchIsNull()
			}
			if(users) {
				user = users[0]?.user
			}
			if(!user) {
				user = User.get(1)
			}
			SubscriberCommentAssignment assignment = new SubscriberCommentAssignment()
			assignment.subscriber = subscriber
			assignment.tips = "系统指派"
			assignment.closed = false
			assignment.user = user
			assignment.createAt = now
			assignment.save(flush:true)
			print assignment.errors
		}
		
		put(new Attribute(Attribute.KEY_Content, "${title}${content}"))
	}

}
