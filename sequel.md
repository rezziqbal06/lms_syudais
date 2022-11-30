# Tambah/Update column di b_user
ALTER TABLE `b_user` CHANGE `utype` `utype` ENUM('sales','reseller','member','kustomer') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kustomer' COMMENT 'jenis akun';

# Tambah/Update column di a_company
ALTER TABLE `a_company` ADD `kode` VARCHAR(28) NOT NULL AFTER `nama`;

ALTER TABLE `a_company` ADD `website` VARCHAR(128) NOT NULL AFTER `domain`, ADD `instagram` VARCHAR(56) NOT NULL AFTER `website`, ADD `linkedin` VARCHAR(255) NOT NULL AFTER `instagram`;

ALTER TABLE `a_company` ADD `email` VARCHAR(56) NOT NULL AFTER `kode`;

# Tambah/Update column apikey di b_user
ALTER TABLE `b_user` ADD `apikey` VARCHAR(28) NOT NULL DEFAULT '' AFTER `device`, ADD `is_deleted` INT(1) NOT NULL DEFAULT '0' AFTER `is_active`;

# Tambah/Update column apikey di b_user_alamat
ALTER TABLE `b_user_alamat` ADD `kode_origin` VARCHAR(28) NOT NULL DEFAULT '' AFTER `kodepos`, ADD `kode_destination` VARCHAR(56) NOT NULL DEFAULT '' AFTER `kode_origin`, ADD `is_deleted` INT(1) NOT NULL DEFAULT '0' AFTER `is_active`;

# Tambah/Update column di c_order
ALTER TABLE `c_order` ADD `b_user_id_penerima` INT(4) NULL DEFAULT NULL AFTER `b_user_id_agen`, ADD INDEX (`b_user_id_penerima`)
, `c_order` CHANGE `is_do_balik` `is_drop_shipper` INT(1) NOT NULL DEFAULT '0', `c_order` ADD `is_deleted` INT(1) NOT NULL DEFAULT '0' AFTER `is_active`, ADD `kode` VARCHAR(20) NOT NULL AFTER `b_user_id_penerima`;

ALTER TABLE `c_order` ADD `service` VARCHAR(8) NOT NULL AFTER `layanan`, ADD `json_value` TEXT NOT NULL AFTER `service`;

ALTER TABLE `c_order` ADD `kode_branch` INT(10) NOT NULL AFTER `json_value`, ADD `is_cod` INT(1) NOT NULL DEFAULT '0' AFTER `kode_branch`;

ALTER TABLE `c_order` ADD `harga_paket` DECIMAL(18,2) NOT NULL AFTER `kode_branch`, ADD `harga_cod` DECIMAL(18,2) NOT NULL AFTER `harga_paket`;

ALTER TABLE `c_order` ADD `no_tiket` VARCHAR(255) NOT NULL AFTER `no_resi`;

ALTER TABLE `c_order` ADD `udate` DATETIME NULL DEFAULT NULL AFTER `cdate`;

# Tambah/Update column di d_barang
ALTER TABLE `d_barang` ADD `is_packing_wood` INT(1) NOT NULL DEFAULT '0' AFTER `is_asuransi`, `d_barang` ADD `is_deleted` INT(1) NOT NULL DEFAULT '0' AFTER `is_active`;

# Tambah/Update Column di a_destination
ALTER TABLE `a_destination` ADD `is_active` INT(1) NOT NULL DEFAULT '1' AFTER `code`, ADD `is_deleted` INT(1) NOT NULL DEFAULT '0' AFTER `is_active`;