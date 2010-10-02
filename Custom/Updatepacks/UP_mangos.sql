############################################################################
#
#							SQL	Updatepack
#							mangos database
#
#							  25-09-2010
#
############################################################################


####
# addition (author: insider42)
####

-- 3_mangos_autobroadcast.sql
DELETE FROM `mangos_string` WHERE `entry` = 1300;
INSERT INTO `mangos_string` VALUES (1300, '|cffffcc00[Server]: |cff00ff00%s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- 6_mangos_spell_disabled.sql
CREATE TABLE spell_disabled (
  entry int(11) unsigned NOT NULL default '0' COMMENT 'spell entry',
  ischeat_spell tinyint(3) unsigned NOT NULL default '0' COMMENT 'mark spell as cheat',
  active tinyint(3) unsigned NOT NULL default '1' COMMENT 'enable check of this spell',
  PRIMARY KEY  (entry)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Disabled Spell System';

-- 39_mangos_creature_template.sql
UPDATE `creature_template` SET `spell1` = 55328 WHERE `entry` = 3579;
UPDATE `creature_template` SET `spell1` = 55329 WHERE `entry` = 3911;
UPDATE `creature_template` SET `spell1` = 55330 WHERE `entry` = 3912;
UPDATE `creature_template` SET `spell1` = 55332 WHERE `entry` = 3913;
UPDATE `creature_template` SET `spell1` = 55333 WHERE `entry` = 7398;
UPDATE `creature_template` SET `spell1` = 55335 WHERE `entry` = 7399;
UPDATE `creature_template` SET `spell1` = 55278 WHERE `entry` = 15478;
UPDATE `creature_template` SET `spell1` = 58589 WHERE `entry` = 31120;
UPDATE `creature_template` SET `spell1` = 58590 WHERE `entry` = 31121;
UPDATE `creature_template` SET `spell1` = 58591 WHERE `entry` = 31122;

-- 46_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` WHERE `entry` = 8026;

-- 51_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (48492,48494,48495);
INSERT INTO `spell_proc_event` VALUES 
(48492,0,7,524288,0,2048,16384,0,0,0,0);

-- 80_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE entry IN (56342,56343,56344);
INSERT INTO `spell_proc_event` VALUES
(56342,0,9,0x0C,0x8000000,0x60000,0,0,0,0,0);

-- 99_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (44543,44545);
INSERT INTO `spell_proc_event` VALUES
(44543,0,3,33555104,0,0,0,0,0,0,0);

-- 111_mangos_creature_onkill_reputation.sql
ALTER TABLE `creature_onkill_reputation` 
 ADD COLUMN `ChampioningAura` int(11) unsigned NOT NULL default '0' AFTER `TeamDependent`;

-- 113_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 24905;
INSERT INTO `spell_proc_event` VALUES
(24905,0,0,0,0,0,0,2,0,50,0);

-- 115_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (11103,12357,12358,64343);
INSERT INTO `spell_proc_event` VALUES
(64343,0x00000000,3,0x00000002,0x00000000,0x00000000,0x00000000,0x00000000,0.0,0.0,0);

-- 116_mangos_spell_bonus_data.sql
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.286 WHERE `entry` = 49821;

-- 117_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (12317,13045,13046,13047,13048);

-- 118_mangos_spell_proc_event.sql
update `spell_proc_event` set `ppmRate` = 3 where `entry` = 12322;
update `spell_proc_event` set `ppmRate` = 6 where `entry` = 12999;
update `spell_proc_event` set `ppmRate` = 9 where `entry` = 13000;
update `spell_proc_event` set `ppmRate` = 12 where `entry` = 13001;
update `spell_proc_event` set `ppmRate` = 15 where `entry` = 13002;

-- 119_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (53551,53552,53553);
INSERT INTO `spell_proc_event` VALUES
(53551,0x00000000,10,0x00001000,0x00000000,0x00000000,0x00000000,0x00000000,0.0,0.0,0);

-- 120_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 67356;
INSERT INTO `spell_proc_event` VALUES (67356,0x00,7,0x00000010,0x00000000,0x00000000,0x00000000,0x00000000,0.000000,0.000000,0);

-- 124_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (51692,51696);
INSERT INTO `spell_proc_event` VALUES
(51692,0,8,516,0,0,0,0,0,0,0);

-- 129_mangos_spell_proc_event.sql
DELETE FROM `spell_bonus_data` WHERE `entry` = 54158;

-- 160_mangos_dalaran_arena.sql
delete from `gameobject` where `map` = 617;
insert into `gameobject` values
	-- buffs
('200060','184663','617','1','1','1291.7','813.424','7.11472','4.64562','0','0','0.730314','-0.683111','-120','100','1'),
('200061','184664','617','1','1','1291.7','768.911','7.11472','1.55194','0','0','0.700409','0.713742','-120','100','1'),
	-- doors
('200062','192642','617','1','1','1350.95','817.2','21.4096','3.15','0','0','0.99627','0.0862864','86400','100','1'),
('200063','192643','617','1','1','1232.65','764.913','21.4729','6.3','0','0','0.0310211','-0.999519','86400','100','1');

delete from `gameobject_battleground` where `guid` in (200060,200061,200062,200063);
insert into `gameobject_battleground` values
	-- buffs
('200060','252','0'),
('200061','252','0'),
	-- doors
('200062','254','0'),
('200063','254','0');

delete from `battleground_events` where `map` = 617;
insert into `battleground_events` values
('617','252','0','buffs'),
('617','254','0','doors');

	-- doors
update `gameobject_template` set `faction` = 114, `flags` = 32, `size` = 1.5 where `entry` in (192642,192643);

-- 161_mangos_spell_dbc.sql
DROP TABLE IF EXISTS `spell_dbc`;
CREATE TABLE `spell_dbc` (
  `Id` int(10) unsigned NOT NULL,
  `Dispel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Mechanic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Attributes` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int(10) unsigned NOT NULL DEFAULT '0',
  `Stances` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Targets` int(10) unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `AuraInterruptFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcChance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ProcCharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DurationIndex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RangeIndex` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `StackAmount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int(11) NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int(11) NOT NULL DEFAULT '0',
  `Effect1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectDieSides1` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides2` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides3` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints2` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints3` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude1` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude2` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude3` int(11) NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
  `EffectMiscValue1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue3` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB3` int(11) NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC3` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxTargetLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DmgClass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PreventionType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `AreaGroupId` int(11) NOT NULL DEFAULT '0',
  `SchoolMask` int(10) unsigned NOT NULL DEFAULT '0',
  `Comment` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom spell.dbc entries';

INSERT INTO `spell_dbc` VALUES
('24395', '0', '0', '536936848', '32768', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '1', '5', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('24396', '0', '0', '536936848', '32768', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '14', '13', '24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('24397', '0', '0', '536936848', '268468224', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '7', '10', '11', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('26592', '0', '0', '536936848', '268468224', '4', '0', '0', '0', '0', '1', '1', '0', '0', '101', '0', '0', '40', '40', '85', '1', '0', '-1', '0', '0', '6', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '77', '77', '77', '0', '0', '0', '0', '0', '0', '2', '18', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bestial Wrath - Immunity'),
('24900', '0', '0', '400', '1024', '0', '0', '2097152', '0', '1', '0', '1', '0', '0', '101', '0', '0', '0', '0', '21', '1', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '166', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Heart of the Wild - Cat Bonus'),
('24899', '0', '0', '400', '1024', '0', '0', '2097152', '0', '144', '0', '1', '0', '0', '101', '0', '0', '0', '0', '21', '1', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '137', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Heart of the Wild - Bear Bonus'),
('56817', '0', '0', '384', '0', '0', '0', '0', '0', '0', '0', '1', '0', '16', '100', '1', '0', '67', '67', '1', '0', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Rune Strike - Aura for 56815'),
('62388', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '21', '1', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Demonic Circle: Teleport(48020) - casterAuraSpell');

-- 165_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` where `entry` = 52042;

-- 169_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 22812;
INSERT INTO `spell_proc_event` VALUES (22812,0,0,0,0,0,0,3,0,0,0);

-- 170_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` WHERE `entry` IN (55078,55095);

-- 172_mangos_orgrimmar_arena.sql
delete from `gameobject` where `map` = 618;
insert into `gameobject` values
	-- buffs
('200070','184663','618','1','1','735.551819','-284.794678','28.276682','0.034906','0','0','0','0','-120','100','1'),
('200071','184664','618','1','1','791.224487','-284.794464','28.276682','2.600535','0','0','0','0','-120','100','1'),
	-- elevators
('200072','194582','618','1','1','763.536377','-294.535767','0.505383','3.141593','0','0','0','0','120','100','1'),
('200073','194586','618','1','1','763.506348','-273.873352','0.505383','0','0','0','0','0','120','100','1'),
	-- fire
('200074','192704','618','1','1','743.543457','-283.799469','28.286655','0','0','0','0','0','120','100','1'),
('200075','192705','618','1','1','782.971802','-283.799469','28.286655','0','0','0','0','0','120','100','1'),
('200076','192388','618','1','1','743.711060','-284.099609','27.542587','3.141593','0','0','0','0','120','100','1'),
('200077','192387','618','1','1','783.221252','-284.133362','27.535686','0','0','0','0','0','120','100','1'),
	-- gears
('200078','192393','618','1','1','763.664551','-261.872986','26.686588','0','0','0','0','0','120','100','1'),
('200079','192394','618','1','1','763.578979','-306.146149','26.665222','3.141593','0','0','0','0','120','100','1'),
	-- pillars
('200080','194583','618','1','1','763.632385','-306.162384','25.909504','3.141593','0','0','0','0','120','100','1'),
('200081','194584','618','1','1','723.644287','-284.493256','24.648525','3.141593','0','0','0','0','120','100','1'),
('200082','194585','618','1','1','763.611145','-261.856750','25.909504','0','0','0','0','0','120','100','1'),
('200083','194587','618','1','1','802.211609','-284.493256','24.648525','0','0','0','0','0','120','100','1'),
/*
	-- pillars collision (not work - should make you break LoS)
('200084','194580','618','1','1','763.632385','-306.162384','30.639660','3.141593','0','0','0','0','120','100','1'),
('200085','194579','618','1','1','723.644287','-284.493256','32.382710','0','0','0','0','0','120','100','1'),
('200086','194581','618','1','1','763.611145','-261.856750','30.639660','0','0','0','0','0','120','100','1'),
('200087','194578','618','1','1','802.211609','-284.493256','32.382710','3.141593','0','0','0','0','120','100','1'),
*/
	-- pulley
('200088','192389','618','1','1','700.722290','-283.990662','39.517582','3.141593','0','0','0','0','120','100','1'),
('200089','192390','618','1','1','826.303833','-283.996429','39.517582','0','0','0','0','0','120','100','1');

delete from `gameobject_battleground` where `guid` in (200070,200071,200072,200073);
insert into `gameobject_battleground` values
	-- buffs
('200070','252','0'),
('200071','252','0'),
	-- elevators
('200072','254','0'),
('200073','254','0');

delete from `battleground_events` where `map` = 618;
insert into `battleground_events` values
('618','252','0','buffs'),
('618','254','0','doors');

update `gameobject_template` set `faction` = 114, `flags` = 32 where `entry` in (192704,192705,192388,192387,192393,192394,192389,192390);

-- 194_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (49208,49467,54639);
INSERT INTO `spell_proc_event` VALUES
(49467, 0x00, 15, 0x00000010, 0x00020000, 0x00000000, 0x00010010, 0x00000000, 0.000000, 0.000000, 0),
(49208, 0x00, 15, 0x00400000, 0x00010000, 0x00000000, 0x00010010, 0x00000000, 0.000000, 0.000000, 0),
(54639, 0x00, 15, 0x00400000, 0x00010000, 0x00000000, 0x00010010, 0x00000000, 0.000000, 0.000000, 0);

-- 203_mangos_spell_area.sql
DELETE FROM spell_area WHERE spell IN (74411);
INSERT INTO spell_area VALUES 
	-- Eye of The Storm (map 566)
(74411,3820,0,0,0,0,0,2,1), -- Eye of the storm (general)
(74411,3869,0,0,0,0,0,2,1), -- Mage Tower
(74411,3870,0,0,0,0,0,2,1), -- BE Tower
(74411,3871,0,0,0,0,0,2,1), -- Draenei Ruins
(74411,3872,0,0,0,0,0,2,1), -- Fel Reaver Ruins

	-- Arathi Basin (map 529)
(74411,3358,0,0,0,0,0,2,1), -- Arathi Basin (general)
(74411,3317,0,0,0,0,0,2,1), -- Trollbane Hall
(74411,3418,0,0,0,0,0,2,1), -- Defilers Den
(74411,3420,0,0,0,0,0,2,1), -- Farm
(74411,3421,0,0,0,0,0,2,1), -- Blacksmith
(74411,3422,0,0,0,0,0,2,1), -- Lumber Mill
(74411,3424,0,0,0,0,0,2,1), -- Stables
(74411,3423,0,0,0,0,0,2,1), -- Gold Mine

	-- Warsong Gulch (map 489)
(74411,3277,0,0,0,0,0,2,1), -- Warsong Gulch (general)
(74411,3320,0,0,0,0,0,2,1), -- Warsong Luber Mill
(74411,3321,0,0,0,0,0,2,1), -- Silverwing Hold
(74411,4571,0,0,0,0,0,2,1), -- Silverwing Flag Room
(74411,4572,0,0,0,0,0,2,1), -- Warsong Flag Room

	-- Alterac Valley (map 30)
(74411,2597,0,0,0,0,0,2,1), -- Alterac Valley (general)
(74411,2957,0,0,0,0,0,2,1), -- Irondeep Mine
(74411,2958,0,0,0,0,0,2,1), -- Stonehearth Outpost
(74411,2959,0,0,0,0,0,2,1), -- Dun Baldar
(74411,2960,0,0,0,0,0,2,1), -- Icewing Pass
(74411,2961,0,0,0,0,0,2,1), -- Frostwolf Willage
(74411,2962,0,0,0,0,0,2,1), -- Tower Point
(74411,2963,0,0,0,0,0,2,1), -- Coldtooth Mine
(74411,2964,0,0,0,0,0,2,1), -- Winterax Hold
(74411,2977,0,0,0,0,0,2,1), -- Iceblood Garrison
(74411,2978,0,0,0,0,0,2,1), -- Frostwolf Keep
(74411,3017,0,0,0,0,0,2,1), -- Frost Dagger Pass
(74411,3057,0,0,0,0,0,2,1), -- Field of Strife
(74411,3058,0,0,0,0,0,2,1), -- Icewing Cavern
(74411,3297,0,0,0,0,0,2,1), -- Frostwolf Graveyard
(74411,3298,0,0,0,0,0,2,1), -- Frostwolf Pass
(74411,3299,0,0,0,0,0,2,1), -- Dun Baldar Pass
(74411,3300,0,0,0,0,0,2,1), -- Iceblood Graveyard
(74411,3301,0,0,0,0,0,2,1), -- Snowfall Graveyard
(74411,3302,0,0,0,0,0,2,1), -- Stonehearth Graveyard
(74411,3303,0,0,0,0,0,2,1), -- Stormpike Graveyard
(74411,3304,0,0,0,0,0,2,1), -- Icewing Bunker
(74411,3305,0,0,0,0,0,2,1), -- Stonhearth Bunker
(74411,3306,0,0,0,0,0,2,1), -- Wildpaw Ridge
(74411,3318,0,0,0,0,0,2,1), -- Rock of Durotan
(74411,3337,0,0,0,0,0,2,1), -- Wildpaw Cavern
(74411,3338,0,0,0,0,0,2,1), -- The Vieled Cleft
(74411,4407,0,0,0,0,0,2,1), -- Hall of the Frostwolf
(74411,4408,0,0,0,0,0,2,1), -- Hall of the Stormpike

	-- Stand of the Ancients (map 607)
(74411,4384,0,0,0,0,0,2,1), -- Strand of the Ancients (general)
(74411,4604,0,0,0,0,0,2,1), -- Gate of the Red Sun
(74411,4605,0,0,0,0,0,2,1), -- Gate of the Blue Sapphire
(74411,4606,0,0,0,0,0,2,1), -- Gate of the Green Emerald
(74411,4607,0,0,0,0,0,2,1), -- Gate of the Purple Amethyst
(74411,4608,0,0,0,0,0,2,1), -- Gate of the Yellow Moon
(74411,4609,0,0,0,0,0,2,1), -- Courtyard of the Ancients
(74411,4610,0,0,0,0,0,2,1), -- Landing Beach

	-- Isle of Conquest (map 628)
(74411,4710,0,0,0,0,0,2,1), -- Isle of Conquest (general)
(74411,4741,0,0,0,0,0,2,1), -- Isle of Conquest - No Man's Land
(74411,4747,0,0,0,0,0,2,1), -- Workshop
(74411,4748,0,0,0,0,0,2,1), -- Quarry
(74411,4749,0,0,0,0,0,2,1), -- Docks
(74411,4750,0,0,0,0,0,2,1), -- Hangar
(74411,4751,0,0,0,0,0,2,1), -- Refinery
(74411,4752,0,0,0,0,0,2,1), -- Horde Keep
(74411,4753,0,0,0,0,0,2,1); -- Alliance Keep

DELETE FROM spell_area WHERE spell IN (74410);
INSERT INTO spell_area VALUES 
(74410,4406,0,0,0,0,0,2,1), -- Ring of Valor (map 618)
(74410,3968,0,0,0,0,0,2,1), -- Ruins of Loraeron (map 572)
(74410,3638,0,0,0,0,0,2,1), -- Ring of Trials (map 572)
(74410,3698,0,0,0,0,0,2,1), -- Nagrand Arena (map 559)
(74410,3702,0,0,0,0,0,2,1), -- BEM Arena (map 562)
(74410,4378,0,0,0,0,0,2,1); -- Dalaran Arena (map 617);

-- 207_mangos_spell_bonus_data.sql
DELETE FROM `spell_bonus_data` WHERE `entry` = 50536;
INSERT INTO `spell_bonus_data` VALUES
(50536,0,0,0,'Death Knight - Unholy Blight Triggered');

-- 207_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE `entry` = 49194;
INSERT INTO `spell_proc_event` VALUES
(49194,0x00,15,0x00002000,0x00000000,0x00000000,0x00000000,0x00000000,0.000000,0.000000,0);

-- spell_proc_event_important.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (71562, 71519);
INSERT INTO `spell_proc_event` VALUES ('71562', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('71519', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
UPDATE `spell_proc_event` SET `SpellFamilyMask1` =  0x08000000 WHERE `entry` = 55666;

	-- Next NPCs needs for correct work of Deathbringer's Will's bonuses (only visual)

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38273, 0, 0, 0, 0, 0, 23643, 23653, 23643, 23653, 'Taunka', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38292, 0, 0, 0, 0, 0, 23643, 23653, 23643, 23653, 'Taunka', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38271, 0, 0, 0, 0, 0, 22251, 0, 22251, 0, 'Vrykul', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');


####
# Custom (author: kero99)
####

-- K19_spell_area_mangos.sql
INSERT IGNORE INTO spell_area VALUES (51913,  4298, 0, 0, 0, 0, 0, 2, 1);

-- K49_mangos_mirror_image.sql
-- Mirror Immage summon
UPDATE creature_template SET
speed_walk = 2.5,
modelid_A = 11686,
modelid_H = 11686,
faction_A = 35,
faction_H = 35,
minlevel = 80,
maxlevel = 80,
AIName = '',
ScriptName = 'mob_mirror_image'
WHERE entry = 31216;

-- K51_mangos_DeadlyPoisons.sql
DELETE FROM `spell_proc_event` WHERE `entry` IN (2818);
INSERT INTO `spell_proc_event` VALUES (2818, 0x00, 8, 0x00010000, 0x00000000, 0x00000000, 0x00020000, 0x00000000, 0.000000, 0.000000, 0);
INSERT INTO `spell_chain` VALUES 
(2818, 0, 2818, 1, 0), 
(2819, 2818, 2818, 2, 0),
(11353, 2819, 2818, 3, 0),
(11354, 11353, 2818, 4, 0),
(25349, 11354, 2818, 5, 0),
(26968, 25349, 2818, 6, 0),
(27187, 26968, 2818, 7, 0),
(57969, 27187, 2818, 8, 0),
(57970, 57969, 2818, 9, 0);

-- K60_mangos_WanderingPlague.sql
	-- Wandering Plague

DELETE FROM spell_chain WHERE spell_id IN (49217, 49654, 49655);
INSERT INTO spell_chain VALUES
(49217, 0, 49217, 1, 0),
(49654, 49217, 49217, 2, 0),
(49655, 49654, 49217, 2, 0);
DELETE FROM spell_proc_event WHERE entry IN (49217, 49654, 49655);
INSERT INTO spell_proc_event VALUES
(49217, 0, 15, 0, 100663296, 0, 262144, 0, 0, 100, 0);

-- K64_mangos_dkghoul.sql
DELETE FROM `spell_pet_auras` WHERE `aura` = 54566;
INSERT INTO `spell_pet_auras` VALUES
(48965,1,26125,54566),
(49572,1,26125,54566),
(49571,1,26125,54566);

DELETE FROM `pet_levelstats` WHERE `creature_entry` = 26125;
INSERT INTO `pet_levelstats` VALUES
(26125,1,48,80,10,20,16,13,20,8),
(26125,2,105,106,67,22,17,14,21,9),
(26125,3,162,132,124,24,18,15,22,10),
(26125,4,219,158,181,26,19,16,23,11),
(26125,5,276,184,238,28,20,17,24,12),
(26125,6,333,210,295,30,21,18,25,13),
(26125,7,390,236,352,32,22,19,26,14),
(26125,8,447,262,409,34,23,20,27,15),
(26125,9,504,288,466,36,24,21,28,16),
(26125,10,561,314,523,38,25,22,29,17),
(26125,11,618,340,580,40,26,23,30,18),
(26125,12,675,366,637,42,27,24,31,19),
(26125,13,732,392,694,44,28,25,32,20),
(26125,14,789,418,751,46,29,26,33,21),
(26125,15,846,444,808,48,30,27,34,22),
(26125,16,903,470,865,50,31,28,35,23),
(26125,17,960,496,922,52,32,29,36,24),
(26125,18,1017,522,979,54,33,30,37,25),
(26125,19,1074,548,1036,56,34,31,38,26),
(26125,20,1131,574,1093,58,35,32,39,27),
(26125,21,1188,600,1150,60,36,33,40,28),
(26125,22,1245,626,1207,62,37,34,41,29),
(26125,23,1302,652,1264,64,38,35,42,30),
(26125,24,1359,678,1321,66,39,36,43,31),
(26125,25,1416,704,1378,68,40,37,44,32),
(26125,26,1473,730,1435,70,41,38,45,33),
(26125,27,1530,756,1492,72,42,39,46,34),
(26125,28,1587,782,1549,74,43,40,47,35),
(26125,29,1644,808,1606,76,44,41,48,36),
(26125,30,1701,834,1663,78,45,42,49,37),
(26125,31,1758,860,1720,80,46,43,50,38),
(26125,32,1815,886,1777,82,47,44,51,39),
(26125,33,1872,912,1834,84,48,45,52,40),
(26125,34,1929,938,1891,86,49,46,53,41),
(26125,35,1986,964,1948,88,50,47,54,42),
(26125,36,2043,990,2005,90,51,48,55,43),
(26125,37,2100,1016,2062,92,52,49,56,44),
(26125,38,2157,1042,2119,94,53,50,57,45),
(26125,39,2214,1068,2176,96,54,51,58,46),
(26125,40,2271,1094,2233,98,55,52,59,47),
(26125,41,2328,1120,2290,100,56,53,60,48),
(26125,42,2385,1146,2347,102,57,54,61,49),
(26125,43,2442,1172,2404,104,58,55,62,50),
(26125,44,2499,1198,2461,106,59,56,63,51),
(26125,45,2556,1224,2518,108,60,57,64,52),
(26125,46,2613,1250,2575,110,61,58,65,53),
(26125,47,2670,1276,2632,112,62,59,66,54),
(26125,48,2727,1302,2689,114,63,60,67,55),
(26125,49,2784,1328,2746,116,64,61,68,56),
(26125,50,2841,1354,2803,118,65,62,69,57),
(26125,51,2898,1380,2860,120,66,63,70,58),
(26125,52,2955,1406,2917,122,67,64,71,59),
(26125,53,3012,1432,2974,124,68,65,72,60),
(26125,54,3069,1458,3031,126,69,66,73,61),
(26125,55,3126,1484,3088,128,70,67,74,62),
(26125,56,3183,1510,3145,130,71,68,75,63),
(26125,57,3240,1536,3202,132,72,69,76,64),
(26125,58,3297,1562,3259,134,73,70,77,65),
(26125,59,3354,1588,3316,136,74,71,78,66),
(26125,60,3411,1614,3373,138,75,72,79,67),
(26125,61,3468,1640,3430,140,76,73,80,68),
(26125,62,3525,1666,3487,142,77,74,81,69),
(26125,63,3582,1692,3544,144,78,75,82,70),
(26125,64,3639,1718,3601,146,79,76,83,71),
(26125,65,3696,1744,3658,148,80,77,84,72),
(26125,66,3753,1770,3715,150,81,78,85,73),
(26125,67,3810,1796,3772,152,82,79,86,74),
(26125,68,3867,1822,3829,154,83,80,87,75),
(26125,69,3924,1848,3886,156,84,81,88,76),
(26125,70,3981,1874,3943,158,85,82,89,77),
(26125,71,4038,1900,4000,160,86,83,90,78),
(26125,72,4095,1926,4057,162,87,84,91,79),
(26125,73,4152,1952,4114,164,88,85,92,80),
(26125,74,4209,1978,4171,166,89,86,93,81),
(26125,75,4266,2004,4228,168,90,87,94,82),
(26125,76,4323,2030,4285,170,91,88,95,83),
(26125,77,4380,2056,4342,172,92,89,96,84),
(26125,78,4437,2082,4399,174,93,90,97,85),
(26125,79,4494,2108,4456,176,94,91,98,86),
(26125,80,4551,2134,4513,178,95,92,99,87);

-- K65_mangos_lifebloom.sql
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES ('33778', '0.3857', '0', '0', 'Druid - Lifebloom final heal');


####
# Custom/Addition (author: janu)
####

-- [C2] Mail_External.sql
	-- Tables for External Mail System

DROP TABLE IF EXISTS `mail_external`;
CREATE TABLE `mail_external` (
    `id` bigint(20) unsigned NOT NULL auto_increment,
    `sender` bigint(20) default NULL,
    `receiver` bigint(20) default NULL,
    `subject` varchar(200) collate latin1_general_ci default 'Support',
    `message` varchar(500) collate latin1_general_ci default 'Support',
    `money` bigint(20) NOT NULL default '0',
    `stationery` int(10) default '41',
    `sent` tinyint(4) default '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

DROP TABLE IF EXISTS `mail_external_items`;
CREATE TABLE `mail_external_items` (
	`id` bigint(20) unsigned NOT NULL auto_increment,
    `mail_id` bigint(20) default NULL,
    `item` bigint(20) default NULL,
	`count` bigint(20) NOT NULL default '1',
PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- [C11] spell_proc.sql
	/*Item - Death Knight T10 Tank 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70652;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70652','0','15',0x00000008,'0','0',0x00004000,'0','0','0','0');

	/*Item - Paladin T10 Protection 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70761;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70761','0','10','0',0x80004000,'0',0x00004000,'0','0','0','0');

	/*Item - Paladin T10 Holy 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70756;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70756','0','10',0x00200000,'0','0',0x00004000,'0','0','0','0');

	/*Item - Hunter T10 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70727;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70727','0','9',0x00000001,'0','0','0','0','0','0','0');

	/*Item - Hunter T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70730;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70730','0','9',0x00004000,0x00001000,'0','0','0','0','0','0');

	/* Item - Priest T10 Healer 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70799;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70799','0','6',0x00000800,'0','0','0','0','0','0','0');

	/*Item - Shaman T10 Restoration 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70808;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70808','0','11',0x00000100,'0','0','0','2','0','0','0');

	/*Item - Druid T10 Balance 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70723;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70723','0','7',0x00000005,'0','0','0','2','0','0','0');

	/*Item - Rogue T10 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70805;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70805','0','8','0',0x00020000,'0',0x00004000,'0','0','0','0');

	/*Item - Rogue T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70803;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70803','0','8','4063232','0','0','0','0','0','0','0');

	/*Item - Shaman T10 Elemental 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70817;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70817','0','11','0',0x00001000,'0',0x00010000,'0','0','0','0');

	/*Item - Shaman T10 Enhancement 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70830;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70830','0','11','0',0x00020000,'0',0x00004000,'0','0','0','0');

	/*Item - Warlock T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70841;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70841','0','5',0x00000004,0x00000100,'0','0','0','0','0','0');

	/*Item - Warrior T10 Melee 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70854;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70854','0','5','0',0x00000010,'0','0','0','0','0','0');

	-- (64952) Item - Druid T8 Feral Relic ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (64952);
INSERT INTO `spell_proc_event` VALUES (64952, 0x00, 7, 0x00000000, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0);

	-- (67653) Coliseum 5 Tank Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67653);
INSERT INTO `spell_proc_event` VALUES (67653, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0.000000, 0.000000, 45);

	-- (67670) Coliseum 5 CasterTrinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67670);
INSERT INTO `spell_proc_event` VALUES (67670, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0x00000000, 0.000000, 0.000000, 45);

	-- (67672) Coliseum 5 Melee Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67672);
INSERT INTO `spell_proc_event` VALUES (67672, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000044, 0x00000000, 0.000000, 0.000000, 45);

	-- (67667) Coliseum 5 Healer Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67667);
INSERT INTO `spell_proc_event` VALUES (67667, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000, 45);

-- [C23] spell_proc.sql
/*Althor's Abacus */
DELETE FROM spell_proc_event WHERE entry = 71611;
INSERT INTO spell_proc_event VALUES
(71611, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45);

-- [C27] achievement_criteria_requirement.sql
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (3685,3879,3880,7020,7021);
INSERT INTO achievement_criteria_requirement (criteria_id,TYPE,value1) VALUES
	-- Stormtrooper
(3685,6,3820),
(3685,7,34976),
	-- Take a Chill Pill
(3879,6,3820),
(3879,7,23505),
	-- Not So Fast
(3880,6,3277),
(3880,7,23451),
	-- Not In My House
(7020,6,3321),
(7020,7,23335),
(7021,6,3320),
(7021,7,23333);

	-- We Had It All Along *cough*
UPDATE achievement_criteria_requirement SET value1 = 1590, value2 = 1590 WHERE criteria_id = 1235;

	-- Children' Week achievements
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (6651,6652,6653,6654,6655,6656,6657,12398,6659,10391,6641,6642,6643,6644);
INSERT INTO achievement_criteria_requirement (criteria_id,TYPE,value1) VALUES
(6651,16,201),
(6652,16,201),
(6653,16,201),
(6654,16,201),
(6655,16,201),
(6656,16,201),
(6657,16,201),
(12398,16,201),
(6659,16,201),
(10391,16,201),
(6641,16,201),
(6642,16,201),
(6643,16,201),
(6644,16,201);

-- [C50] spell_proc.sql
	-- http://getmangos.com/community/showthread.php?14325-FIX-Some-trinkets-proc_events
DELETE FROM `spell_proc_event` WHERE `entry` IN (65005, 67389, 71402, 71540, 71602, 71606, 71637, 71645);

INSERT INTO `spell_proc_event` VALUES
(65005, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0x00000000, 0, 10, 45),
(67389, 0x01, 0x0B, 0x00000000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0, 70, 45),
(71402, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00051154, 0x00000000, 0, 35, 45),
(71540, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00051154, 0x00000000, 0, 35, 45),
(71602, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00014000, 0x00000000, 0, 10, 45),
(71606, 0x00, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00040000, 0x00000000, 0, 30, 45),
(71637, 0x00, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00040000, 0x00000000, 0, 30, 45),
(71645, 0x01, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00014000, 0x00000000, 0, 10, 45);

-- [C67] spell_proc.sql
/* Val'anyr, Hammer of Ancient Kings */
DELETE FROM spell_proc_event WHERE entry = 64415;
INSERT INTO spell_proc_event VALUES
(64415, 0x00,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45);

-- [C78] ticket_system_mangos.sql
	-- do not delete tickets, only flag them as "closed"

UPDATE `mangos_string` SET `content_default` = 'All tickets closed.', `content_loc3` = 'Alle Tickets geschlossen.' WHERE entry = 294;
UPDATE `mangos_string` SET `content_default` = 'Character %s ticket closed.', `content_loc3` = 'Ticket von Charakter %s wurde geschlossen.' WHERE entry = 295;
UPDATE `mangos_string` SET `content_default` = 'Ticket closed.', `content_loc3` = 'Ticket geschlossen.' WHERE entry = 296;

DELETE FROM `command` WHERE name IN('delticket','ticket');
INSERT INTO `command` 
	(`name`, `security`, `help`)
VALUES
	('closeticket','2','Syntax: .closeticket all\r\n        .closeticket #num\r\n        .closeticket $character_name\r\n    .closeticket a #num\rall to close all tickets at server, $character_name to close ticket of this character, #num to close ticket #num.'),
	('ticket','2','Syntax: .ticket on\r\n        .ticket off\r\n        .ticket #num\r\n        .ticket $character_name\r\n    .ticket a #num\r\n    .ticket assign $character_name #guid or #num GMLevel\r\n    .ticket assign $character_name del\r\non/off for GMs to show or not a new ticket directly, $character_name to show ticket of this character, #num to show ticket #num, \'a\' to get assigned ticket #num, assign to assign a ticket.');


DELETE FROM `mangos_string` WHERE `entry` IN ('290', '10000');
INSERT INTO `mangos_string`
	(`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
	('290','Ticket %u of %s (Last updated: %s) assigned to: %s , GMLevel: %u :\n%s ',NULL,NULL,'Ticket %u von %s (Letztes Update: %s) zugeordnet zu: %s , GMLevel: %u :\n%s ',NULL,NULL,NULL,NULL,NULL),
	('10000','|cffff0000You have %i assigned tickets|r',NULL,NULL,'|cffff0000Sie haben %i zugewiesene Tickets|r',NULL,NULL,NULL,NULL,NULL);

-- [C97] vehicle_entry.sql
ALTER TABLE creature_template
  ADD COLUMN `VehicleId` mediumint(8) unsigned NOT NULL default '0' AFTER `PetSpellDataId`;

-- [C114] Strand_of_the_Ancients.sql
	-- Strand of the Ancients
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES
(300000, 0, 7203, 'Forcefield 000', '', '', '', 1375, 32, 0.05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `creature_template` SET npcflag=1, `ScriptName` = 'npc_sa_vendor' WHERE entry in (29260,29262);
DELETE FROM `creature_template` WHERE `entry` in (50000);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(50000, 0, 0, 0, 0, 0, 27462, 0, 27462, 0, '?????????? ?????', NULL, NULL, 0, 80, 80, 5000, 5000, 0, 0, 9730, 7, 7, 0, 1, 0.5, 0, 420, 630, 0, 157, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 94, 1, 0, 0, 0, 'npc_sa_bomb');
DELETE FROM `gameobject_template` WHERE `entry` in (190753,194086);
	-- UPDATE `gameobject_template` SET `faction` = 14 WHERE `entry` in (192549,190727,190726,190723,190724,190722);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES
(190753, 22, 8582, 'Seaforium Barrel', '', '', '', 12, 0, 2, 0, 0, 0, 0, 0, 0, 52415, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(194086, 22, 8582, 'Seaforium Barrel', '', '', '', 29, 0, 2, 0, 0, 0, 0, 0, 0, 52415, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
	-- Battleground Demolisher
UPDATE `creature_template` SET npcflag = 1, unit_flags = 0, `faction_A` = '35', `faction_H` = '35', `ScriptName` = 'npc_sa_demolisher' WHERE entry IN (28781); 
REPLACE INTO `npc_spellclick_spells` VALUES ('28781', '60968', '0', '0', '0', '0');
UPDATE `creature_template` SET `spell1` = '52338', `spell2` = '60206', `spell3` = '0', `spell4` = '0', `VehicleId` = '158' WHERE `entry` = 28781;

	-- Antipersonnel Cannon
UPDATE `creature_template` SET unit_flags = 8, `faction_A` = '35', `faction_H` = '35', `ScriptName` = 'npc_sa_cannon' WHERE entry IN (27894);
REPLACE INTO `npc_spellclick_spells` VALUES ('27894', '60968', '0', '0', '0', '0');
UPDATE `creature_template` SET `spell1` = '49872', `spell2` = '0', `spell3` = '0', `spell4` = '0', `VehicleId` = '160'WHERE `entry` = 27894;


DELETE FROM `gameobject` WHERE `guid` in (200001,200002,200003,200004,200005,200006,200007);
INSERT INTO `gameobject` (`guid` ,`id` ,`map` ,`spawnMask` ,`phaseMask` ,`position_x` ,`position_y` ,`position_z` ,`orientation` ,`rotation0` ,`rotation1` ,`rotation2` ,`rotation3` ,`spawntimesecs` ,`animprogress` ,`state` ) VALUES
(200001, 192829, 607, 1, 1, 836.502, -108.811, 111.587, 0.121379, 0, 0, 0.0606524, 0.998159, 5, 0, 1),
(200002, 190727, 607, 1, 1, 1054.47, -107.76, 82.16, 0.06, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(200003, 190726, 607, 1, 1, 1228.62, -212.12, 55.34, 0.48, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(200004, 190723, 607, 1, 1, 1215.82, 80.64, 53.38, 5.68, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(200005, 190724, 607, 1, 1, 1431.05, -219.21, 30.89, 0.83, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(200006, 190722, 607, 1, 1, 1413.15, 107.78, 28.69, 5.42, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(200007, 192549, 607, 1, 1, 873.3, -108.286, 117.171, 0.00894308, 0, 0, 0.00447152, 0.99999, 600, 0, 1);

DELETE FROM `gameobject_battleground` WHERE `guid` in (200001,200002,200003,200004,200005,200006,200007);
INSERT INTO `gameobject_battleground` (`guid` ,`event1` ,`event2`) VALUES 
('200001', '8', '0'),
('200002', '8', '0'),
('200003', '8', '0'),
('200004', '8', '0'),
('200005', '8', '0'),
('200006', '8', '0'),
('200007', '8', '0');

DELETE FROM `creature` WHERE `guid` in (200001,200002,200003,200004,200005,200006,200007,200008,200009,200010,200011,200012,200013,200014,200015,200016,200027,200028,200029,200030);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
	-- ???????? ?/? ????????????
(200001, 29260, 607, 1, 1, 0, 0, 1360.81, -322.18, 36.83, 0.32, 800, 0, 0, 6986, 0, 0, 0),
(200002, 29262, 607, 1, 1, 0, 0, 1363.87, 220.95, 37.06, 2.67, 800, 0, 0, 6986, 0, 0, 0),
	-- ??????????????? ?????
(200003, 27894, 607, 1, 1, 0, 0, 1421.94, -196.53, 42.18, 0.90, 800, 0, 0, 25000, 0, 0, 0),
(200004, 27894, 607, 1, 1, 0, 0, 1455.09, -219.92, 41.95, 1.03, 800, 0, 0, 25000, 0, 0, 0),
(200005, 27894, 607, 1, 1, 0, 0, 1405.33, 84.25, 41.18, 5.40, 800, 0, 0, 25000, 0, 0, 0),
(200006, 27894, 607, 1, 1, 0, 0, 1436.51, 110.02, 41.40, 5.32, 800, 0, 0, 25000, 0, 0, 0),
(200007, 27894, 607, 1, 1, 0, 0, 1236.33, 92.17, 64.96, 5.68, 800, 0, 0, 25000, 0, 0, 0),
(200008, 27894, 607, 1, 1, 0, 0, 1215.04, 57.73, 64.73, 5.71, 800, 0, 0, 25000, 0, 0, 0),
(200009, 27894, 607, 1, 1, 0, 0, 1232.35, -187.34, 66.94, 0.37, 800, 0, 0, 25000, 0, 0, 0),
(200010, 27894, 607, 1, 1, 0, 0, 1249.95, -223.74, 66.72, 0.43, 800, 0, 0, 25000, 0, 0, 0),
(200011, 27894, 607, 1, 1, 0, 0, 1068.82, -127.38, 96.44, 0.06, 800, 0, 0, 25000, 0, 0, 0),
(200012, 27894, 607, 1, 1, 0, 0, 1068.35, -87.04, 93.80, 6.24, 800, 0, 0, 25000, 0, 0, 0),
	-- ???????????
(200013, 28781, 607, 1, 1, 0, 0, 1582.57, -96.37, 8.47, 5.57, 450, 0, 0, 50000, 0, 0, 0),
(200014, 28781, 607, 1, 1, 0, 0, 1610.55, -117.52, 8.77, 2.44, 450, 0, 0, 50000, 0, 0, 0),
(200015, 28781, 607, 1, 1, 0, 0, 1594.24, 39.16, 7.49, 0.62, 450, 0, 0, 50000, 0, 0, 0),
(200016, 28781, 607, 1, 1, 0, 0, 1618.60, 62.26, 7.17, 3.61, 450, 0, 0, 50000, 0, 0, 0),
	-- ??????????? ? ??????????
(200027, 28781, 607, 1, 1, 0, 0, 1353.28, 224.092, 35.2432, 4.35363, 600, 5, 0, 50000, 0, 0, 0), 	-- ?????
(200028, 28781, 607, 1, 1, 0, 0, 1347.65, 208.805, 34.2892, 4.39378, 600, 5, 0, 50000, 0, 0, 0), 	-- ?????
(200029, 28781, 607, 1, 1, 0, 0, 1371.2, -317.169, 34.9982, 1.93504, 600, 5, 0, 50000, 0, 0, 0), 	-- ??????
(200030, 28781, 607, 1, 1, 0, 0, 1365.52, -301.854, 34.0439, 1.91998, 600, 5, 0, 50000, 0, 0, 0);-- ??????



DELETE FROM `creature_battleground` WHERE `guid` in (200001,200002,200003,200004,200005,200006,200007,200008,200009,200010,200011,200012,200013,200014,200015,200016,200027,200028,200029,200030);
INSERT INTO `creature_battleground` (`guid` ,`event1` ,`event2`) VALUES 
('200001', '7', '0'),
('200002', '7', '0'),
('200003', '7', '0'),
('200004', '7', '0'),
('200005', '7', '0'),
('200006', '7', '0'),
('200007', '7', '0'),
('200008', '7', '0'),
('200009', '7', '0'),
('200010', '7', '0'),
('200011', '7', '0'),
('200012', '7', '0'),
('200013', '7', '0'),
('200014', '7', '0'),
('200015', '7', '0'),
('200016', '7', '0'),
('200027', '9', '0'),
('200028', '9', '0'),
('200029', '10', '0'),
('200030', '10', '0');

DELETE FROM `battleground_events` WHERE `map` in (607);
INSERT INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES 
('607', '254', '0', 'Door'),
('607', '6', '0', 'Bomb ALLIANCE'),
('607', '6', '1', 'Bomb HORDE'),
('607', '5', '3', 'Spirit for controll ALLIANCE'),
('607', '5', '4', 'Spirit for controll HORDE'),
('607', '8', '0', 'Spawn all GO'),
('607', '9', '0', 'Spawn Vehicle E'),
('607', '10', '0', 'Spawn Vehicle W'),
('607', '7', '0', 'Spawn all NPC'),
('607', '0', '1', 'A ocup'),
('607', '0', '2', 'H ocup'),
('607', '0', '3', 'A seizes'),
('607', '0', '4', 'H seizes'),
('607', '1', '1', 'A ocup'),
('607', '1', '2', 'H ocup'),
('607', '1', '3', 'A seizes'),
('607', '1', '4', 'H seizes'),
('607', '2', '1', 'A ocup'),
('607', '2', '2', 'H ocup'),
('607', '2', '3', 'A seizes'),
('607', '2', '4', 'H seizes');

DELETE FROM `creature` WHERE `guid` in (200017,200018,200019,200020,200021,200022,200023,200024,200025,200026);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(200017, 13117, 607, 1, 1, 0, 0, 1448.78, -52.9605, 5.74272, 0.0530517, 25, 0, 0, 37420, 6310, 0, 0),-- ???????
(200018, 13116, 607, 1, 1, 0, 0, 1448.78, -52.9605, 5.74272, 0.0530517, 25, 0, 0, 37890, 6310, 0, 0),-- ????????
(200019, 13117, 607, 1, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 25, 0, 0, 37420, 6310, 0, 0),-- 1
(200020, 13116, 607, 1, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 25, 0, 0, 37890, 6310, 0, 0),-- 1?
(200021, 13117, 607, 1, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 25, 0, 0, 37420, 6310, 0, 0),-- 0
(200022, 13116, 607, 1, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 25, 0, 0, 37890, 6310, 0, 0),-- 0?
(200023, 13117, 607, 1, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 25, 0, 0, 37420, 6310, 0, 0),-- 2
(200024, 13116, 607, 1, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 25, 0, 0, 37890, 6310, 0, 0),-- 2?
(200025, 13117, 607, 1, 1, 0, 0, 952.963, -192.742, 92.3584, 0.35779, 25, 0, 0, 37420, 6310, 0, 0),-- ? ????????
(200026, 13116, 607, 1, 1, 0, 0, 952.963, -192.742, 92.3584, 0.35779, 25, 0, 0, 37890, 6310, 0, 0);-- ? ?????????
DELETE FROM `creature_battleground` WHERE `guid` in (200017,200018,200019,200020,200021,200022,200023,200024,200025,200026);
INSERT INTO `creature_battleground` (`guid` ,`event1` ,`event2`) VALUES 
('200017', '5', '3'),
('200018', '5', '4'),
('200025', '5', '4'),
('200026', '5', '3'),
('200019', '1', '4'),
('200020', '1', '3'),
('200021', '0', '4'),
('200022', '0', '3'),
('200023', '2', '4'),
('200024', '2', '3');

DELETE FROM `mangos_string` WHERE `entry` in (650,651,20000,20001,20002,20003,20004,20005,20006,20007,20008,20009,20010,20011,20012,20013,20014,20015,20016,20017,20018,20019,20020,20021,20022);
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(650, 'Alliance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????'),
(651, 'Horde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????'),
(20000, 'The battle for Strand of the Ancients begins in 2 minute.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?? ????? ??????? ???????? ????? 2 ??????.'),
(20001, 'The battle for Strand of the Ancients begins in 1 minute.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?? ????? ??????? ???????? ????? 1 ??????.'),
(20002, 'The battle for Strand of the Ancients begins in 30 seconds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?? ????? ??????? ???????? ????? 30 ??????. ????????????!'),
(20003, 'The battle for Strand of the Ancients has begun!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?? ????? ??????? ????????! '),

(20004, 'Gates %s are subjected to the hold up!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? %s ???????????? ?????????!'),
(20005, 'Gates %s are damaged!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? %s ??????????!'),
(20006, 'Gates %s are destroyed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? %s ??????????!'),

(20007, 'Green emerald', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ????????'),
(20008, 'Blue saphire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ???????'),
(20009, 'Mauve amethyst', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ????????'),
(20010, 'Red sun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ??????'),
(20011, 'Yellow moon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ????'),
(20012, 'Room ancient shrine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ??????? ???????'),

(20013, 'The %s precipitates the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ???????? %s!'),
(20014, 'The %s seizes the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ??????????? %s!'),
(20015, 'East graveyard!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ????????!'),
(20016, 'West graveyard!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ????????!'),
(20017, 'South graveyard!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ????????!'),
(20018, '$n has ?lace ?eaforium ?harge!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$n ??????? ?????????? ?????!'),

(20019, '%s has seized the Relic of Titanium for %s minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ????? ?? ????????! ???????? ?????? ?????????!'),
(20020, '%s has seized the Relic of Titanium for %s minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ????? ?? ?????! ???????? ?????? ?????????!'),
(20021, '%s has seized the Relic of Titanium for %s minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ????? ?????! ???????? ?????? ?? ?????????!'),
(20022, '%s has seized the Relic of Titanium for %s minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ????? ?????! ???????? ?????? ?? ?????????!');

DELETE FROM `gameobject` WHERE `guid` in (200008,200009,200010,200011,200012,200013,200014,200015,200016,200017,200018,200019,200020,200021,200022,200023,200024,200025,200026,200027,200028);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(200008, 180058, 607, 1, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1),-- Alliance Banner
(200009, 180059, 607, 1, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1),-- Contested Banner
(200010, 180060, 607, 1, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1),-- Horde Banner
(200011, 180061, 607, 1, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1),-- Contested Banner
(200012, 180100, 607, 1, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1),-- Alliance Banner Aura
(200013, 180101, 607, 1, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1),-- Horde Banner Aura
(200014, 191311, 607, 1, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1),-- Flagpole

(200015, 180058, 607, 1, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1),-- Alliance Banner
(200016, 180059, 607, 1, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1),-- Contested Banner
(200017, 180060, 607, 1, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1),-- Horde Banner
(200018, 180061, 607, 1, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1),-- Contested Banner
(200019, 180100, 607, 1, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1),-- Alliance Banner Aura
(200020, 180101, 607, 1, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1),-- Horde Banner Aura
(200021, 191311, 607, 1, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1),-- Flagpole

(200022, 180058, 607, 1, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1),-- Alliance Banner
(200023, 180059, 607, 1, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1),-- Contested Banner
(200024, 180060, 607, 1, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1),-- Horde Banner
(200025, 180061, 607, 1, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1),-- Contested Banner
(200026, 180100, 607, 1, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1),-- Alliance Banner Aura
(200027, 180101, 607, 1, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1),-- Horde Banner Aura
(200028, 191311, 607, 1, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1);-- Flagpole

DELETE FROM `gameobject_battleground` WHERE `guid` in (200008,200009,200010,200011,200012,200013,200014,200015,200016,200017,200018,200019,200020,200021,200022,200023,200024,200025,200026,200027,200028,200029,200030,200031,200032,200033,200034,200035,200036,200037,200038,200039,200040,200041,200042,200043,200044,200045,200046,200047,200048,200049,200050,200051,200052,200053,200054,200055,200056,200057,200058,200059,200060,200061,200062,200063,200064,200065,200066,200067,200068,200069,200070,200071,200072,200073,200074,200075,200076,200077,200078,200079,200080,200081,200082,200083,200084,200085,200086);
INSERT INTO `gameobject_battleground` (`guid` ,`event1` ,`event2`) VALUES 
('200008', '0', '3'),('200009', '0', '1'),('200010', '0', '4'),('200011', '0', '2'),('200012', '0', '3'),('200013', '0', '4'),('200014', '8', '0'),
('200015', '1', '3'),('200016', '1', '1'),('200017', '1', '4'),('200018', '1', '2'),('200019', '1', '3'),('200020', '1', '4'),('200021', '8', '0'),
('200022', '2', '3'),('200023', '2', '1'),('200024', '2', '4'),('200025', '2', '2'),('200026', '2', '3'),('200027', '2', '4'),('200028', '8', '0'),
('200029', '8', '0'),('200030', '8', '0'),('200031', '8', '0'),('200032', '8', '0'),('200033', '8', '0'),('200034', '8', '0'),('200035', '8', '0'),
('200036', '1', '3'),('200037', '1', '3'),('200038', '1', '3'),('200039', '1', '3'),('200044', '1', '4'),('200045', '1', '4'),('200046', '1', '4'),
('200047', '1', '4'),('200040', '0', '3'),('200041', '0', '3'),('200042', '0', '3'),('200043', '0', '3'),('200048', '0', '4'),('200049', '0', '4'),
('200050', '0', '4'),('200051', '0', '4'),

('200052', '6', '0'),('200053', '6', '0'),('200054', '6', '0'),('200055', '6', '0'),('200056', '6', '0'),('200057', '6', '0'),('200058', '6', '0'),('200059', '6', '0'),
('200060', '6', '0'),('200061', '6', '0'),('200062', '6', '0'),('200063', '6', '0'),('200064', '6', '0'),('200065', '6', '0'),('200066', '6', '0'),('200067', '6', '0'),

('200068', '6', '1'),('200069', '6', '1'),('200070', '6', '1'),('200071', '6', '1'),('200072', '6', '1'),('200073', '6', '1'),('200074', '6', '1'),('200075', '6', '1'),
('200076', '6', '1'),('200077', '6', '1'),('200078', '6', '1'),('200079', '6', '1'),('200080', '6', '1'),('200081', '6', '1'),('200082', '6', '1'),('200083', '6', '1'),

('200084', '254', '0'),('200085', '254', '0'),('200086', '254', '0');

UPDATE `gameobject_template` Set `ScriptName` = 'go_sa_def_portal' WHERE entry = 191575;
DELETE FROM `gameobject` WHERE `guid` in (200029,200030,200031,200032,200033,200034,200035);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(200029, 191575, 607, 1, 1, 1468.12, -225.7, 30.8969, 5.68042, 0, 0, 0.296839, -0.954928, 25, 0, 1), 	-- ?????
(200030, 191575, 607, 1, 1, 1394.07, 72.3632, 31.0541, 0.818809, 0, 0, 0.398063, 0.917358, 25, 0, 1), 	-- ???????
(200031, 191575, 607, 1, 1, 1216.12, 47.7665, 54.2785, 4.05465, 0, 0, 0.897588, -0.440835, 25, 0, 1), 	-- ??????????
(200032, 191575, 607, 1, 1, 1255.73, -233.153, 56.4357, 5.01833, 0, 0, 0.591105, -0.806595, 25, 0, 1), 	-- ???????
(200033, 191575, 607, 1, 1, 1065.02, -89.9522, 81.0758, 1.58771, 0, 0, 0.71306, 0.701103, 25, 0, 1), 	-- ??????
(200034, 191575, 607, 1, 1, 880.162, -95.979, 109.835, 3.14672, 0, 0, 0.999997, -0.00256531, 25, 0, 1), 	-- ??????? ???????
(200035, 191575, 607, 1, 1, 880.68, -120.799, 109.835, 3.16636, 0, 0, 0.999923, -0.0123816, 25, 0, 1); 	-- ??????? ???????


DELETE FROM `gameobject` WHERE `guid` in (200052,200053,200054,200055,200056,200057,200058,200059,200060,200061,200062,200063,200064,200065,200066,200067,200068,200069,200070,200071,200072,200073,200074,200075,200076,200077,200078,200079,200080,200081,200082,200083,200084,200085,200086);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(200052, 190753, 607, 1, 1, 1619.71, -122.735, 9.08799, 4.11749, 0, 0, 0.883295, -0.468817, 25, 0, 1),
(200068, 194086, 607, 1, 1, 1619.71, -122.735, 9.08799, 4.11749, 0, 0, 0.883295, -0.468817, 25, 0, 1),
(200053, 190753, 607, 1, 1, 1620.92, -120.946, 9.08799, 4.11749, 0, 0, 0.883295, -0.468817, 25, 0, 1),
(200069, 194086, 607, 1, 1, 1620.92, -120.946, 9.08799, 4.11749, 0, 0, 0.883295, -0.468817, 25, 0, 1),
(200054, 190753, 607, 1, 1, 1622.24, -119.09, 9.08799, 4.1332, 0, 0, 0.879586, -0.475739, 25, 0, 1),
(200070, 194086, 607, 1, 1, 1622.24, -119.09, 9.08799, 4.1332, 0, 0, 0.879586, -0.475739, 25, 0, 1),
(200055, 190753, 607, 1, 1, 1623.53, -117.128, 9.08799, 4.1332, 0, 0, 0.879586, -0.475739, 25, 0, 1),
(200071, 194086, 607, 1, 1, 1623.53, -117.128, 9.08799, 4.1332, 0, 0, 0.879586, -0.475739, 25, 0, 1),
(200056, 190753, 607, 1, 1, 1571.3, -95.7584, 8.45841, 4.12299, 0, 0, 0.882004, -0.471242, 25, 0, 1),
(200072, 194086, 607, 1, 1, 1571.3, -95.7584, 8.45841, 4.12299, 0, 0, 0.882004, -0.471242, 25, 0, 1),
(200057, 190753, 607, 1, 1, 1572.54, -93.9067, 8.45695, 4.12299, 0, 0, 0.882004, -0.471242, 25, 0, 1),
(200073, 194086, 607, 1, 1, 1572.54, -93.9067, 8.45695, 4.12299, 0, 0, 0.882004, -0.471242, 25, 0, 1),
(200058, 190753, 607, 1, 1, 1573.7, -92.1515, 8.45554, 4.12692, 0, 0, 0.881077, -0.472973, 25, 0, 1),
(200074, 194086, 607, 1, 1, 1573.7, -92.1515, 8.45554, 4.12692, 0, 0, 0.881077, -0.472973, 25, 0, 1),
(200059, 190753, 607, 1, 1, 1574.72, -90.5222, 8.45269, 4.17011, 0, 0, 0.870657, -0.49189, 25, 0, 1),
(200075, 194086, 607, 1, 1, 1574.72, -90.5222, 8.45269, 4.17011, 0, 0, 0.870657, -0.49189, 25, 0, 1),
(200060, 190753, 607, 1, 1, 1586.23, 32.0426, 7.79361, 2.37156, 0, 0, 0.926792, 0.375575, 25, 0, 1),
(200076, 194086, 607, 1, 1, 1586.23, 32.0426, 7.79361, 2.37156, 0, 0, 0.926792, 0.375575, 25, 0, 1),
(200061, 190753, 607, 1, 1, 1587.73, 30.6612, 7.79361, 2.39905, 0, 0, 0.931866, 0.362801, 25, 0, 1),
(200077, 194086, 607, 1, 1, 1587.73, 30.6612, 7.79361, 2.39905, 0, 0, 0.931866, 0.362801, 25, 0, 1),
(200062, 190753, 607, 1, 1, 1589.32, 29.2037, 7.79361, 2.39905, 0, 0, 0.931866, 0.362801, 25, 0, 1),
(200078, 194086, 607, 1, 1, 1589.32, 29.2037, 7.79361, 2.39905, 0, 0, 0.931866, 0.362801, 25, 0, 1),
(200063, 190753, 607, 1, 1, 1591.09, 27.585, 7.79361, 2.40297, 0, 0, 0.932577, 0.360971, 25, 0, 1),
(200079, 194086, 607, 1, 1, 1591.09, 27.585, 7.79361, 2.40297, 0, 0, 0.932577, 0.360971, 25, 0, 1),
(200064, 190753, 607, 1, 1, 1621.55, 74.7503, 7.16584, 2.35192, 0, 0, 0.92306, 0.384655, 25, 0, 1),
(200080, 194086, 607, 1, 1, 1621.55, 74.7503, 7.16584, 2.35192, 0, 0, 0.92306, 0.384655, 25, 0, 1),
(200065, 190753, 607, 1, 1, 1622.85, 73.5074, 7.16443, 2.37941, 0, 0, 0.92826, 0.371932, 25, 0, 1),
(200081, 194086, 607, 1, 1, 1622.85, 73.5074, 7.16443, 2.37941, 0, 0, 0.92826, 0.371932, 25, 0, 1),
(200066, 190753, 607, 1, 1, 1624.15, 72.2676, 7.16443, 2.37941, 0, 0, 0.92826, 0.371932, 25, 0, 1),
(200082, 194086, 607, 1, 1, 1624.15, 72.2676, 7.16443, 2.37941, 0, 0, 0.92826, 0.371932, 25, 0, 1),
(200067, 190753, 607, 1, 1, 1625.5, 70.9844, 7.16443, 2.37941, 0, 0, 0.92826, 0.371932, 25, 0, 1),
(200083, 194086, 607, 1, 1, 1625.5, 70.9844, 7.16443, 2.37941, 0, 0, 0.92826, 0.371932, 25, 0, 1);

DELETE FROM `gameobject` WHERE `guid` in (200036,200037,200038,200039,200040,200041,200042,200043,200044,200045,200046,200047,200048,200049,200050,200051);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(200036, 190753, 607, 1, 1, 1352.69, 237.328, 34.9859, 2.95982, 0, 0, 0.995873, 0.0907596, 60, 0, 1),
(200044, 194086, 607, 1, 1, 1352.69, 237.328, 34.9859, 2.95982, 0, 0, 0.995873, 0.0907596, 60, 0, 1),
(200037, 190753, 607, 1, 1, 1356.65, 236.624, 35.0095, 2.99124, 0, 0, 0.997176, 0.0751059, 60, 0, 1),
(200045, 194086, 607, 1, 1, 1356.65, 236.624, 35.0095, 2.99124, 0, 0, 0.997176, 0.0751059, 60, 0, 1),
(200038, 190753, 607, 1, 1, 1359.74, 236.177, 35.0288, 2.99517, 0, 0, 0.997321, 0.0731478, 60, 0, 1),
(200046, 194086, 607, 1, 1, 1359.74, 236.177, 35.0288, 2.99517, 0, 0, 0.997321, 0.0731478, 60, 0, 1),
(200039, 190753, 607, 1, 1, 1363.2, 235.804, 35.0499, 3.03836, 0, 0, 0.998668, 0.0515918, 60, 0, 1),
(200047, 194086, 607, 1, 1, 1363.2, 235.804, 35.0499, 3.03836, 0, 0, 0.998668, 0.0515918, 60, 0, 1),
(200040, 190753, 607, 1, 1, 1379.51, -325.782, 34.7503, 0.717493, 0, 0, 0.351101, 0.936338, 60, 0, 1),
(200048, 194086, 607, 1, 1, 1379.51, -325.782, 34.7503, 0.717493, 0, 0, 0.351101, 0.936338, 60, 0, 1),
(200041, 190753, 607, 1, 1, 1376.67, -327.915, 34.7709, 0.713566, 0, 0, 0.349262, 0.937025, 60, 0, 1),
(200049, 194086, 607, 1, 1, 1376.67, -327.915, 34.7709, 0.713566, 0, 0, 0.349262, 0.937025, 60, 0, 1),
(200042, 190753, 607, 1, 1, 1373.95, -330.271, 34.7918, 0.713566, 0, 0, 0.349262, 0.937025, 60, 0, 1),
(200050, 194086, 607, 1, 1, 1373.95, -330.271, 34.7918, 0.713566, 0, 0, 0.349262, 0.937025, 60, 0, 1),
(200043, 190753, 607, 1, 1, 1371.55, -332.456, 34.8104, 0.741055, 0, 0, 0.362107, 0.932136, 60, 0, 1),
(200051, 194086, 607, 1, 1, 1371.55, -332.456, 34.8104, 0.741055, 0, 0, 0.362107, 0.932136, 60, 0, 1);

DELETE FROM `gameobject` WHERE `guid` in (200084,200085,200086);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(200084, 300000, 607, 1, 1, 1803.93, -168.457, 60.549, 2.74522, 0, 0, 0.980426, 0.196889, 250000, 0, 1),
(200085, 300000, 607, 1, 1, 1803.71, 118.601, 59.8234, 3.56313, 0, 0, 0.97787, -0.209212, 250000, 0, 1),
(200086, 184719, 607, 1, 1, 1200.67, -67.87, 70.08, 6.28297, 0, 0, 0.000106724, -1, 250000, 0, 1);

REPLACE INTO battleground_template VALUES(9,15,15,0,0,0,0);

-- [C115] creature_spells.sql
ALTER TABLE creature_template
  ADD COLUMN `spell5` mediumint(8) unsigned NOT NULL default '0' AFTER `spell4`,
  ADD COLUMN `spell6` mediumint(8) unsigned NOT NULL default '0' AFTER `spell5`,
  ADD COLUMN `spell7` mediumint(8) unsigned NOT NULL default '0' AFTER `spell6`,
  ADD COLUMN `spell8` mediumint(8) unsigned NOT NULL default '0' AFTER `spell7`;

-- [C121] creature_energy.sql
ALTER TABLE creature_template
  ADD COLUMN `PowerType` tinyint(3) unsigned NOT NULL default '0' AFTER `MaxHealth`;

####
# Custom/Backports (author: mangos)
####

-- 10197_01_mangos_playercreateinfo.sql
ALTER TABLE playercreateinfo
  ADD COLUMN orientation float NOT NULL default '0' AFTER position_z;

-- 10203_01_mangos_item_template.sql
ALTER TABLE item_template
  CHANGE COLUMN Faction Flags2 int(10) unsigned NOT NULL default '0';

-- 10205_01_mangos_spell_area.sql
DELETE FROM spell_area WHERE spell = 58600;

-- 10207_01_mangos_npc_vendor.sql
UPDATE npc_vendor
  SET ExtendedCost = abs(ExtendedCost) WHERE ExtendedCost < 0;

ALTER TABLE npc_vendor
  CHANGE COLUMN `ExtendedCost` `ExtendedCost` mediumint(8) unsigned NOT NULL default '0';

-- 10208_01_mangos_playercreateinfo.sql
UPDATE playercreateinfo SET orientation= 5.696318 WHERE race=4 and class<>6;
UPDATE playercreateinfo SET orientation= 6.177156 WHERE race=3 and class<>6;
UPDATE playercreateinfo SET orientation= 2.70526 WHERE race=5 and class<>6;
UPDATE playercreateinfo SET orientation= 5.316046 WHERE race=10 and class<>6;
UPDATE playercreateinfo SET orientation= 2.083644 WHERE race=11 and class<>6;
UPDATE playercreateinfo SET orientation= 3.659973 WHERE class=6;

-- 10217_01_mangos_playercreateinfo_spell.sql
DELETE FROM playercreateinfo_spell WHERE spell=1843 ;
DELETE FROM playercreateinfo_spell WHERE spell=21084;
	-- humans
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(1, 1, 68398, 'Opening'),
(1, 2, 20154, 'Seal of Righteousness'),
(1, 2, 68398, 'Opening'),
(1, 4, 68398, 'Opening'),
(1, 5, 68398, 'Opening'),
(1, 8, 68398, 'Opening'),
(1, 8, 71761, 'Deep Freeze Immunity State'),
(1, 9, 18822, 'Improved Enslave Demon'),
(1, 9, 68398, 'Opening'),
(1, 9, 75445, 'Demonic Immolate');

	-- dwarf
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(3, 1, 68398, 'Opening'),
(3, 2, 20154, 'Seal of Righteousness'),
(3, 2, 68398, 'Opening'),
(3, 3, 68398, 'Opening'),
(3, 4, 68398, 'Opening'),
(3, 5, 68398, 'Opening');

	-- night elfs
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(4, 1, 21009, 'Elusiveness'),
(4, 1, 68398, 'Opening'),
(4, 3, 21009, 'Elusiveness'),
(4, 3, 68398, 'Opening'),
(4, 4, 21009, 'Elusiveness'),
(4, 4, 68398, 'Opening'),
(4, 5, 21009, 'Elusiveness'),
(4, 5, 68398, 'Opening'),
(4, 11, 66530, 'Improved Barkskin (Passive)'),
(4, 11, 68398, 'Opening');

	-- gnome
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(7, 1, 68398, 'Opening'),
(7, 4, 68398, 'Opening'),
(7, 8, 68398, 'Opening'),
(7, 8, 71761, 'Deep Freeze Immunity State'),
(7, 9, 18822, 'Improved Enslave Demon'),
(7, 9, 68398, 'Opening'),
(7, 9, 75445, 'Demonic Immolate');

	-- orc
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(2, 1, 68398, 'Opening'),
(2, 3, 68398, 'Opening'),
(2, 4, 68398, 'Opening'),
(2, 7, 65222, 'Command'),
(2, 7, 68398, 'Opening'),
(2, 7, 75461, 'Flame Shock Passive'),
(2, 9, 18822, 'Improved Enslave Demon'),
(2, 9, 68398, 'Opening'),
(2, 9, 75445, 'Demonic Immolate');

	-- undead
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(5, 1, 68398, 'Opening'),
(5, 4, 68398, 'Opening'),
(5, 5, 68398, 'Opening'),
(5, 8, 68398, 'Opening'),
(5, 8, 71761, 'Deep Freeze Immunity State'),
(5, 9, 18822, 'Improved Enslave Demon'),
(5, 9, 68398, 'Opening'),
(5, 9, 75445, 'Demonic Immolate');

	-- tauren 
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(6, 1, 68398, 'Opening'),
(6, 3, 68398, 'Opening'),
(6, 7, 68398, 'Opening'),
(6, 7, 75461, 'Flame Shock Passive'),
(6, 11, 66530, 'Improved Barkskin (Passive)'),
(6, 11, 68398, 'Opening');

	-- troll
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(8, 1, 68398, 'Opening'),
(8, 3, 68398, 'Opening'),
(8, 4, 68398, 'Opening'),
(8, 5, 68398, 'Opening'),
(8, 7, 68398, 'Opening'),
(8, 7, 75461, 'Flame Shock Passive'),
(8, 8, 68398, 'Opening'),
(8, 8, 71761, 'Deep Freeze Immunity State');

	-- bloodelf
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(10, 2, 20154, 'Seal of Righteousness'),
(10, 2, 68398, 'Opening'),
(10, 3, 68398, 'Opening'),
(10, 4, 68398, 'Opening'),
(10, 5, 68398, 'Opening'),
(10, 8, 68398, 'Opening'),
(10, 9, 18822, 'Improved Enslave Demon'),
(10, 9, 68398, 'Opening'),
(10, 9, 75445, 'Demonic Immolate');

	-- drarenei
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(11, 1, 68398, 'Opening'),
(11, 2, 20154, 'Seal of Righteousness'),
(11, 2, 68398, 'Opening'),
(11, 3, 68398, 'Opening'),
(11, 5, 68398, 'Opening'),
(11, 7, 68398, 'Opening'),
(11, 7, 75461, 'Flame Shock Passive'),
(11, 8, 68398, 'Opening'),
(11, 8, 71761, 'Deep Freeze Immunity State');

	-- dk 
INSERT IGNORE INTO playercreateinfo_spell (race, class, Spell, Note) VALUES 
(1, 6, 68398, 'Opening'),
(2, 6, 68398, 'Opening'),
(3, 6, 68398, 'Opening'),
(4, 6, 68398, 'Opening'),
(5, 6, 68398, 'Opening'),
(6, 6, 68398, 'Opening'),
(7, 6, 68398, 'Opening'),
(8, 6, 68398, 'Opening'),
(10, 6, 68398, 'Opening'),
(11, 6, 68398, 'Opening');

-- 10217_02_mangos_playercreateinfo_action.sql
DELETE FROM playercreateinfo_action WHERE action  IN (117, 21084, 159, 2070, 4540);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (1, 1, 1, 78, 0),
 (1, 1, 9, 59752, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (1, 2, 1, 20154, 0);

DELETE FROM playercreateinfo_action WHERE class=5 AND race=1 AND button IN (0,1,2);
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (1, 5, 0, 585, 0),
 (1, 5, 1, 2050, 0);

DELETE FROM playercreateinfo_action WHERE class=8 AND race=1 AND button IN (0,1,2);
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (1, 8, 0, 133, 0),
 (1, 8, 1, 168, 0);

DELETE FROM playercreateinfo_action WHERE class=9 AND race=1 AND button IN (0,1,2);
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (1, 9, 0, 686, 0),
 (1, 9, 1, 687, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (2, 1, 1, 78, 0),
 (2, 1, 2, 20572, 0);

DELETE FROM playercreateinfo_action where race=2 AND class=9;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (2, 9, 0, 686, 0),
 (2, 9, 1, 687, 0),
 (2, 9, 2, 33702, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (3, 1, 2, 20594, 0),
 (3, 1, 3, 2481, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (3, 2, 1, 20154, 0);

DELETE FROM playercreateinfo_action WHERE class=5 AND race=3 AND button IN (0,1,2,3,4);
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (3, 5, 0, 585, 0),
 (3, 5, 1, 2050, 0),
 (3, 5, 2, 20594, 0),
 (3, 5, 3, 2481, 0);

DELETE FROM playercreateinfo_action WHERE class=1 AND race=4;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (4, 1, 0, 6603, 0),
 (4, 1, 1, 78, 0),
 (4, 1, 108, 6603, 0),
 (4, 1, 2, 58984, 0),
 (4, 1, 72, 6603, 0),
 (4, 1, 73, 78, 0),
 (4, 1, 74, 58984, 0),
 (4, 1, 84, 6603, 0),
 (4, 1, 96, 6603, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (4, 3, 81, 58984, 0);

DELETE FROM playercreateinfo_action WHERE race=4 AND class=4 AND button=10;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (4, 4, 4, 58984, 0);

DELETE FROM playercreateinfo_action WHERE race=4 AND class=5 ;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (4, 5, 0, 585, 0),
 (4, 5, 1, 2050, 0),
 (4, 5, 2, 58984, 0),
 (4, 5, 81, 58984, 0);

DELETE FROM playercreateinfo_action WHERE race=4 AND class=11 ;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (4, 11, 0, 5176, 0),
 (4, 11, 1, 5185, 0),
 (4, 11, 108, 6603, 0),
 (4, 11, 2, 58984, 0),
 (4, 11, 72, 6603, 0),
 (4, 11, 74, 58984, 0),
 (4, 11, 84, 6603, 0),
 (4, 11, 96, 6603, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (5, 1, 1, 78, 0),
 (5, 1, 2, 20577, 0);

DELETE FROM playercreateinfo_action where race=5 AND class=8;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (5, 8, 0, 133, 0),
 (5, 8, 1, 168, 0),
 (5, 8, 2, 20577, 0);

DELETE FROM playercreateinfo_action where race=5 AND class=9;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (5, 9, 0, 686, 0),
 (5, 9, 1, 687, 0),
 (5, 9, 2, 20577, 0);

DELETE FROM playercreateinfo_action where race=5 AND class=5;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (5, 5, 0, 585, 0),
 (5, 5, 1, 2050, 0),
 (5, 5, 2, 20577, 0);

UPDATE playercreateinfo_action SET button=2 WHERE race=6 AND class=1 AND button=3;
UPDATE playercreateinfo_action SET button=75 WHERE race=6 AND class=3 AND button=76;
UPDATE playercreateinfo_action SET button=75 WHERE race=6 AND class=7 AND button=76;

DELETE FROM playercreateinfo_action WHERE race=6 AND class=11;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (6, 11, 0, 5176, 0),
 (6, 11, 1, 5185, 0),
 (6, 11, 108, 6603, 0),
 (6, 11, 2, 20549, 0),
 (6, 11, 72, 6603, 0),
 (6, 11, 75, 20549, 0),
 (6, 11, 84, 6603, 0),
 (6, 11, 96, 6603, 0);

DELETE FROM playercreateinfo_action WHERE race=7 AND class=1 AND button in (82,10);
DELETE FROM playercreateinfo_action WHERE race=7 AND class=4 AND button in (10);
DELETE FROM playercreateinfo_action WHERE race=7 AND class=8;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (7, 8, 0, 133, 0),
 (7, 8, 1, 168, 0);

DELETE FROM playercreateinfo_action WHERE race=7 AND class=9;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (7, 9, 0, 686, 0),
 (7, 9, 1, 687, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (8, 1, 1, 78, 0),
 (8, 1, 2, 26297, 0);

INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (8, 4, 76, 26297, 0);

DELETE FROM playercreateinfo_action WHERE race=8 AND class=5;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (8, 5, 0, 585, 0),
 (8, 5, 1, 2050, 0),
 (8, 5, 2, 26297, 0);

DELETE FROM playercreateinfo_action WHERE race=8 AND class=8;
INSERT IGNORE INTO playercreateinfo_action (race, class, button, action, type) VALUES
 (8, 8, 0, 133, 0),
 (8, 8, 1, 168, 0),
 (8, 8, 2, 26297, 0);

-- 10217_03_mangos_spell_learn_spell.sql
	-- 21084 replace of 20154 at learn judgements
DELETE FROM spell_learn_spell WHERE SpellID = 21084;
INSERT INTO spell_learn_spell VALUES
(20271,21084,1),
(53407,21084,1),
(53408,21084,1);

-- 10217_04_mangos_spell_chain.sql
	-- 21084 replace of 20154 at learn judgements
DELETE FROM spell_chain WHERE first_spell = 20154;
INSERT INTO spell_chain VALUES
(20154,0,20154,1,0),
(21084,20154,20154,2,0);

-- 10217_05_mangos_spell_proc_event.sql
DELETE FROM `spell_proc_event` WHERE entry in (20154, 21084);
INSERT INTO `spell_proc_event` VALUES
(20154, 0x01,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0);

-- 10252_01_mangos_reputation_reward_rate.sql
DROP TABLE IF EXISTS `reputation_reward_rate`;
CREATE TABLE `reputation_reward_rate` (
  `faction` mediumint(8) unsigned NOT NULL default '0',
  `quest_rate` float NOT NULL default '1',
  `creature_rate` float NOT NULL default '1',
  `spell_rate` float NOT NULL default '1',
  PRIMARY KEY  (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 10270_01_mangos_reputation_spillover_template.sql
DROP TABLE IF EXISTS `reputation_spillover_template`;
CREATE TABLE `reputation_spillover_template` (
  `faction` smallint(6) unsigned NOT NULL default '0' COMMENT 'faction entry',
  `faction1` smallint(6) unsigned NOT NULL default '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL default '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint(3) unsigned NOT NULL default '0' COMMENT 'max rank, above this will not give any spillover',
  `faction2` smallint(6) unsigned NOT NULL default '0',
  `rate_2` float NOT NULL default '0',
  `rank_2` tinyint(3) unsigned NOT NULL default '0',
  `faction3` smallint(6) unsigned NOT NULL default '0',
  `rate_3` float NOT NULL default '0',
  `rank_3` tinyint(3) unsigned NOT NULL default '0',
  `faction4` smallint(6) unsigned NOT NULL default '0',
  `rate_4` float NOT NULL default '0',
  `rank_4` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';

-- 10289_01_mangos_creature_template.sql
ALTER TABLE creature_template CHANGE COLUMN modelid_A modelid_1 mediumint(8) unsigned NOT NULL default '0';
ALTER TABLE creature_template CHANGE COLUMN modelid_A2 modelid_2 mediumint(8) unsigned NOT NULL default '0';
ALTER TABLE creature_template CHANGE COLUMN modelid_H modelid_3 mediumint(8) unsigned NOT NULL default '0';
ALTER TABLE creature_template CHANGE COLUMN modelid_H2 modelid_4 mediumint(8) unsigned NOT NULL default '0';

UPDATE creature_template SET modelid_3=0 WHERE entry=1;

-- 10289_02_mangos_creature_model_info.sql
ALTER TABLE creature_model_info ADD COLUMN modelid_alternative mediumint(8) unsigned NOT NULL default '0' AFTER modelid_other_gender;
ALTER TABLE creature_model_info ADD COLUMN modelid_other_team mediumint(8) unsigned NOT NULL default '0' AFTER modelid_alternative;

-- 10299_01_mangos_event_id_scripts.sql
DROP TABLE IF EXISTS `event_id_scripts`;
CREATE TABLE `event_id_scripts` (
  `id` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Script library scripted events';

-- 10307_01_mangos_instance_template.sql
ALTER TABLE instance_template CHANGE COLUMN `script` `ScriptName` varchar(128) NOT NULL default '';

-- 10307_02_mangos_scripted_areatrigger.sql
RENAME TABLE areatrigger_scripts TO scripted_areatrigger;

-- 10307_03_mangos_scripted_event_id.sql
RENAME TABLE event_id_scripts TO scripted_event_id;
