using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public class PostRepository : IPostRepository
    {
        public IEnumerable<Post> GetPosts() => PostDAO.Instance.GetPosts();
        public Post GetPostById(Guid postId) => PostDAO.Instance.GetPostById(postId);
        public void DeletePostById(Guid postId) => PostDAO.Instance.DeletePostById(postId);
        public void CreatePost(Post post) => PostDAO.Instance.CreatePost(post);

        public int DecreaseLikesTotal(Guid postid)
             => PostDAO.Instance.DecreaseLikesTotal(postid);

        public int IncreaseLikesTotal(Guid postid)
            => PostDAO.Instance.IncreaseLikesTotal(postid);
    }
}
