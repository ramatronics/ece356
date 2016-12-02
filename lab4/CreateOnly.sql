-- SQL Dump of lahman2014_beta.mdb
-- generated by MDB Viewer 2.2.5
-- optimized for MySQL

SET NAMES 'UTF8';

DROP TABLE IF EXISTS `Appearances`;
DROP TABLE IF EXISTS `AllstarFull`;
DROP TABLE IF EXISTS `AwardsManagers`;
DROP TABLE IF EXISTS `AwardsPlayers`;
DROP TABLE IF EXISTS `AwardsShareManagers`;
DROP TABLE IF EXISTS `AwardsSharePlayers`;
DROP TABLE IF EXISTS `Batting`;
DROP TABLE IF EXISTS `BattingPost`;
DROP TABLE IF EXISTS `CollegePlaying`;
DROP TABLE IF EXISTS `Fielding`;
DROP TABLE IF EXISTS `FieldingOF`;
DROP TABLE IF EXISTS `FieldingPost`;
DROP TABLE IF EXISTS `Managers`;
DROP TABLE IF EXISTS `ManagersHalf`;
DROP TABLE IF EXISTS `Pitching`;
DROP TABLE IF EXISTS `HallOfFame`;
DROP TABLE IF EXISTS `PitchingPost`;
DROP TABLE IF EXISTS `Salaries`;
DROP TABLE IF EXISTS `SeriesPost`;
DROP TABLE IF EXISTS `TeamsFranchises`;
DROP TABLE IF EXISTS `TeamsHalf`;
DROP TABLE IF EXISTS `Master`;
DROP TABLE IF EXISTS `Teams`;
DROP TABLE IF EXISTS `Schools`;

CREATE TABLE `Master` (
    `playerID` VARCHAR(10) NOT NULL UNIQUE,
    `birthYear` INTEGER,
    `birthMonth` INTEGER,
    `birthDay` INTEGER,
    `birthCountry` VARCHAR(50),
    `birthState` VARCHAR(2),
    `birthCity` VARCHAR(50),
    `deathYear` INTEGER,
    `deathMonth` INTEGER,
    `deathDay` INTEGER,
    `deathCountry` VARCHAR(50),
    `deathState` VARCHAR(2),
    `deathCity` VARCHAR(50),
    `nameFirst` VARCHAR(50),
    `nameLast` VARCHAR(50),
    `nameGiven` VARCHAR(255),
    `weight` INTEGER,
    `height` DOUBLE,
    `bats` VARCHAR(1),
    `throws` VARCHAR(1),
    `debut` DATETIME,
    `finalGame` DATETIME,
    `retroID` VARCHAR(9),
    `bbrefID` VARCHAR(9),
    PRIMARY KEY (`playerID`)
) CHARACTER SET 'UTF8';



CREATE TABLE `Teams` (
    `yearID` INTEGER NOT NULL,
    `lgID` VARCHAR(2) NOT NULL,
    `teamID` VARCHAR(3) NOT NULL,
    `franchID` VARCHAR(3) NOT NULL,
    `divID` VARCHAR(1) NOT NULL,
    `Rank` INTEGER,
    `G` INTEGER,
    `Ghome` INTEGER,
    `W` INTEGER,
    `L` INTEGER,
    `DivWin` VARCHAR(1),
    `WCWin` VARCHAR(1),
    `LgWin` VARCHAR(1),
    `WSWin` VARCHAR(1),
    `R` INTEGER,
    `AB` INTEGER,
    `H` INTEGER,
    `2B` INTEGER,
    `3B` INTEGER,
    `HR` INTEGER,
    `BB` INTEGER,
    `SO` INTEGER,
    `SB` INTEGER,
    `CS` INTEGER,
    `HBP` INTEGER,
    `SF` INTEGER,
    `RA` INTEGER,
    `ER` INTEGER,
    `ERA` DOUBLE,
    `CG` INTEGER,
    `SHO` INTEGER,
    `SV` INTEGER,
    `IPouts` INTEGER,
    `HA` INTEGER,
    `HRA` INTEGER,
    `BBA` INTEGER,
    `SOA` INTEGER,
    `E` INTEGER,
    `DP` INTEGER,
    `FP` DOUBLE,
    `name` VARCHAR(50),
    `park` VARCHAR(255),
    `attendance` INTEGER,
    `BPF` INTEGER,
    `PPF` INTEGER,
    `teamIDBR` VARCHAR(3),
    `teamIDlahman45` VARCHAR(3),
    `teamIDretro` VARCHAR(3),
    PRIMARY KEY ( `yearID`, `lgID`, `teamID`, `divID`, `franchID` ),
    KEY(yearID),
    KEY(lgID),
    KEY(teamID),
    KEY(divID),
    KEY(franchID)
) CHARACTER SET 'UTF8';



CREATE TABLE `Schools` (
    `schoolID` VARCHAR(15) NOT NULL UNIQUE,
    `name_full` VARCHAR(255),
    `city` VARCHAR(55),
    `state` VARCHAR(55),
    `country` VARCHAR(55),
    PRIMARY KEY (`schoolID`)
) CHARACTER SET 'UTF8';





CREATE TABLE `AllstarFull` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `gameNum` INTEGER NOT NULL,
    `gameID` VARCHAR(12),
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `GP` INTEGER,
    `startingPos` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `gameNum` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY (`teamID`) references Teams(`teamID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `Appearances` (
    `yearID` INTEGER NOT NULL,
    `teamID` VARCHAR(3) NOT NULL,
    `lgID` VARCHAR(2),
    `playerID` VARCHAR(10) NOT NULL,
    `G_all` INTEGER,
    `GS` INTEGER,
    `G_batting` INTEGER,
    `G_defense` INTEGER,
    `G_p` INTEGER,
    `G_c` INTEGER,
    `G_1b` INTEGER,
    `G_2b` INTEGER,
    `G_3b` INTEGER,
    `G_ss` INTEGER,
    `G_lf` INTEGER,
    `G_cf` INTEGER,
    `G_rf` INTEGER,
    `G_of` INTEGER,
    `G_dh` INTEGER,
    `G_ph` INTEGER,
    `G_pr` INTEGER,
    PRIMARY KEY ( `yearID`, `teamID`, `playerID` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY (`teamID`) references Teams(`teamID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
    
) CHARACTER SET 'UTF8';




CREATE TABLE `AwardsManagers` (
    `playerID` VARCHAR(10) NOT NULL,
    `awardID` VARCHAR(75) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `lgID` VARCHAR(2) NOT NULL,
    `tie` VARCHAR(1),
    `notes` VARCHAR(100),
    PRIMARY KEY ( `yearID`, `awardID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY (`lgID`) references Teams(`lgID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';



CREATE TABLE `AwardsPlayers` (
    `playerID` VARCHAR(10) NOT NULL,
    `awardID` VARCHAR(255) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `lgID` VARCHAR(2) NOT NULL,
    `tie` VARCHAR(1),
    `notes` VARCHAR(100),
    PRIMARY KEY ( `yearID`, `awardID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`lgID`) references Teams(`lgID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `AwardsShareManagers` (
    `awardID` VARCHAR(25) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `lgID` VARCHAR(2) NOT NULL,
    `playerID` VARCHAR(10) NOT NULL,
    `pointsWon` INTEGER,
    `pointsMax` INTEGER,
    `votesFirst` INTEGER,
    PRIMARY KEY ( `awardID`, `yearID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`lgID`) references Teams(`lgID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `AwardsSharePlayers` (
    `awardID` VARCHAR(25) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `lgID` VARCHAR(2) NOT NULL,
    `playerID` VARCHAR(10) NOT NULL,
    `pointsWon` DOUBLE,
    `pointsMax` INTEGER,
    `votesFirst` DOUBLE,
    PRIMARY KEY ( `awardID`, `yearID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`lgID`) references Teams(`lgID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `Batting` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `stint` INTEGER NOT NULL,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `G` INTEGER,
    `G_batting` INTEGER,
    `AB` INTEGER,
    `R` INTEGER,
    `H` INTEGER,
    `2B` INTEGER,
    `3B` INTEGER,
    `HR` INTEGER,
    `RBI` INTEGER,
    `SB` INTEGER,
    `CS` INTEGER,
    `BB` INTEGER,
    `SO` INTEGER,
    `IBB` INTEGER,
    `HBP` INTEGER,
    `SH` INTEGER,
    `SF` INTEGER,
    `GIDP` INTEGER,
    `G_old` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `stint` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';



CREATE TABLE `BattingPost` (
    `yearID` INTEGER NOT NULL,
    `round` VARCHAR(10) NOT NULL,
    `playerID` VARCHAR(10) NOT NULL,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `G` INTEGER,
    `AB` INTEGER,
    `R` INTEGER,
    `H` INTEGER,
    `2B` INTEGER,
    `3B` INTEGER,
    `HR` INTEGER,
    `RBI` INTEGER,
    `SB` INTEGER,
    `CS` INTEGER,
    `BB` INTEGER,
    `SO` INTEGER,
    `IBB` INTEGER,
    `HBP` INTEGER,
    `SH` INTEGER,
    `SF` INTEGER,
    `GIDP` INTEGER,
    PRIMARY KEY ( `yearID`, `round`, `playerID` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `CollegePlaying` (
    `playerID` VARCHAR(10) NOT NULL,
    `schoolID` VARCHAR(15) NOT NULL,
    `yearID` INTEGER NOT NULL,
    PRIMARY KEY (`playerID`,`schoolID`,`yearID`),
    FOREIGN KEY (`schoolID`) references Schools(`schoolID`) ON DELETE CASCADE,
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';

CREATE TABLE `Fielding` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `stint` INTEGER NOT NULL,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `POS` VARCHAR(2) NOT NULL,
    `G` INTEGER,
    `GS` INTEGER,
    `InnOuts` INTEGER,
    `PO` INTEGER,
    `A` INTEGER,
    `E` INTEGER,
    `DP` INTEGER,
    `PB` INTEGER,
    `WP` INTEGER,
    `SB` INTEGER,
    `CS` INTEGER,
    `ZR` DOUBLE,
    PRIMARY KEY ( `playerID`, `yearID`, `stint`, `POS` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `FieldingOF` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER,
    `stint` INTEGER,
    `Glf` INTEGER,
    `Gcf` INTEGER,
    `Grf` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `stint` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';



CREATE TABLE `FieldingPost` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `round` VARCHAR(10) NOT NULL,
    `POS` VARCHAR(2) NOT NULL,
    `G` INTEGER,
    `GS` INTEGER,
    `InnOuts` INTEGER,
    `PO` INTEGER,
    `A` INTEGER,
    `E` INTEGER,
    `DP` INTEGER,
    `TP` INTEGER,
    `PB` INTEGER,
    `SB` INTEGER,
    `CS` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `round`, `POS` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';


CREATE TABLE `HallOfFame` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearid` INTEGER NOT NULL,
    `votedBy` VARCHAR(64) NOT NULL,
    `ballots` INTEGER,
    `needed` INTEGER,
    `votes` INTEGER,
    `inducted` VARCHAR(1),
    `category` VARCHAR(20),
    `needed_note` VARCHAR(25),
    PRIMARY KEY ( `playerID`, `yearid`, `votedBy` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';



CREATE TABLE `Managers` (
    `playerID` VARCHAR(10),
    `yearID` INTEGER NOT NULL,
    `teamID` VARCHAR(3) NOT NULL,
    `lgID` VARCHAR(2),
    `inseason` INTEGER NOT NULL,
    `G` INTEGER,
    `W` INTEGER,
    `L` INTEGER,
    `rank` INTEGER,
    `plyrMgr` VARCHAR(1),
    PRIMARY KEY ( `yearID`, `teamID`, `inseason` ),
    FOREIGN KEY (`teamID`) references Teams(`teamID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `ManagersHalf` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `teamID` VARCHAR(3) NOT NULL,
    `lgID` VARCHAR(2),
    `inseason` INTEGER,
    `half` INTEGER NOT NULL,
    `G` INTEGER,
    `W` INTEGER,
    `L` INTEGER,
    `rank` INTEGER,
    PRIMARY KEY ( `yearID`, `teamID`, `playerID`, `half` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY (`teamID`) references Teams(`teamID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';





CREATE TABLE `Pitching` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `stint` INTEGER NOT NULL,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `W` INTEGER,
    `L` INTEGER,
    `G` INTEGER,
    `GS` INTEGER,
    `CG` INTEGER,
    `SHO` INTEGER,
    `SV` INTEGER,
    `IPouts` INTEGER,
    `H` INTEGER,
    `ER` INTEGER,
    `HR` INTEGER,
    `BB` INTEGER,
    `SO` INTEGER,
    `BAOpp` DOUBLE,
    `ERA` DOUBLE,
    `IBB` INTEGER,
    `WP` INTEGER,
    `HBP` INTEGER,
    `BK` INTEGER,
    `BFP` INTEGER,
    `GF` INTEGER,
    `R` INTEGER,
    `SH` INTEGER,
    `SF` INTEGER,
    `GIDP` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `stint` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references `Teams`(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';




CREATE TABLE `PitchingPost` (
    `playerID` VARCHAR(10) NOT NULL,
    `yearID` INTEGER NOT NULL,
    `round` VARCHAR(10) NOT NULL,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `W` INTEGER,
    `L` INTEGER,
    `G` INTEGER,
    `GS` INTEGER,
    `CG` INTEGER,
    `SHO` INTEGER,
    `SV` INTEGER,
    `IPouts` INTEGER,
    `H` INTEGER,
    `ER` INTEGER,
    `HR` INTEGER,
    `BB` INTEGER,
    `SO` INTEGER,
    `BAOpp` DOUBLE,
    `ERA` DOUBLE,
    `IBB` INTEGER,
    `WP` INTEGER,
    `HBP` INTEGER,
    `BK` INTEGER,
    `BFP` INTEGER,
    `GF` INTEGER,
    `R` INTEGER,
    `SH` INTEGER,
    `SF` INTEGER,
    `GIDP` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `round` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';


CREATE TABLE `Salaries` (
    `yearID` INTEGER NOT NULL,
    `teamID` VARCHAR(3) NOT NULL,
    `lgID` VARCHAR(2) NOT NULL,
    `playerID` VARCHAR(10) NOT NULL,
    `salary` DOUBLE,
    PRIMARY KEY ( `yearID`, `teamID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) references Master(`playerID`) ON DELETE CASCADE,
    FOREIGN KEY (`teamID`) references Teams(`teamID`) ON DELETE CASCADE,
    FOREIGN KEY(`lgID`) references Teams(`lgID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';





CREATE TABLE `SeriesPost` (
    `yearID` INTEGER NOT NULL,
    `round` VARCHAR(5) NOT NULL,
    `teamIDwinner` VARCHAR(3),
    `lgIDwinner` VARCHAR(2),
    `teamIDloser` VARCHAR(3),
    `lgIDloser` VARCHAR(2),
    `wins` INTEGER,
    `losses` INTEGER,
    `ties` INTEGER,
    PRIMARY KEY ( `yearID`, `round` ),
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';



CREATE TABLE `TeamsFranchises` (
    `franchID` VARCHAR(3) NOT NULL,
    `franchName` VARCHAR(50),
    `active` VARCHAR(2),
    `NAassoc` VARCHAR(3),
    PRIMARY KEY (`franchID`)
) CHARACTER SET 'UTF8';



CREATE TABLE `TeamsHalf` (
    `yearID` INTEGER NOT NULL,
    `lgID` VARCHAR(2) NOT NULL,
    `teamID` VARCHAR(3)NOT NULL,
    `Half` VARCHAR(1) NOT NULL,
    `divID` VARCHAR(1),
    `DivWin` VARCHAR(1),
    `Rank` INTEGER,
    `G` INTEGER,
    `W` INTEGER,
    `L` INTEGER,
    PRIMARY KEY ( `yearID`, `teamID`, `lgID`, `Half` ),
    FOREIGN KEY (`teamID`) references Teams(`teamID`) ON DELETE CASCADE,
    FOREIGN KEY(`lgID`) references Teams(`lgID`) ON DELETE CASCADE,
    FOREIGN KEY(`yearID`) references Teams(`yearID`) ON DELETE CASCADE
) CHARACTER SET 'UTF8';