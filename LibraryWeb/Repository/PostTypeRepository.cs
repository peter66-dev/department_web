using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public class PostTypeRepository : IPostTypeRepository
    {
        public IEnumerable<PostType> GetPostTypes() => PostTypeDAO.Instance.GetPostTypes();
        public PostType GetPostTypeById(Guid postTypeId) => PostTypeDAO.Instance.GetPostTypeById(postTypeId);
        public void DeletePostTypeById(Guid postTypeId) => PostTypeDAO.Instance.DeletePostTypeById(postTypeId);
        public void CreatePostType(PostType postType) => PostTypeDAO.Instance.CreatePostType(postType);
    }
}
