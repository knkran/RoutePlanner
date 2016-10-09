
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/08/2016 21:39:17
-- Generated from EDMX file: C:\Users\KSA\Desktop\RoutePlanner\RoutePlanner\RoutePlanner\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [RoutePlanner];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'NodeSet'
CREATE TABLE [dbo].[NodeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [label] nvarchar(max)  NULL,
    [type] nvarchar(max)  NULL,
    [MapId] int  NOT NULL
);
GO

-- Creating table 'EdgeSet'
CREATE TABLE [dbo].[EdgeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [cost] nvarchar(max)  NULL,
    [type] nvarchar(max)  NULL
);
GO

-- Creating table 'MapSet'
CREATE TABLE [dbo].[MapSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'NodeEdge'
CREATE TABLE [dbo].[NodeEdge] (
    [Node_Id] int  NOT NULL,
    [NodeEdge_Node_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'NodeSet'
ALTER TABLE [dbo].[NodeSet]
ADD CONSTRAINT [PK_NodeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EdgeSet'
ALTER TABLE [dbo].[EdgeSet]
ADD CONSTRAINT [PK_EdgeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MapSet'
ALTER TABLE [dbo].[MapSet]
ADD CONSTRAINT [PK_MapSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Node_Id], [NodeEdge_Node_Id] in table 'NodeEdge'
ALTER TABLE [dbo].[NodeEdge]
ADD CONSTRAINT [PK_NodeEdge]
    PRIMARY KEY CLUSTERED ([Node_Id], [NodeEdge_Node_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Node_Id] in table 'NodeEdge'
ALTER TABLE [dbo].[NodeEdge]
ADD CONSTRAINT [FK_NodeEdge_Node]
    FOREIGN KEY ([Node_Id])
    REFERENCES [dbo].[NodeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [NodeEdge_Node_Id] in table 'NodeEdge'
ALTER TABLE [dbo].[NodeEdge]
ADD CONSTRAINT [FK_NodeEdge_Edge]
    FOREIGN KEY ([NodeEdge_Node_Id])
    REFERENCES [dbo].[EdgeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NodeEdge_Edge'
CREATE INDEX [IX_FK_NodeEdge_Edge]
ON [dbo].[NodeEdge]
    ([NodeEdge_Node_Id]);
GO

-- Creating foreign key on [MapId] in table 'NodeSet'
ALTER TABLE [dbo].[NodeSet]
ADD CONSTRAINT [FK_Contains]
    FOREIGN KEY ([MapId])
    REFERENCES [dbo].[MapSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Contains'
CREATE INDEX [IX_FK_Contains]
ON [dbo].[NodeSet]
    ([MapId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------