using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IPostRepository
    {
        void CreatePost(Post post);
        void DeletePostById(Guid postId);
        Post GetPostById(Guid postId);
        IEnumerable<Post> GetPosts();
    }
}