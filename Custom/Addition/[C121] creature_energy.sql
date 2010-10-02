ALTER TABLE creature_template
  ADD COLUMN `PowerType` tinyint(3) unsigned NOT NULL default '0' AFTER `MaxHealth`;