﻿using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class PostRepository : IPostRepository
    {
        public IEnumerable<Post> GetPosts() => PostDAO.Instance.GetPosts();
        public Post GetPostById(Guid postId) => PostDAO.Instance.GetPostById(postId);
        public void DeletePostById(Guid postId) => PostDAO.Instance.DeletePostById(postId);
        public bool CreatePost(Guid userid, string roleName, Guid grouppostid, string title, string tags, string content)
            => PostDAO.Instance.CreatePost(userid, roleName, grouppostid, title, tags, content);

        public int DecreaseLikesTotal(Guid postid)
             => PostDAO.Instance.DecreaseLikesTotal(postid);

        public int IncreaseLikesTotal(Guid postid)
            => PostDAO.Instance.IncreaseLikesTotal(postid);

        public int IncreaseCommentsTotal(Guid postid) => PostDAO.Instance.IncreaseCommentsTotal(postid);

        public async Task<List<Post>> SearchStringPostsByUserLogined(Guid userid, string searchString)
             => await PostDAO.Instance.SearchStringPostsByUserLogined(userid, searchString);

        public Task<List<Post>> GetPostsForUserLogined(Guid userid)
            => PostDAO.Instance.GetPostsForUserLogined(userid);

        public async Task<List<Post>> SearchTagsPostsByUserLogined(Guid userid, string searchTags)
            => await PostDAO.Instance.SearchTagsPostsByUserLogined(userid, searchTags);

        public async Task<List<Post>> GetPostsInUserDetailsWithoutLogin(Guid userDetailId)
                => await PostDAO.Instance.GetPostsInUserDetailsWithoutLogin(userDetailId);

        public async Task<IEnumerable<Post>> GetPostByGroupIdAndUserPostId(Guid groupId, Guid userPostId)
                => await PostDAO.Instance.GetPostByGroupIdAndUserPostId(groupId, userPostId);

        public async Task<IEnumerable<Post>> GetPostsByGroupId(Guid groupId)
                => await PostDAO.Instance.GetPostsByGroupId(groupId);
    }
}
