using LibraryWeb.Model;
using MyLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LibraryWeb.Repository
{
    public class PostRepository : IPostRepository
    {
        public Post GetPostById(Guid postId)
            => PostDAO.Instance.GetPostById(postId);


        public async Task<bool> DeletePostByIdAsync(Guid postId)
            => await PostDAO.Instance.DeletePostByIdAsync(postId);
        public async Task<IEnumerable<Post>> GetPostByUserIdAsync(Guid userid, string role)
            => await PostDAO.Instance.GetPostByUserIdAsync(userid, role);

        public bool CreatePost(Guid userid, string roleName, Guid grouppostid, string title, string tags, string content)
            => PostDAO.Instance.CreatePost(userid, roleName, grouppostid, title, tags, content);

        public int DecreaseLikesTotal(Guid postid)
             => PostDAO.Instance.DecreaseLikesTotal(postid);

        public int IncreaseLikesTotal(Guid postid)
            => PostDAO.Instance.IncreaseLikesTotal(postid);

        public int IncreaseCommentsTotal(Guid postid)
            => PostDAO.Instance.IncreaseCommentsTotal(postid);

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

        public async Task<IEnumerable<Post>> GetPostsForManagerApprove(Guid managerId)
            => await PostDAO.Instance.GetPostsForManagerApprove(managerId);

        public bool ApprovePost(Guid postid)
            => PostDAO.Instance.ApprovePost(postid);
        public bool RejectPost(Guid postid, string reason)
            => PostDAO.Instance.RejectPost(postid, reason);

        public async Task<IEnumerable<Post>> GetPosts()
            => await PostDAO.Instance.GetPosts();

        public async Task<IEnumerable<Post>> SearchTagByAdminRole(string searchTag)
            => await PostDAO.Instance.SearchTagByAdminRole(searchTag);


        public async Task<IEnumerable<Post>> SearchStringByAdminRole(string searchString)
            => await PostDAO.Instance.SearchStringByAdminRole(searchString);

        public async Task<Post> GetPostByIdAsync(Guid postId)
            => await PostDAO.Instance.GetPostByIdAsync(postId);

        public async Task<bool> UpdatePost(Guid postid, string title, string tags, string content)
            => await PostDAO.Instance.UpdatePost(postid, title, tags, content);
        public IEnumerable<Post> GetPostByUserId(Guid userid)
            => PostDAO.Instance.GetPostByUserId(userid);

        public void DeleteMyPost(Guid postid)
            => PostDAO.Instance.DeleteMyPost(postid);

        public async Task<IEnumerable<Post>> AdminSeeAllPostsUser(Guid userid)
            => await PostDAO.Instance.AdminSeeAllPostsUser(userid);
    }
}
