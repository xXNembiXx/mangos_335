-- Race Faction Change - Reputations

DROP TABLE IF EXISTS `player_factionchange_reputations`;
CREATE TABLE `player_factionchange_reputations` (
  `race_A` int(8) NOT NULL DEFAULT '0',
  `alliance_id` int(8) NOT NULL,
  `commentA` varchar(255) DEFAULT NULL,
  `race_H` int(8) NOT NULL DEFAULT '0',
  `horde_id` int(8) NOT NULL,
  `commentH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `player_factionchange_reputations` VALUES
('0', '47', 'Ironforge', '0', '530', 'Darkspear Trolls'),
('0', '54', 'Gnomeregan Exiles', '0', '81', 'Thunder Bluff'),
('0', '69', 'Darnassus', '0', '68', 'Undercity'),
('0', '72', 'Stormwind', '0', '76', 'Orgrimmar'),
('0', '509', 'The League of Arathor', '0', '510', 'The Defilers'),
('0', '730', 'Stormpike Guard', '0', '729', 'Frostwolf Clan'),
('0', '890', 'Silverwing Sentinels', '0', '889', 'Warsong Outriders'),
('0', '930', 'Exodar', '0', '911', 'Silvermoon City'),
('0', '946', 'Honor Hold', '0', '947', 'Thrallmar'),
('0', '978', 'Kurenai', '0', '941', 'The Mag\'har'),
('0', '1037', 'Alliance Vanguard', '0', '1052', 'Horde Expedition'),
('0', '1050', 'Valiance Expedition', '0', '1085', 'Warsong Offensive'),
('0', '1068', 'Explorers\' League', '0', '1064', 'The Taunka'),
('0', '1126', 'The Frostborn', '0', '1067', 'The Hand of Vengeance');
