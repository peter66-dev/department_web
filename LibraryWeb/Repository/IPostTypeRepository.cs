using LibraryWeb.Model;
using System;
using System.Collections.Generic;

namespace LibraryWeb.Repository
{
    public interface IPostTypeRepository
    {
        void CreatePostType(PostType postType);
        void DeletePostTypeById(Guid postTypeId);
        PostType GetPostTypeById(Guid postTypeId);
        IEnumerable<PostType> GetPostTypes();
    }
}