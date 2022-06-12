using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using MyLibrary.BusinessObject;

#nullable disable

namespace MyLibrary.DataAccess
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

        public virtual DbSet<TblComment> TblComments { get; set; }
        public virtual DbSet<TblCommentReply> TblCommentReplies { get; set; }
        public virtual DbSet<TblGroup> TblGroups { get; set; }
        public virtual DbSet<TblGroupUser> TblGroupUsers { get; set; }
        public virtual DbSet<TblLike> TblLikes { get; set; }
        public virtual DbSet<TblPost> TblPosts { get; set; }
        public virtual DbSet<TblPostType> TblPostTypes { get; set; }
        public virtual DbSet<TblRole> TblRoles { get; set; }
        public virtual DbSet<TblStatus> TblStatuses { get; set; }
        public virtual DbSet<TblUser> TblUsers { get; set; }

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

            modelBuilder.Entity<TblComment>(entity =>
            {
                entity.HasKey(e => e.CommentId);

                entity.ToTable("tblComment");

                entity.Property(e => e.CommentId)
                    .ValueGeneratedNever()
                    .HasColumnName("CommentID");

                entity.Property(e => e.CommentContent).IsRequired();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.PostId).HasColumnName("PostID");

                entity.Property(e => e.UserCommentId).HasColumnName("UserCommentID");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.TblComments)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblComment_tblPost");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblComments)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblComment_tblStatus");

                entity.HasOne(d => d.UserComment)
                    .WithMany(p => p.TblComments)
                    .HasForeignKey(d => d.UserCommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblComment_tblUser");
            });

            modelBuilder.Entity<TblCommentReply>(entity =>
            {
                entity.HasKey(e => e.CommentReplyId);

                entity.ToTable("tblCommentReply");

                entity.Property(e => e.CommentReplyId)
                    .ValueGeneratedNever()
                    .HasColumnName("CommentReplyID");

                entity.Property(e => e.CommentId).HasColumnName("CommentID");

                entity.Property(e => e.CommentReplyContent).IsRequired();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.UserReplyId).HasColumnName("UserReplyID");

                entity.HasOne(d => d.Comment)
                    .WithMany(p => p.TblCommentReplies)
                    .HasForeignKey(d => d.CommentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblCommentReply_tblComment");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblCommentReplies)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblCommentReply_tblStatus");

                entity.HasOne(d => d.UserReply)
                    .WithMany(p => p.TblCommentReplies)
                    .HasForeignKey(d => d.UserReplyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblCommentReply_tblUser");
            });

            modelBuilder.Entity<TblGroup>(entity =>
            {
                entity.HasKey(e => e.GroupId);

                entity.ToTable("tblGroup");

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
                    .WithMany(p => p.TblGroups)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblGroup_tblStatus");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.TblGroups)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblGroup_tblUser");
            });

            modelBuilder.Entity<TblGroupUser>(entity =>
            {
                entity.HasKey(e => e.GroupUserId);

                entity.ToTable("tblGroupUser");

                entity.Property(e => e.GroupUserId)
                    .ValueGeneratedNever()
                    .HasColumnName("GroupUserID");

                entity.Property(e => e.GroupId).HasColumnName("GroupID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblGroupUsers)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblGroupUser_tblStatus");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.TblGroupUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblGroupUser_tblUser");
            });

            modelBuilder.Entity<TblLike>(entity =>
            {
                entity.HasKey(e => e.LikeId);

                entity.ToTable("tblLike");

                entity.Property(e => e.LikeId)
                    .ValueGeneratedNever()
                    .HasColumnName("LikeID");

                entity.Property(e => e.PostId).HasColumnName("PostID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.TblLikes)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblLike_tblPost");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblLikes)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblLike_tblStatus");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.TblLikes)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblLike_tblUser");
            });

            modelBuilder.Entity<TblPost>(entity =>
            {
                entity.HasKey(e => e.PostId);

                entity.ToTable("tblPost");

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
                    .WithMany(p => p.TblPosts)
                    .HasForeignKey(d => d.GroupPostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblPost_tblGroup");

                entity.HasOne(d => d.PostType)
                    .WithMany(p => p.TblPosts)
                    .HasForeignKey(d => d.PostTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblPost_tblPostType");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblPosts)
                    .HasForeignKey(d => d.Status)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblPost_tblStatus");

                entity.HasOne(d => d.UserPost)
                    .WithMany(p => p.TblPosts)
                    .HasForeignKey(d => d.UserPostId)
                    .HasConstraintName("FK_tblPost_tblUser");
            });

            modelBuilder.Entity<TblPostType>(entity =>
            {
                entity.HasKey(e => e.PostTypeId);

                entity.ToTable("tblPostType");

                entity.Property(e => e.PostTypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("PostTypeID");

                entity.Property(e => e.PostTypeName)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblPostTypes)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblPostType_tblStatus");
            });

            modelBuilder.Entity<TblRole>(entity =>
            {
                entity.HasKey(e => e.RoleId);

                entity.ToTable("tblRole");

                entity.Property(e => e.RoleId)
                    .ValueGeneratedNever()
                    .HasColumnName("RoleID");

                entity.Property(e => e.RoleName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblRoles)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblRole_tblStatus");
            });

            modelBuilder.Entity<TblStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("tblStatus");

                entity.Property(e => e.StatusId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusID");

                entity.Property(e => e.StatusName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TblUser>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.ToTable("tblUser");

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
                    .WithMany(p => p.TblUsers)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tblUser_tblRole1");

                entity.HasOne(d => d.StatusNavigation)
                    .WithMany(p => p.TblUsers)
                    .HasForeignKey(d => d.Status)
                    .HasConstraintName("FK_tblUser_tblStatus");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
