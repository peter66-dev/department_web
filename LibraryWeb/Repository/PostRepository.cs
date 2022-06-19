using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class PostRepository : IPostRepository
    {
        public IEnumerable<Post> GetPosts() => PostDAO.Instance.GetPosts();
        public Post GetPostById(Guid postId) => PostDAO.Instance.GetPostById(postId);
        public void DeletePostById(Guid postId) => PostDAO.Instance.DeletePostById(postId);
        public void CreatePost(Post post) => PostDAO.Instance.CreatePost(post);
    }
}
