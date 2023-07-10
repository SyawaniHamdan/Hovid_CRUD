SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF OBJECT_ID('dbo.tbUser', 'U') IS NOT NULL 
  DROP TABLE dbo.tbUser; 

CREATE TABLE [dbo].[tbUser](
	[UserID] [BIGINT] IDENTITY(1,1) NOT NULL,
	[UserName] [VARCHAR](20) NOT NULL,
	[UserNo ] [INT] NOT NULL,
	[CreateDate] [DateTime] DEFAULT GETDATE() NOT NULL
 CONSTRAINT [PK_tbUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


 