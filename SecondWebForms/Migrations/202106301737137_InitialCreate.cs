namespace SecondWebForms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Colors",
                c => new
                    {
                        Color_Id = c.Int(nullable: false, identity: true),
                        Color_Name = c.String(),
                        Color_Hex = c.String(),
                    })
                .PrimaryKey(t => t.Color_Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Colors");
        }
    }
}
