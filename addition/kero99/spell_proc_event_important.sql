DELETE FROM `spell_proc_event` WHERE `entry` IN (71562, 71519);
INSERT INTO `spell_proc_event` VALUES ('71562', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('71519', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');
UPDATE `spell_proc_event` SET `SpellFamilyMask1` =  0x08000000 WHERE `entry` = 55666;

-- Next NPCs needs for correct work of Deathbringer's Will's bonuses (only visual)

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38273, 0, 0, 0, 0, 0, 23643, 23653, 23643, 23653, 'Taunka', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38292, 0, 0, 0, 0, 0, 23643, 23653, 23643, 23653, 'Taunka', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (38271, 0, 0, 0, 0, 0, 22251, 0, 22251, 0, 'Vrykul', '', '', 0, 79, 79, 12175, 12175, 0, 0, 9431, 1954, 1954, 0, 1, 1.14286, 1, 0, 404, 606, 0, 151, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 323, 485, 121, 7, 0, 29370, 29370, 0, 0, 0, 0, 0, 0, 0, 52701, 0, 0, 0, 0, 2122, 2122, '', 0, 3, 1, 1, 0, 42105, 0, 0, 0, 0, 0, 0, 1, 857, 0, 0, '');