using LibraryWeb.DataAccess;
using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DataAccess
{
    internal class PostTypeDAO
    {
        department_dbContext _dbContext;

        public PostTypeDAO()
        {
            _dbContext = new department_dbContext();
        }

        public IEnumerable<PostType> GetPostTypes() => _dbContext.PostTypes.ToList();

        public PostType GetPostTypeById(Guid postTypeId) => _dbContext.PostTypes.FirstOrDefault(pstype => pstype.PostTypeId.Equals(postTypeId));

        public void DeletePostTypeById(Guid postTypeId)
        {
            PostType postType = _dbContext.PostTypes.FirstOrDefault(pstype => pstype.PostTypeId.Equals(postTypeId));
            postType.Status = 0;

            _dbContext.SaveChanges();
        }
        public void CreatePostType(PostType postType)
        {
            _dbContext.PostTypes.Add(postType);
            _dbContext.SaveChanges();
        }
    }
}
