drop table Sorties;

CREATE TABLE [dbo].[Sorties] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [SortieTime]    INT            NOT NULL,
    [Sortie_Date]   DATETIME2 (7)  NOT NULL,
    [Motif]         NVARCHAR (MAX) NULL,
    [Recovery_Date] DATETIME2 (7)  NOT NULL,
    [SortieState]   INT            NOT NULL,
    [EmployeeId]    INT            NOT NULL,
    CONSTRAINT [PK_Sorties] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Sorties_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employees] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Sorties_EmployeeId]
    ON [dbo].[Sorties]([EmployeeId] ASC);

