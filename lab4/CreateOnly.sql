-- SQL Dump of lahman2014_beta.mdb
-- generated by MDB Viewer 2.2.5
-- optimized for MySQL

SET NAMES 'UTF8';



DROP TABLE IF EXISTS `AllstarFull`;

CREATE TABLE `AllstarFull` (
    `playerID` VARCHAR(9),
    `yearID` INTEGER,
    `gameNum` INTEGER,
    `gameID` VARCHAR(12),
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `GP` INTEGER,
    `startingPos` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `gameNum` ),
    FOREIGN KEY ('playerID') REFERENCES Master('playerID'),
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID')
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `Appearances`;

CREATE TABLE `Appearances` (
    `yearID` INTEGER,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `playerID` VARCHAR(9),
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
    FOREIGN KEY (`playerID`) REFERENCES Master(`playerID`),
    FOREIGN KEY (`yearID`, `lgID`, `teamID`) REFERENCES Teams(`yearID`, `lgID`, `teamID`)
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `AwardsManagers`;

CREATE TABLE `AwardsManagers` (
    `playerID` VARCHAR(10),
    `awardID` VARCHAR(75),
    `yearID` INTEGER,
    `lgID` VARCHAR(2),
    `tie` VARCHAR(1),
    `notes` VARCHAR(100),
    PRIMARY KEY ( `yearID`, `awardID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) REFERENCES Master(`playerID`)

) CHARACTER SET 'UTF8';

DROP TABLE IF EXISTS `AwardsPlayers`;

CREATE TABLE `AwardsPlayers` (
    `playerID` VARCHAR(9),
    `awardID` VARCHAR(255),
    `yearID` INTEGER,
    `lgID` VARCHAR(2),
    `tie` VARCHAR(1),
    `notes` VARCHAR(100),
    PRIMARY KEY ( `yearID`, `awardID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) REFERENCES Master(`playerID`)

) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `AwardsShareManagers`;

CREATE TABLE `AwardsShareManagers` (
    `awardID` VARCHAR(25),
    `yearID` INTEGER,
    `lgID` VARCHAR(2),
    `playerID` VARCHAR(10),
    `pointsWon` INTEGER,
    `pointsMax` INTEGER,
    `votesFirst` INTEGER,
    PRIMARY KEY ( `awardID`, `yearID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) REFERENCES Master(`playerID`)

) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `AwardsSharePlayers`;

CREATE TABLE `AwardsSharePlayers` (
    `awardID` VARCHAR(25),
    `yearID` INTEGER,
    `lgID` VARCHAR(2),
    `playerID` VARCHAR(9),
    `pointsWon` DOUBLE,
    `pointsMax` INTEGER,
    `votesFirst` DOUBLE,
    PRIMARY KEY ( `awardID`, `yearID`, `lgID`, `playerID` ),    
    FOREIGN KEY (`playerID`) REFERENCES Master(`playerID`)


) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `Batting`;

CREATE TABLE `Batting` (
    `playerID` VARCHAR(9),
    `yearID` INTEGER,
    `stint` INTEGER,
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
    FOREIGN KEY Batting('playerID')  REFERENCES Master('playerID')
) CHARACTER SET 'UTF8';

DROP TABLE IF EXISTS `BattingPost`;

CREATE TABLE `BattingPost` (
    `yearID` INTEGER,
    `round` VARCHAR(10),
    `playerID` VARCHAR(9),
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
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID'),
    FOREIGN KEY ('playerID') REFERENCES Batting('playerID'),
    FOREIGN KEY ('yearID') REFERENCES Batting('yearID')
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `CollegePlaying`;

CREATE TABLE `CollegePlaying` (
    `playerID` VARCHAR(9),
    `schoolID` VARCHAR(15),
    `yearID` INTEGER,
    FOREIGN KEY (`playerID`) REFERENCES Master(`playerID`),
    FOREIGN KEY (`schoolID`) REFERENCES Schools(`schoolID`)
) CHARACTER SET 'UTF8';

DROP TABLE IF EXISTS `Fielding`;

CREATE TABLE `Fielding` (
    `playerID` VARCHAR(9),
    `yearID` INTEGER,
    `stint` INTEGER,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `POS` VARCHAR(2),
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
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID'),
    FOREIGN KEY ('playerID') REFERENCES Master('playerID')
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `FieldingOF`;

CREATE TABLE `FieldingOF` (
    `playerID` VARCHAR(9),
    `yearID` INTEGER,
    `stint` INTEGER,
    `Glf` INTEGER,
    `Gcf` INTEGER,
    `Grf` INTEGER,
    PRIMARY KEY ( `playerID`, `yearID`, `stint` ),
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID'),
    FOREIGN KEY ('playerID') REFERENCES Fielding('playerID')
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `FieldingPost`;

CREATE TABLE `FieldingPost` (
    `playerID` VARCHAR(9),
    `yearID` INTEGER,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `round` VARCHAR(10),
    `POS` VARCHAR(2),
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
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID'),
    FOREIGN KEY ('playerID') REFERENCES Fielding('playerID')
) CHARACTER SET 'UTF8';

DROP TABLE IF EXISTS `HallOfFame`;

CREATE TABLE `HallOfFame` (
    `playerID` VARCHAR(10),
    `yearid` INTEGER,
    `votedBy` VARCHAR(64),
    `ballots` INTEGER,
    `needed` INTEGER,
    `votes` INTEGER,
    `inducted` VARCHAR(1),
    `category` VARCHAR(20),
    `needed_note` VARCHAR(25),
    PRIMARY KEY ( `playerID`, `yearid`, `votedBy` ),
    FOREIGN KEY ('playerID') REFERENCES Master('playerID'),
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID')
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `Managers`;

CREATE TABLE `Managers` (
    `playerID` VARCHAR(10),
    `yearID` INTEGER,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `inseason` INTEGER,
    `G` INTEGER,
    `W` INTEGER,
    `L` INTEGER,
    `rank` INTEGER,
    `plyrMgr` VARCHAR(1),
    PRIMARY KEY ( `yearID`, `teamID`, `inseason` ),
    FOREIGN KEY ('playerID') REFERENCES Master('playerID'),
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID')
) CHARACTER SET 'UTF8';

DROP TABLE IF EXISTS `ManagersHalf`;

CREATE TABLE `ManagersHalf` (
    `playerID` VARCHAR(10),
    `yearID` INTEGER,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `inseason` INTEGER,
    `half` INTEGER,
    `G` INTEGER,
    `W` INTEGER,
    `L` INTEGER,
    `rank` INTEGER,
    PRIMARY KEY ( `yearID`, `teamID`, `playerID`, `half` ),
     FOREIGN KEY ('playerID') REFERENCES Master('playerID'),
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID')
) CHARACTER SET 'UTF8';



DROP TABLE IF EXISTS `Master`;

CREATE TABLE `Master` (
    `playerID` VARCHAR(10) PRIMARY KEY,
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
    `bbrefID` VARCHAR(9)
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `Pitching`;

CREATE TABLE `Pitching` (
    `playerID` VARCHAR(9),
    `yearID` INTEGER,
    `stint` INTEGER,
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
    FOREIGN KEY ('playerID') REFERENCES Master('playerID'),
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID')
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `PitchingPost`;

CREATE TABLE `PitchingPost` (
    `playerID` VARCHAR(9),
    `yearID` INTEGER,
    `round` VARCHAR(10),
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
    FOREIGN KEY ('teamID', 'lgID', 'yearID') REFERENCES Teams('teamID', 'lgID', 'yearID'),
    FOREIGN KEY ('playerID') REFERENCES PitchingPost('playerID')
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `Salaries`;

CREATE TABLE `Salaries` (
    `yearID` INTEGER,
    `teamID` VARCHAR(3),
    `lgID` VARCHAR(2),
    `playerID` VARCHAR(9),
    `salary` DOUBLE,
    PRIMARY KEY ( `yearID`, `teamID`, `lgID`, `playerID` ),
    FOREIGN KEY (`playerID`) REFERENCES Master(`playerID`),
    FOREIGN KEY (`yearID`, `lgID`, `teamID`) REFERENCES Teams(`yearID`, `lgID`, `teamID`)
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `Schools`;

CREATE TABLE `Schools` (
    `schoolID` VARCHAR(15) PRIMARY KEY,
    `name_full` VARCHAR(255),
    `city` VARCHAR(55),
    `state` VARCHAR(55),
    `country` VARCHAR(55)
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `SeriesPost`;

CREATE TABLE `SeriesPost` (
    `yearID` INTEGER,
    `round` VARCHAR(5),
    `teamIDwinner` VARCHAR(3),
    `lgIDwinner` VARCHAR(2),
    `teamIDloser` VARCHAR(3),
    `lgIDloser` VARCHAR(2),
    `wins` INTEGER,
    `losses` INTEGER,
    `ties` INTEGER,
    PRIMARY KEY ( `yearID`, `round` ),
    FOREIGN KEY SeriesPost( `yearID` ) REFERENCES Teams( `yearID` ),
    FOREIGN KEY SeriesPost( `teamIDwinner` ) REFERENCES Teams( `teamID` ),
    FOREIGN KEY SeriesPost( `lgIDwinner` ) REFERENCES Teams( `lgID` ),
    FOREIGN KEY SeriesPost( `teamIDloser` ) REFERENCES Teams( `teamID` ),
    FOREIGN KEY SeriesPost( `lgIDloser` ) REFERENCES Teams( `lgID` )
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `Teams`;

CREATE TABLE `Teams` (
    `yearID` INTEGER,
    `lgID` VARCHAR(2),
    `teamID` VARCHAR(3),
    `franchID` VARCHAR(3),
    `divID` VARCHAR(1),
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
    PRIMARY KEY ( `yearID`, `lgID`, `teamID` ),
    FOREIGN KEY (`franchID`) REFERENCES TeamsFranchises(`franchID`)

) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `TeamsFranchises`;

CREATE TABLE `TeamsFranchises` (
    `franchID` VARCHAR(3) PRIMARY KEY,
    `franchName` VARCHAR(50),
    `active` VARCHAR(2),
    `NAassoc` VARCHAR(3)
) CHARACTER SET 'UTF8';


DROP TABLE IF EXISTS `TeamsHalf`;

CREATE TABLE `TeamsHalf` (
    `yearID` INTEGER,
    `lgID` VARCHAR(2),
    `teamID` VARCHAR(3),
    `Half` VARCHAR(1),
    `divID` VARCHAR(1),
    `DivWin` VARCHAR(1),
    `Rank` INTEGER,
    `G` INTEGER,
    `W` INTEGER,
    `L` INTEGER,
    PRIMARY KEY ( `yearID`, `teamID`, `lgID`, `Half` ),
    FOREIGN KEY (`yearID`, `teamID`, `lgID`) REFERENCES Teams(`yearID`, `teamID`, `lgID`)
) CHARACTER SET 'UTF8';
























