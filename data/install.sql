--
-- Base Table
--
CREATE TABLE `import` (
  `Import_ID` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `import`
  ADD PRIMARY KEY (`Import_ID`);

ALTER TABLE `import`
  MODIFY `Import_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Permissions
--
INSERT INTO `permission` (`permission_key`, `module`, `label`, `nav_label`, `nav_href`, `show_in_menu`) VALUES
('add', 'OnePlace\\Import\\Controller\\ImportController', 'Add', '', '', 0),
('edit', 'OnePlace\\Import\\Controller\\ImportController', 'Edit', '', '', 0),
('index', 'OnePlace\\Import\\Controller\\ImportController', 'Index', 'Imports', '/import', 1),
('list', 'OnePlace\\Import\\Controller\\ApiController', 'List', '', '', 1),
('view', 'OnePlace\\Import\\Controller\\ImportController', 'View', '', '', 0),
('dump', 'OnePlace\\Import\\Controller\\ExportController', 'Excel Dump', '', '', 0),
('index', 'OnePlace\\Import\\Controller\\SearchController', 'Search', '', '', 0);

--
-- Form
--
INSERT INTO `core_form` (`form_key`, `label`, `entity_class`, `entity_tbl_class`) VALUES
('import-single', 'Import', 'OnePlace\\Import\\Model\\Import', 'OnePlace\\Import\\Model\\ImportTable');

--
-- Index List
--
INSERT INTO `core_index_table` (`table_name`, `form`, `label`) VALUES
('import-index', 'import-single', 'Import Index');

--
-- Tabs
--
INSERT INTO `core_form_tab` (`Tab_ID`, `form`, `title`, `subtitle`, `icon`, `counter`, `sort_id`, `filter_check`, `filter_value`) VALUES ('import-base', 'import-single', 'Import', 'Base', 'fas fa-cogs', '', '0', '', '');

--
-- Buttons
--
INSERT INTO `core_form_button` (`Button_ID`, `label`, `icon`, `title`, `href`, `class`, `append`, `form`, `mode`, `filter_check`, `filter_value`) VALUES
(NULL, 'Save Import', 'fas fa-save', 'Save Import', '#', 'primary saveForm', '', 'import-single', 'link', '', ''),
(NULL, 'Edit Import', 'fas fa-edit', 'Edit Import', '/import/edit/##ID##', 'primary', '', 'import-view', 'link', '', ''),
(NULL, 'Add Import', 'fas fa-plus', 'Add Import', '/import/add', 'primary', '', 'import-index', 'link', '', ''),
(NULL, 'Export Imports', 'fas fa-file-excel', 'Export Imports', '/import/export', 'primary', '', 'import-index', 'link', '', ''),
(NULL, 'Find Imports', 'fas fa-searh', 'Find Imports', '/import/search', 'primary', '', 'import-index', 'link', '', ''),
(NULL, 'Export Imports', 'fas fa-file-excel', 'Export Imports', '#', 'primary initExcelDump', '', 'import-search', 'link', '', ''),
(NULL, 'New Search', 'fas fa-searh', 'New Search', '/import/search', 'primary', '', 'import-search', 'link', '', '');

--
-- Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_list`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'text', 'Name', 'label', 'import-base', 'import-single', 'col-md-3', '/import/view/##ID##', '', 0, 1, 0, '', '', '');

--
-- User XP Activity
--
INSERT INTO `user_xp_activity` (`Activity_ID`, `xp_key`, `label`, `xp_base`) VALUES
(NULL, 'import-add', 'Add New Import', '50'),
(NULL, 'import-edit', 'Edit Import', '5'),
(NULL, 'import-export', 'Edit Import', '5');

COMMIT;