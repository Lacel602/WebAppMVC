using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace APIController.Models;

public partial class Prn231ProjectContext : DbContext
{
    public Prn231ProjectContext()
    {
    }

    public Prn231ProjectContext(DbContextOptions<Prn231ProjectContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Campus> Campuses { get; set; }

    public virtual DbSet<Class> Classes { get; set; }

    public virtual DbSet<Course> Courses { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Room> Rooms { get; set; }

    public virtual DbSet<Slot> Slots { get; set; }

    public virtual DbSet<SlotTime> SlotTimes { get; set; }

    public virtual DbSet<Testing> Testings { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server = LAPTOP-96DKEJT4; database = PRN231_Project;uid=sa;pwd=123; TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Campus>(entity =>
        {
            entity.ToTable("Campus");

            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Class>(entity =>
        {
            entity.ToTable("Class");

            entity.Property(e => e.Code)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasMany(d => d.Students).WithMany(p => p.Classes)
                .UsingEntity<Dictionary<string, object>>(
                    "ClassStudent",
                    r => r.HasOne<User>().WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_ClassStudent_User"),
                    l => l.HasOne<Class>().WithMany()
                        .HasForeignKey("ClassId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_ClassStudent_Class"),
                    j =>
                    {
                        j.HasKey("ClassId", "StudentId");
                        j.ToTable("ClassStudent");
                    });
        });

        modelBuilder.Entity<Course>(entity =>
        {
            entity.ToTable("Course");

            entity.Property(e => e.Code)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.Name).HasMaxLength(50);

            entity.HasMany(d => d.Teachers).WithMany(p => p.Courses)
                .UsingEntity<Dictionary<string, object>>(
                    "CourseTeacher",
                    r => r.HasOne<User>().WithMany()
                        .HasForeignKey("TeacherId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_CourseTeacher_User"),
                    l => l.HasOne<Course>().WithMany()
                        .HasForeignKey("CourseId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_CourseTeacher_Course"),
                    j =>
                    {
                        j.HasKey("CourseId", "TeacherId");
                        j.ToTable("CourseTeacher");
                    });
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Role");

            entity.Property(e => e.Type).HasMaxLength(50);
        });

        modelBuilder.Entity<Room>(entity =>
        {
            entity.ToTable("Room");

            entity.Property(e => e.Name)
                .HasMaxLength(10)
                .IsFixedLength();
        });

        modelBuilder.Entity<Slot>(entity =>
        {
            entity.ToTable("Slot");

            entity.Property(e => e.EduNext).HasMaxLength(50);
            entity.Property(e => e.MeetUrl)
                .HasMaxLength(50)
                .HasColumnName("MeetURL");
            entity.Property(e => e.ValiCode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Week).HasColumnType("date");

            entity.HasOne(d => d.Class).WithMany(p => p.Slots)
                .HasForeignKey(d => d.ClassId)
                .HasConstraintName("FK_Slot_Class");

            entity.HasOne(d => d.Course).WithMany(p => p.Slots)
                .HasForeignKey(d => d.CourseId)
                .HasConstraintName("FK_Slot_Course");

            entity.HasOne(d => d.Room).WithMany(p => p.Slots)
                .HasForeignKey(d => d.RoomId)
                .HasConstraintName("FK_Slot_Room");

            entity.HasOne(d => d.Teacher).WithMany(p => p.Slots)
                .HasForeignKey(d => d.TeacherId)
                .HasConstraintName("FK_Slot_User");

            entity.HasOne(d => d.Time).WithMany(p => p.Slots)
                .HasForeignKey(d => d.TimeId)
                .HasConstraintName("FK_Slot_SlotTime");
        });

        modelBuilder.Entity<SlotTime>(entity =>
        {
            entity.ToTable("SlotTime");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.EndTime).HasPrecision(0);
            entity.Property(e => e.StartTime).HasPrecision(0);
        });

        modelBuilder.Entity<Testing>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("Testing");

            entity.Property(e => e.Code)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Uid);

            entity.ToTable("User");

            entity.Property(e => e.Code)
                .HasMaxLength(30)
                .IsFixedLength();
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.FullName).HasMaxLength(50);
            entity.Property(e => e.Password)
                .HasMaxLength(16)
                .IsFixedLength();
            entity.Property(e => e.Phone)
                .HasMaxLength(10)
                .IsFixedLength();

            entity.HasOne(d => d.Campus).WithMany(p => p.Users)
                .HasForeignKey(d => d.CampusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User_Campus");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User_Role");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
