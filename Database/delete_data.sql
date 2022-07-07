select * from posts

select * from GroupUsers 
where GroupID  = '42422529-d855-40b4-b7c0-619ef761dcb3'
update GroupUsers
set Status = 4 
where GroupUserID in ( select GroupUserID from GroupUsers where GroupID in (select GroupID from Groups where GroupOwnerID = '4C5BE4AB-4B6C-413C-AD98-0EF5B0A82C1B'))
select * from users where email like '%quanly@%'
-- Delete posts
delete GroupUsers 
where groupid = '42422529-d855-40b4-b7c0-619ef761dcb3'

delete likes
where postid in (select postid from posts where grouppostid = '42422529-d855-40b4-b7c0-619ef761dcb3')

delete CommentReplies
where CommentReplyID in (select CommentReplyID from CommentReplies where CommentID in (select CommentID from Comments where PostID in (select PostID from Posts where GroupPostID = '42422529-d855-40b4-b7c0-619ef761dcb3' )))

delete Comments
where postid in (select postid from posts where grouppostid = '42422529-d855-40b4-b7c0-619ef761dcb3')

delete posts
where GroupPostID = '42422529-d855-40b4-b7c0-619ef761dcb3'

delete groups 
where groupid = '42422529-d855-40b4-b7c0-619ef761dcb3'


