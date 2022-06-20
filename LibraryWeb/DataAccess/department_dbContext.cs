using LibraryWeb.Model;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace LibraryWeb.DataAccess
{
    public partial class department_dbContext : DbContext
    {
        public department_dbContext()
        {
        }

        public department_dbContext(DbContextOptions<department_dbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<CommentReply> CommentReplies { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<GroupUser> GroupUsers { get; set; }
        public virtual DbSet<Like> Likes { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<PostType> PostTypes { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Status> Statuses { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.;Database=department_db;Uid=sa;Pwd=Vvp06062001-;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.Property(e => e.CommentId)
                    .ValueGeneratedNever()
                    .HasColumnName("CommentID");

                entity.Property(e => e.CommentContent).IsRequired();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.PostId).HasColumnName("PostID");

                entity.Property(e => e.UserCommentId).HasColumnName("UserCommentID");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblComment_tblPost");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblComment_tblStatus");

                entity.HasOne(d => d.UserComment)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.UserCommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblComment_tblUser");
            });

            modelBuilder.Entity<CommentReply>(entity =>
            {
                entity.Property(e => e.CommentReplyId)
                    .ValueGeneratedNever()
                    .HasColumnName("CommentReplyID");

                entity.Property(e => e.CommentId).HasColumnName("CommentID");

                entity.Property(e => e.CommentReplyContent).IsRequired();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.UserReplyId).HasColumnName("UserReplyID");

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.CommentReplies)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblCommentReply_tblComment");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.CommentReplies)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblCommentReply_tblStatus");

                entity.HasOne(d => d.UserReply)
                    .WithMany(p => p.CommentReplies)
                    .HasForeignKey(d => d.UserReplyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblCommentReply_tblUser");
            });

            modelBuilder.Entity<Group>(entity =>
            {
                entity.Property(e => e.GroupId)
                    .ValueGeneratedNever()
                    .HasColumnName("GroupID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.GroupDescription)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.GroupName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.Groups)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblGroup_tblStatus");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Groups)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblGroup_tblUser");
            });

            modelBuilder.Entity<GroupUser>(entity =>
            {
                entity.Property(e => e.GroupUserId)
                    .ValueGeneratedNever()
                    .HasColumnName("GroupUserID");

                entity.Property(e => e.GroupId).HasColumnName("GroupID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.GroupUsers)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblGroupUser_tblStatus");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.GroupUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblGroupUser_tblUser");
            });

            modelBuilder.Entity<Like>(entity =>
            {
                entity.Property(e => e.LikeId)
                    .ValueGeneratedNever()
                    .HasColumnName("LikeID");

                entity.Property(e => e.PostId).HasColumnName("PostID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.Likes)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblLike_tblPost");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.Likes)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblLike_tblStatus");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Likes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblLike_tblUser");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.Property(e => e.PostId)
                    .ValueGeneratedNever()
                    .HasColumnName("PostID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.GroupPostId).HasColumnName("GroupPostID");

                entity.Property(e => e.LastModified).HasColumnType("datetime");

                entity.Property(e => e.PostContent).IsRequired();

                entity.Property(e => e.PostTypeId).HasColumnName("PostTypeID");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.UserPostId).HasColumnName("UserPostID");

                entity.HasOne(d => d.GroupPost)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.GroupPostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblPost_tblGroup");

                entity.HasOne(d => d.PostType)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.PostTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblPost_tblPostType");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.Status)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblPost_tblStatus");

                entity.HasOne(d => d.UserPost)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.UserPostId)
                    .HasConstraintName("FK_tblPost_tblUser");
            });

            modelBuilder.Entity<PostType>(entity =>
            {
                entity.Property(e => e.PostTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("PostTypeID");

                entity.Property(e => e.PostTypeName)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.PostTypes)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblPostType_tblStatus");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId)
                    .ValueGeneratedNever()
                    .HasColumnName("RoleID");

                entity.Property(e => e.RoleName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.Roles)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblRole_tblStatus");
            });

            modelBuilder.Entity<Status>(entity =>
            {
                entity.ToTable("Status");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusID");

                entity.Property(e => e.StatusName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId)
                    .ValueGeneratedNever()
                    .HasColumnName("UserID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Avatar)
                    .IsRequired()
                    .HasMaxLength(120)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(90)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblUser_tblRole1");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblUser_tblStatus");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
