ALTER TABLE creature_template CHANGE COLUMN modelid_A modelid_1 mediumint(8) unsigned NOT NULL default '0';
ALTER TABLE creature_template CHANGE COLUMN modelid_A2 modelid_2 mediumint(8) unsigned NOT NULL default '0';
ALTER TABLE creature_template CHANGE COLUMN modelid_H modelid_3 mediumint(8) unsigned NOT NULL default '0';
ALTER TABLE creature_template CHANGE COLUMN modelid_H2 modelid_4 mediumint(8) unsigned NOT NULL default '0';

UPDATE creature_template SET modelid_3=0 WHERE entry=1;
