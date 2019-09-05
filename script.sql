IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE TABLE [Employees] (
        [Id] int NOT NULL IDENTITY,
        [FirstName] nvarchar(max) NULL,
        [LastName] nvarchar(max) NULL,
        [Login] nvarchar(max) NULL,
        [Password] nvarchar(max) NULL,
        [InitialCongeSolde] int NOT NULL,
        [RemainingCongeSolde] int NOT NULL,
        CONSTRAINT [PK_Employees] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE TABLE [Conges] (
        [Id] int NOT NULL IDENTITY,
        [Motif] nvarchar(max) NULL,
        [end_Date] datetime2 NOT NULL,
        [start_Date] datetime2 NOT NULL,
        [Reason] int NOT NULL,
        [CongeState] int NOT NULL,
        [Half_Day] int NOT NULL,
        [EmployeeId] int NOT NULL,
        CONSTRAINT [PK_Conges] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Conges_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employees] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE TABLE [Sorties] (
        [Id] int NOT NULL IDENTITY,
        [SortieTime] int NOT NULL,
        [Sortie_Date] datetime2 NOT NULL,
        [Motif] nvarchar(max) NULL,
        [Recovery_Date] datetime2 NOT NULL,
        [SortieState] int NOT NULL,
        [EmployeeId] int NOT NULL,
        CONSTRAINT [PK_Sorties] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Sorties_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employees] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE TABLE [Teams] (
        [Id] int NOT NULL IDENTITY,
        [ManagerId] int NOT NULL,
        CONSTRAINT [PK_Teams] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Teams_Employees_ManagerId] FOREIGN KEY ([ManagerId]) REFERENCES [Employees] ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE TABLE [TeamEmployees] (
        [TeamId] int NOT NULL,
        [EmployeeId] int NOT NULL,
        [Id] int NOT NULL,
        CONSTRAINT [PK_TeamEmployees] PRIMARY KEY ([EmployeeId], [TeamId]),
        CONSTRAINT [AK_TeamEmployees_Id] UNIQUE ([Id]),
        CONSTRAINT [FK_TeamEmployees_Employees_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [Employees] ([Id]),
        CONSTRAINT [FK_TeamEmployees_Teams_TeamId] FOREIGN KEY ([TeamId]) REFERENCES [Teams] ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FirstName', N'InitialCongeSolde', N'LastName', N'Login', N'Password', N'RemainingCongeSolde') AND [object_id] = OBJECT_ID(N'[Employees]'))
        SET IDENTITY_INSERT [Employees] ON;
    INSERT INTO [Employees] ([Id], [FirstName], [InitialCongeSolde], [LastName], [Login], [Password], [RemainingCongeSolde])
    VALUES (1, N'Tarek', 31, N'ElGhali', N'Tarek.ElGhali', N'azerty', 29),
    (2, N'Sameh', 25, N'Ouederni', N'Sameh.Ouederni', N'123aze', 25),
    (3, N'Test', 21, N'testing', N'test', N'admin', 21),
    (4, N'Mahdi', 21, N'Turki', N'Mahdi.Turki', N'123', 18),
    (5, N'5555', 21, N'testing', N'test', N'admin', 21),
    (6, N'6666', 21, N'testing', N'test', N'admin', 21),
    (7, N'7777', 21, N'testing', N'test', N'admin', 21);
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FirstName', N'InitialCongeSolde', N'LastName', N'Login', N'Password', N'RemainingCongeSolde') AND [object_id] = OBJECT_ID(N'[Employees]'))
        SET IDENTITY_INSERT [Employees] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CongeState', N'end_Date', N'start_Date', N'EmployeeId', N'Half_Day', N'Motif', N'Reason') AND [object_id] = OBJECT_ID(N'[Conges]'))
        SET IDENTITY_INSERT [Conges] ON;
    INSERT INTO [Conges] ([Id], [CongeState], [end_Date], [start_Date], [EmployeeId], [Half_Day], [Motif], [Reason])
    VALUES (1, 2, '2019-10-11T00:00:00.0000000', '2019-10-10T00:00:00.0000000', 1, 0, N'Sickness', 0),
    (2, 0, '2019-09-01T00:00:00.0000000', '2018-08-25T00:00:00.0000000', 3, 0, N'Pregnancy', 2);
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CongeState', N'end_Date', N'start_Date', N'EmployeeId', N'Half_Day', N'Motif', N'Reason') AND [object_id] = OBJECT_ID(N'[Conges]'))
        SET IDENTITY_INSERT [Conges] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'EmployeeId', N'Motif', N'SortieState', N'SortieTime', N'Recovery_Date', N'Sortie_Date') AND [object_id] = OBJECT_ID(N'[Sorties]'))
        SET IDENTITY_INSERT [Sorties] ON;
    INSERT INTO [Sorties] ([Id], [EmployeeId], [Motif], [SortieState], [SortieTime], [Recovery_Date], [Sortie_Date])
    VALUES (3, 1, N'personnel', 1, 2, '0001-01-01T00:00:00.0000000', '0001-01-01T00:00:00.0000000'),
    (2, 3, N'personnel', 1, 0, '0001-01-01T00:00:00.0000000', '0001-01-01T00:00:00.0000000'),
    (1, 5, N'personnel', 1, 3, '0001-01-01T00:00:00.0000000', '0001-01-01T00:00:00.0000000');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'EmployeeId', N'Motif', N'SortieState', N'SortieTime', N'Recovery_Date', N'Sortie_Date') AND [object_id] = OBJECT_ID(N'[Sorties]'))
        SET IDENTITY_INSERT [Sorties] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ManagerId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] ON;
    INSERT INTO [Teams] ([Id], [ManagerId])
    VALUES (1, 1),
    (2, 2);
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ManagerId') AND [object_id] = OBJECT_ID(N'[Teams]'))
        SET IDENTITY_INSERT [Teams] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'EmployeeId', N'TeamId', N'Id') AND [object_id] = OBJECT_ID(N'[TeamEmployees]'))
        SET IDENTITY_INSERT [TeamEmployees] ON;
    INSERT INTO [TeamEmployees] ([EmployeeId], [TeamId], [Id])
    VALUES (3, 1, 1),
    (4, 1, 2),
    (5, 1, 3),
    (1, 2, 4);
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'EmployeeId', N'TeamId', N'Id') AND [object_id] = OBJECT_ID(N'[TeamEmployees]'))
        SET IDENTITY_INSERT [TeamEmployees] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE INDEX [IX_Conges_EmployeeId] ON [Conges] ([EmployeeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE INDEX [IX_Sorties_EmployeeId] ON [Sorties] ([EmployeeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE INDEX [IX_TeamEmployees_TeamId] ON [TeamEmployees] ([TeamId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    CREATE INDEX [IX_Teams_ManagerId] ON [Teams] ([ManagerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190731183451_init')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190731183451_init', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802113224_init111')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190802113224_init111', N'2.2.6-servicing-10079');
END;

GO

