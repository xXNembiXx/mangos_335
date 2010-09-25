############################################################################
#
#							SQL	Updatepack
#							realm database
#
#							  25-09-2010
#
############################################################################


####
# addition (author: insider42)
####

-- 132_characters_character_battleground_random.sql
DROP TABLE IF EXISTS `character_battleground_random`;
CREATE TABLE `character_battleground_random` (
  `guid` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 132_characters_saved_variables.sql
ALTER TABLE `saved_variables` ADD COLUMN `NextRandomBGResetTime` bigint(40) unsigned NOT NULL default '0' AFTER `NextWeeklyQuestResetTime`;


####
# Custom/Addition (author: janu)
####

-- [C78] ticket_system_characters.sql
	-- new ticket system

ALTER TABLE `character_ticket` ADD COLUMN `closed` smallint(1) unsigned DEFAULT '0' NOT NULL AFTER `ticket_lastchange`;
ALTER TABLE `character_ticket` ADD COLUMN `assigned_guid` INT(11) UNSIGNED DEFAULT '0' NOT NULL AFTER `closed`;
ALTER TABLE `character_ticket` ADD COLUMN `assigned_sec_level` TINYINT(3) DEFAULT '0' NOT NULL AFTER `assigned_guid`;


####
# Custom/Backports (author: mangos)
####

-- 10254_01_characters_auctionhouse.sql
ALTER TABLE auctionhouse
  ADD COLUMN houseid int(11) unsigned NOT NULL default '0' AFTER id;

UPDATE auctionhouse, mangos.creature AS c, mangos.creature_template AS ct
  SET houseid = 
    CASE ct.faction_A
      WHEN   12 THEN 1 /* human                                  */
      WHEN   29 THEN 6 /* orc, and generic for horde             */
      WHEN   55 THEN 2 /* dwarf/gnome, and generic for alliance  */
      WHEN   68 THEN 4 /* undead                                 */
      WHEN   80 THEN 3 /* n-elf                                  */
      WHEN  104 THEN 5 /* trolls                                 */
      WHEN  120 THEN 7 /* booty bay, neutral                     */
      WHEN  474 THEN 7 /* gadgetzan, neutral                     */
      WHEN  534 THEN 2 /* Alliance Generic                       */
      WHEN  855 THEN 7 /* everlook, neutral                      */
      WHEN 1604 THEN 6 /* b-elfs,                                */
      WHEN 1638 THEN 2 /* exodar, alliance                       */
      ELSE 0           /* auction will canceled at loading       */
    END
  WHERE auctionhouse.auctioneerguid = c.guid AND c.id = ct.entry;


ALTER TABLE auctionhouse
  DROP COLUMN auctioneerguid;

DROP TABLE IF EXISTS auction;
RENAME TABLE auctionhouse TO auction;
