using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class PostDAO
    {
        department_dbContext _dbContext;

        public PostDAO()
        {
            _dbContext = new department_dbContext();
        }

        public IEnumerable<Post> GetPosts() => _dbContext.Posts.ToList();

        public Post GetPostById(Guid postId) => _dbContext.Posts.FirstOrDefault(pst => pst.PostId.Equals(postId));

        public void DeletePostById(Guid postId)
        {
            Post post = _dbContext.Posts.FirstOrDefault(pst => pst.PostId.Equals(postId));
            post.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreatePost(Post post)
        {
            _dbContext.Posts.Add(post);
            _dbContext.SaveChanges();
        }
    }
}
