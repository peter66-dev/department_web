using LibraryWeb.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public interface IPostRepository
    {
        bool CreatePost(Guid userid, string roleName, Guid grouppostid,
            string title, string tags, string content);

        void DeletePostById(Guid postId);

        Post GetPostById(Guid postId);

        IEnumerable<Post> GetPosts();

        int IncreaseLikesTotal(Guid postid);

        int DecreaseLikesTotal(Guid postid);

        int IncreaseCommentsTotal(Guid postid);

        Task<List<Post>> SearchStringPostsByUserLogined(Guid userid, string searchString);

        Task<List<Post>> GetPostsForUserLogined(Guid userid);

        Task<List<Post>> SearchTagsPostsByUserLogined(Guid userid, string searchTags);

        Task<List<Post>> GetPostsInUserDetailsWithoutLogin(Guid userDetailId);

        Task<IEnumerable<Post>> GetPostByGroupIdAndUserPostId(Guid groupId, Guid userPostId);

        Task<IEnumerable<Post>> GetPostsByGroupId(Guid groupId);

        Task<IEnumerable<Post>> GetPostsForManagerApprove(Guid managerId);

        bool ApprovePost(Guid postid);

        bool RejectPost(Guid postid, string reason);

    }
}