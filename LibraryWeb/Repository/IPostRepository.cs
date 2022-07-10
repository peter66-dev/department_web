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

        Task<bool> DeletePostByIdAsync(Guid postId);

        Post GetPostById(Guid postId);

        Task<IEnumerable<Post>> GetPostByUserIdAsync(Guid userid, string role);

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

        Task<IEnumerable<Post>> GetPosts();

        Task<IEnumerable<Post>> SearchTagByAdminRole(string searchTag);

        Task<IEnumerable<Post>> SearchStringByAdminRole(string searchString);

        Task<Post> GetPostByIdAsync(Guid postId);

        Task<bool> UpdatePost(Guid postid, string title, string tags, string content);

        IEnumerable<Post> GetPostByUserId(Guid userid);

        void DeleteMyPost(Guid postid);

        Task<IEnumerable<Post>> AdminSeeAllPostsUser(Guid userid);
    }
}